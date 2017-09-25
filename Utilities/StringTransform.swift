//
//  File.swift
//  Country
//
//  Created by quy on 9/25/17.
//  Copyright © 2017 quy. All rights reserved.
//

import Foundation
import ObjectMapper

 class StringTransform: TransformType {
     typealias Object = String
     typealias JSON = Int 
   
     func transformFromJSON(_ value: Any?) -> Object? {
        if let intString = value as? Int {
            return String(intString)
        }
        return ""
    }
    
    func transformToJSON(_ value: String?) -> Int? {
        if let intValue = value {
            return Int(intValue)
        }
        return 0
    }
    
}
