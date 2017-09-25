//
//  CurrencyModel.swift
//  Country
//
//  Created by quy on 9/25/17.
//  Copyright © 2017 quy. All rights reserved.
//

import Foundation
import ObjectMapper
class CurrencyModel {
    var code: String = ""
    var name: String = ""
    var symbol: String = ""
    
    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        name <- map["name"]
        symbol <- map["symbol"]
       
    }

}
