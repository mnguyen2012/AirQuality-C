//
//  MNCityDetailViewController.swift
//  AirQuality ObjC
//
//  Created by Michael Nguyen on 12/2/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import UIKit

class MNCityDetailViewController: UIViewController {
    
    var country: String?
    var state: String?
    var city: String?
    
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var stateNameLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var airQualityIndexLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let city = city, let state = state, let country = country else { return }
        MNCityAirQualityController.fetchData(forCity: city, state: state, country: country) { (cityDetails) in
            if let details = cityDetails {
                self.updateViews(with: details)
            }
        }
    }
    func updateViews(with cityDetails: MNCityAirQuality) {
        DispatchQueue.main.async {
            self.cityNameLabel.text = cityDetails.city
            self.stateNameLabel.text = cityDetails.state
            self.countryNameLabel.text = cityDetails.country
            self.temperatureLabel.text = "\(cityDetails.weather.temperature)"
            self.humidityLabel.text = "\(cityDetails.weather.humidity)"
            self.airQualityIndexLabel.text = "\(cityDetails.pollution.airQualityIndex)"
            self.windSpeedLabel.text = "\(cityDetails.weather.windSpeed)"
        }
    }
}
