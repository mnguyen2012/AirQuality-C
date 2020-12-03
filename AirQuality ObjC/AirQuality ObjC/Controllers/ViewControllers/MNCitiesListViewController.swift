//
//  MNCitiesListViewController.swift
//  AirQuality ObjC
//
//  Created by Michael Nguyen on 12/2/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import UIKit

class MNCitiesListViewController: UIViewController {
    
    var state: String?
    var country: String?
    var cities: [String] = [] {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var cityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTableView.delegate = self
        cityTableView.dataSource = self
        guard let state = state, let country = country else { return }
        MNCityAirQualityController.fetchSupportedCities(inState: state, country: country) { (cities) in
            if let cities  = cities {
                self.cities = cities
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCitiesVC" {
            guard let indexPath = cityTableView.indexPathForSelectedRow,
                  let country = country,
                  let state = state,
                  let destinationVC = segue.destination as? MNCityDetailViewController
            else { return }
            let selectedCity = cities[indexPath.row]
            destinationVC.country = country
            destinationVC.state = state
            destinationVC.city = selectedCity
        }
    }
    func updateViews() {
        DispatchQueue.main.async {
            self.cityTableView.reloadData()
        }
    }
}
extension MNCitiesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        let city = cities[indexPath.row]
        cell.textLabel?.text = city
        return cell
    }
    
    
}
