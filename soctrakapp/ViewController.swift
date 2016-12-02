//
//  ViewController.swift
//  soctrakapp
//
//  Created by John Richardson on 12/1/16.
//  Copyright © 2016 John Richardson. All rights reserved.
//

import UIKit

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
        guard let url = URL(string: partnershipsEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            guard error == nil else {
                print("error calling GET on \(partnershipsEndpoint)")
                print(error!)
                return
            }
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            do {
                guard let partnership = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? [String: Any] else {
                        print("error trying to convert data to JSON")
                        return
                }
                // now we have the partnerships
                // let's just print it to prove we can access it
                print("The partnership is: " + partnership.description)
                
                // the partnerships object is a dictionary
                // so we just access the user_id using the "user_id" key
                // so check for a title and print it if we have one
                guard let partnershipUserId = partnership["user_id"] as? Int else {
                    print("Could not get partnership user_id from JSON")
                    return
                }
                print("The user_id is: \(partnershipUserId)")
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        
        task.resume()
    }
}

