//
//  ViewController.swift
//  WeatherSTB
//
//  Created by Macintosh on 4/18/20.
//  Copyright © 2020 IVDEV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }


}

extension ViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let urlString = "http://api.weatherstack.com/current?access_key=06c166e90818aa7aa076253281bc1e5f&query=\(searchBar.text!)"
        
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
        }
        
        task.resume()
    }
    
}
