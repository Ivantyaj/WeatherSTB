//
//  ViewController.swift
//  WeatherSTB
//
//  Created by Macintosh on 4/18/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }


}

extension ViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        let urlString = "http://api.weatherstack.com/current?access_key=06c166e90818aa7aa076253281bc1e5f&query=\(searchBar.text!)"
        
        let url = URL(string: urlString)
        
        var locationName: String?
        var currentTemperature: Double?
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                
                if let location = json["location"] {
                    locationName = location["name"] as? String
                }
                
                if let current = json["current"] {
                    currentTemperature = current["temperature"] as? Double
                }
                
                DispatchQueue.main.async {
                    self.cityLabel.text = locationName
                    self.temperatureLabel.text = "\(currentTemperature!)" 
                }
                
                
                
            } catch let jsonError {
                print(jsonError)
            }
        }
        
        task.resume()
    }
    
}
