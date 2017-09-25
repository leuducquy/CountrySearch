//
//  NetworkManager.swift
//  Country
//
//  Created by quy on 9/25/17.
//  Copyright © 2017 quy. All rights reserved.
//

import UIKit

import Alamofire
public enum Method: String {
    case options, get, heade, post
}
class NetworkManager {
    
    let manager: SessionManager = {
        // Alamofire Timeout Setting
        let configuration: URLSessionConfiguration = {
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = 30 // seconds
            configuration.timeoutIntervalForResource = 30
            return configuration
        }()
        return SessionManager(configuration: configuration)
    }()
    
    static let sharedInstance = NetworkManager()
    
    class func requestPost(URLString: URLConvertible, parameters: [String: AnyObject]?, headers: [String: String]?) -> DataRequest {
        
        return NetworkManager.sharedInstance.manager.request(URLString, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            
            if response.response?.statusCode != nil {
                if response.response!.statusCode == 401 {
                    
                    
                    
                }
            }
        }
        
    }
    class func requestGet(URLString: URLConvertible, parameters: [String: AnyObject]?, headers: [String: String]?) -> DataRequest {
        
        
        return  NetworkManager.sharedInstance.manager.request(URLString, method: .get, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            
            if response.response?.statusCode != nil {
                if response.response!.statusCode == 401 {
                    
                    
                    
                }
            }
            
        }
    }
    
}
