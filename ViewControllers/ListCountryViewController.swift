//
//  ListCountryViewController.swift
//  Country
//
//  Created by quy on 9/25/17.
//  Copyright © 2017 quy. All rights reserved.
//

import UIKit
import ObjectMapper
import Kingfisher
import SVGKit
enum TypeSearch :Int, CustomStringConvertible{
    case currency = 0
    case captital
    case lagguage
    var description: String {
        switch self {
        // Use Internationalization, as appropriate.
        case .currency: return "currency";
        case .captital: return "capital";
        case .lagguage: return "et";
        }
    }
    func getApiSearch() -> String {
        switch self {
        case .currency:
            return Constant.ApiSearchByCurrency
        case .captital:
            return Constant.ApiSearchByCapital
        case .lagguage:
            return Constant.ApiSearchBylanguage
        }
    }
    
}
class ListCountryViewController: UIViewController {
    let cellIdentifier = "ListCountryTableViewCell"
     let searchController = UISearchController(searchResultsController: nil)
    var typeSearch = TypeSearch.currency
    @IBOutlet weak var tableView: UITableView!
    var countryModels = [CountryModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib.init(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.getAllCountry()
        addSearchBar()
        addSegmentToNavBar()
        // Do any additional setup after loading the view.
    }
    private func addSearchBar(){
       
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
    }
    private func getAllCountry() {

        NetworkManager.requestGet(URLString: Constant.ApiAllCountry, parameters: nil, headers: nil).responseJSON { (response) in
            if let json = response.result.value as? [[String:Any]] {
                  self.countryModels = Mapper<CountryModel>().mapArray(JSONArray: json)
                    self.tableView.reloadData()
            }
        }
    }
    func addSegmentToNavBar(){
        let segment: UISegmentedControl = UISegmentedControl(items: ["Capital", "Currency","Langguage"])
        segment.sizeToFit()
        segment.selectedSegmentIndex = 0
       
        segment.addTarget(self, action: #selector(segmentSelected(_ :)), for: .valueChanged)
        self.navigationItem.titleView = segment
    }
    func segmentSelected(_ sender : UISegmentedControl){
       self.typeSearch = TypeSearch(rawValue: sender.selectedSegmentIndex)!
    }
    



}
extension ListCountryViewController : UISearchResultsUpdating{
    func callSearchApi(searchText : String){
        var params = [String : AnyObject]()
        params[typeSearch.description] = searchText as AnyObject
        
        NetworkManager.requestGet(URLString: typeSearch.getApiSearch(), parameters: params, headers: nil).responseJSON { (response) in
            if let json = response.result.value as? [[String:Any]] {
               let searchModels = Mapper<CountryModel>().mapArray(JSONArray: json)
                if(searchModels.count > 0){
                    self.countryModels = searchModels
                     self.tableView.reloadData()
                }
               
            }
        }
    }
    func updateSearchResults(for searchController: UISearchController) {
        
            if let searchText = searchController.searchBar.text, !searchText.isEmpty {
                
                self.callSearchApi(searchText: searchText)
               
        }
    }
}
extension ListCountryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ListCountryTableViewCell
        let countryModel = self.countryModels[indexPath.row]
        cell.nameCountry.text =  "name : \(countryModel.name)"
        cell.area.text = "area : \(countryModel.area)"
        cell.population.text = "population : \(countryModel.population)"
        cell.capital.text  = "capital : \(countryModel.capital)"
        
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 2
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectCountry = self.countryModels[indexPath.row]
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailCountryViewController") as! DetailCountryViewController
        detailVC.countryModel  = selectCountry
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countryModels.count
    }

}
