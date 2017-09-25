//
//  DetailCountryTableViewCell.swift
//  Country
//
//  Created by quy on 9/25/17.
//  Copyright © 2017 quy. All rights reserved.
//

import UIKit

class DetailCountryTableViewCell: UITableViewCell {
    @IBOutlet weak var flag: UIImageView!

    @IBOutlet weak var textView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
