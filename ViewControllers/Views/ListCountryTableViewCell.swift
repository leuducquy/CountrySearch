//
//  ListCountryTableViewCell.swift
//  Country
//
//  Created by quy on 9/25/17.
//  Copyright © 2017 quy. All rights reserved.
//

import UIKit

class ListCountryTableViewCell: UITableViewCell {

    @IBOutlet weak var area: UILabel!
    @IBOutlet weak var population: UILabel!
    @IBOutlet weak var capital: UILabel!
   
    @IBOutlet weak var flag: UIImageView!
   
    @IBOutlet weak var nameCountry: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
