//
//  Partnership.swift
//  soctrakapp
//
//  Created by John Richardson on 12/6/16.
//  Copyright © 2016 John Richardson. All rights reserved.
//

import Foundation

class Partnership {
    var id: Int?
    var userId: Int
    var userName: String?
    var partnerId: Int
    var partnerName: String?
    var confirmed: Bool
    
    required init?(id: Int?, userId: Int, userName: String?, partnerId: Int, partnerName: String?, confirmed: Bool) {
        self.id = id
        self.userId = userId
        self.userName = userName
        self.partnerId = partnerId
        self.partnerName = partnerName
        self.confirmed = confirmed
    }
    
    func description() -> String {
        return "ID: \(self.id), " +
            "User ID: \(self.userId), " +
            "User Name: \(self.userName), " +
            "Partner ID: \(self.partnerId), " +
            "Partner Name: \(self.partnerName), " +
            "Confirmed: \(self.confirmed)\n"
    }
}
