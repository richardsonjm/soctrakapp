//
//  STPartnershipViewController.swift
//  soctrakapp
//
//  Created by John Richardson on 12/9/16.
//  Copyright © 2016 John Richardson. All rights reserved.
//

import UIKit

class STPartnershipViewController: UIViewController {
    @IBOutlet var descriptionLabel: UILabel?

    var partnership: Partnership?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if let partnership = self.partnership {
            self.descriptionLabel?.text = "\(partnership.userName!) : \(partnership.partnerName!)"
        } else {
            self.descriptionLabel?.text = "Error: Partnership missing"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
