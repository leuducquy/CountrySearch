//
//  Indicator.swift
//  Country
//
//  Created by quy on 9/25/17.
//  Copyright © 2017 quy. All rights reserved.
//

import Foundation
import NVActivityIndicatorView
class Indicator {
    var indicatorView: NVActivityIndicatorView!
    func show() {
         indicatorView = NVActivityIndicatorView(frame: UIScreen.main.bounds, type: .pacman, color: UIColor.red)
        indicatorView.startAnimating()

        let window = UIApplication.shared.delegate?.window
        window??.addSubview(indicatorView)

    }
    func hide() {
        indicatorView.stopAnimating()
        indicatorView.removeFromSuperview()
    }
}
