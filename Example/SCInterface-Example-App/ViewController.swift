//
//  ViewController.swift
//  SCInterface-Example-App
//
//  Created by Timothy Barrett on 10/5/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import SCInterface
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(TTInterface.shared.oauth2?.accessToken)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func authenticatePressed(_ sender: AnyObject) {
        TTInterface.shared.authenticate(withViewController: self)
    }


}
