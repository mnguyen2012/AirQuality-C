//
//  MNStatesListViewController.swift
//  AirQuality ObjC
//
//  Created by Michael Nguyen on 12/2/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import UIKit

class MNStatesListViewController: UIViewController {
    
    var country: String?
    var states: [String] = [] {
        didSet {
            updateTableViews()
        }
    }
    
    @IBOutlet weak var statesTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        statesTableView.delegate = self
        statesTableView.dataSource = self
        guard let country = country else { return }
        MNCityAirQualityController.fetchSupportedStates(inCountry: country) { (states) in
            if let states = states {
                self.states = states
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCitiesVC" {
            guard let indexPath = statesTableView.indexPathForSelectedRow,
                  let country = country,
                  let destinationVC = segue.destination as? MNCitiesListViewController
            else { return }
            let selectedState = states[indexPath.row]
            destinationVC.country = country
            destinationVC.state = selectedState
        }
    }
    func updateTableViews() {
        DispatchQueue.main.async {
            self.statesTableView.reloadData()
        }
    }
}
extension MNStatesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return states.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        let state = states[indexPath.row]
        cell.textLabel?.text = state
        return cell
    }
}
