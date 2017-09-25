//
//  DetailCountryViewController.swift
//  Country
//
//  Created by quy on 9/25/17.
//  Copyright © 2017 quy. All rights reserved.
//

import UIKit

class DetailCountryViewController: UIViewController {
    let cellidentifier = "DetailCountryTableViewCell"
    var countryModel : CountryModel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
      self.tableView.register(UINib.init(nibName: cellidentifier, bundle: nil), forCellReuseIdentifier: cellidentifier)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
extension DetailCountryViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellidentifier) as! DetailCountryTableViewCell
        let countryInfo = "name : \(countryModel.name)\ncapital : \(countryModel.capital)\npopulation : \(countryModel.population)\narea : \(countryModel.area)"
        cell.textView.text = countryInfo
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }

}
