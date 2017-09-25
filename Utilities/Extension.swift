//
//  Extension.swift
//  Country
//
//  Created by quy on 9/25/17.
//  Copyright © 2017 quy. All rights reserved.
//
import UIKit
extension UIApplication {
    func topViewController() -> UIViewController? {
        if var topViewController = UIApplication.shared.keyWindow?.rootViewController {
            while (topViewController.presentedViewController != nil) {
                topViewController = topViewController.presentedViewController!
            }
            return topViewController
        } else {
            return nil
        }
    }
}
