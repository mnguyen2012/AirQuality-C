//
//  MNCountriesListViewController.swift
//  AirQuality ObjC
//
//  Created by Michael Nguyen on 12/2/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import UIKit

class MNCountriesListViewController: UIViewController {

    var countries: [String] = [] {
        didSet{
            updateViews()
        }
    }
    
    @IBOutlet weak var countryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countryTableView.delegate = self;
        countryTableView.dataSource = self;
        
        MNCityAirQualityController.fetchSupportedCountries { (countries) in
            if let countries = countries {
                self.countries = countries
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStatesVC"
        {
            guard let indexPath = countryTableView.indexPathForSelectedRow,
                  let destinationVC = segue.destination as? MNStatesListViewController
            else { return }
            
            let selectedCountry = countries[indexPath.row]
            destinationVC.country = selectedCountry
        }
    }
    
    func updateViews() {
        DispatchQueue.main.async {
            self.countryTableView.reloadData()
        }
    }
}
extension MNCountriesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        let country = countries[indexPath.row]
        cell.textLabel?.text = country
        return cell
    }
}
