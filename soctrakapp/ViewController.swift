//
//  ViewController.swift
//  soctrakapp
//
//  Created by John Richardson on 12/1/16.
//  Copyright © 2016 John Richardson. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getPartnerships()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getPartnerships() {
        let partnershipsEndpoint: String = "http://localhost:5000/v1/partnerships/2"
        Alamofire.request(partnershipsEndpoint)
            .responseJSON { response in
                // check for errors
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling GET on \(partnershipsEndpoint)")
                    print(response.result.error!)
                    return
                }
                
                // make sure we got some JSON since that's what we expect
                guard let json = response.result.value as? [String: Any] else {
                    print("didn't get partnership object as JSON from API")
                    print("Error: \(response.result.error)")
                    return
                }
                
                // get and print the title
                guard let partnershipUserId = json["user_id"] as? Int else {
                    print("Could not get todo title from JSON")
                    return
                }
                print("The user_id is: \(partnershipUserId)")
        }
    }
}

