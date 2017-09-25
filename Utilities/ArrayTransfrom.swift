//
//  ArrayTransfrom.swift
//  Country
//
//  Created by quy on 9/25/17.
//  Copyright © 2017 quy. All rights reserved.
//


import ObjectMapper


//class ArrayTransform<T> : TransformType where T: BaseMapple {
//    
//    typealias Object = [T]
//    typealias JSON = Array<AnyObject>
//    
//    let mapper = Mapper<T>()
//    
//    func transformFromJSON(_ value: Any?) -> Object? {
//        let result = mapper.mapArray(JSONArray: value as! [[String : Any]])
//        
//        return result
//    }
//    
//    // transformToJson was replaced with a solution by @zendobk from https://gist.github.com/zendobk/80b16eb74524a1674871
//    // to avoid confusing future visitors of this gist. Thanks to @marksbren for pointing this out (see comments of this gist)
//    func transformToJSON(_ value: Object?) -> JSON? {
//        let results = [AnyObject]()
//        
//        return results
//    }
//}
