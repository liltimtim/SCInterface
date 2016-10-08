import UIKit
import XCTest
import SCInterface

class TTInterfaceTest: XCTestCase {
    private let oauthToken = "1-239336-3131975-b4032bf6756018c"
    func testSearchForTracksEnsureResultsReturned() {
        let exp = expectation(description: "Get a list of tracks via searching")
        _ = TTInterface.shared.search(searchTerm: "test", success: { (tracks) in
            XCTAssertGreaterThan(tracks.count, 0)
            guard let firstTrack = tracks.first else {
                XCTFail()
                exp.fulfill()
                return
            }
            print("First track id \(firstTrack.id)")
            print("First Track owner id \(firstTrack.ownerId)")
            TTInterfaceTest.validateTrack(track: firstTrack)
            guard let profile = firstTrack.user else {
                XCTFail("No user profile with track")
                exp.fulfill()
                return
            }
            TTInterfaceTest.validateProfile(user: profile)
            exp.fulfill()
        }) { (error) in
            XCTFail(error.localizedDescription)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    static func validateTrack(track:Track) {
        XCTAssertNotNil(track.id)
        XCTAssertNotNil(track.ownerId)
    }
    
    static func validateProfile(user:SCProfile) {
        XCTAssertNotNil(user.id)
        XCTAssertNotNil(user.uri)
        XCTAssertNotNil(user.username)
        XCTAssertNotNil(user.permalink_url)
        XCTAssertNotNil(user.permalink)
        XCTAssertNotNil(user.avatar_url)
    }
    
    func testAuthenticate() {
        let exp = expectation(description: "Authenticate")
        TTInterface.shared.authenticate(withViewController: UIViewController())
        exp.fulfill()
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testGetActivities() {
        let exp = expectation(description: "Get me/Activities")
       let _ = TTInterface.shared.meActivities(oauthToken: oauthToken) { (activities, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(activities)
            XCTAssertNotNil(activities?.collection)
            guard let collection = activities?.collection else {
                XCTFail()
                exp.fulfill()
                return
            }
            for activity in collection {
                self.verifyActivity(activity: activity)
            }
            XCTAssertGreaterThan(collection.count, 0)
            exp.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    private func verifyActivity(activity:Activity) {
        XCTAssertNotNil(activity.origin)
        XCTAssertNotNil(activity.createdAt)
        guard let track = activity.origin else {
            XCTFail()
            return
        }
        TTInterfaceTest.validateTrack(track: track)
    }
}
