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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // MARK: Get Partnership #2
//        Partnership.partnershipByID(2) { result in
//            if let error = result.error {
//                // got an error in getting the data, need to handle it
//                print("error calling GET on /partnerships/2")
//                print(error)
//                return
//            }
//            guard let partnership = result.value else {
//                print("error calling POST on /partnerships/2 - result is nil")
//                return
//            }
//            // success!
//            print(partnership.description())
//            print(partnership.userId)
//        }
//        
//        // MARK: Create new partnership
//        guard let newPartnership = Partnership(id: nil,
//                                 userId: 6,
//                                 userName: nil,
//                                 partnerId: 11,
//                                 partnerName: nil,
//                                 confirmed: false) else {
//                                    print("error: newPartnership isn't a Partnership")
//                                    return
//        }
//        newPartnership.save { result in
//            guard result.error == nil else {
//                // got an error in getting the data, need to handle it
//                print("error calling POST on /partnerships/")
//                print(result.error!)
//                return
//            }
//            guard let partnership = result.value else {
//                print("error calling POST on /partnership/ result is nil")
//                return
//            }
//            // success!
//            print(partnership.description())
//            print(partnership.userId)
//        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

