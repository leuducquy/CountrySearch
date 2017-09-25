//
//  LangguageModel.swift
//  Country
//
//  Created by quy on 9/25/17.
//  Copyright © 2017 quy. All rights reserved.
//


import Foundation
import ObjectMapper
class LangguageModel {
    var iso639_1: String = ""
    var iso639_2: String = ""
    var name: String = ""
    var nativeName: String = ""
    
    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        iso639_1 <- map["iso639_1"]
        name <- map["name"]
        iso639_2 <- map["iso639_2"]
        iso639_1 <- map["iso639_1"]
    }
    
}
