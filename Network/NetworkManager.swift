//
//  NetworkManager.swift
//  Country
//
//  Created by quy on 9/25/17.
//  Copyright © 2017 quy. All rights reserved.
//

import UIKit
import Alamofire
import SystemConfiguration
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
    func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                
                SCNetworkReachabilityCreateWithAddress(nil, $0)
                
            }
            
        }) else {
            
            return false
        }

        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    func checkInternet() {
        if (!self.isConnectedToNetwork()) {
            AlertView.showAlert(message: "No country found")
            return
            
        }
    }

    
    class func requestGet(URLString: URLConvertible, parameters: [String: AnyObject]?, headers: [String: String]?, completion : @escaping (_ response : [[String:Any]]) -> ()) {
       
           let indicator = Indicator()
                indicator.show()
        
        Alamofire.request(URLString, method: .get, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
                indicator.hide()
            switch response.result {
            case .success(let JSON) :
                if let json = JSON as? [[String : Any]]{
                    completion(json)
                    return
                }
                
                AlertView.showAlert(message: "No country found")
                 break
            case .failure(let error) :
                AlertView.showAlert(message: "Request failed with error: \(error)")
                 
                break
            }
        }
    }
    
}
