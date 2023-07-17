//
//  ViewController.swift
//  MagicTravel
//
//  Created by Bandit Silachai on 17/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var contriesTableView: UITableView!
    
    var countries: [String] = [
        "United States",
        "Canada",
        "United Kingdom",
        "Germany",
        "France",
        "Italy",
        "Australia",
        "Japan",
        "China",
        "India",
    ]
    
    var countriesWithContinent: [String: String] = [
        "United States": "North America",
        "Canada": "North America",
        "United Kingdom": "Europe",
        "Germany": "Europe",
        "France": "Europe",
        "Italy": "Europe",
        "Australia": "Australia",
        "Japan": "Asia",
        "China": "Asia",
        "India": "Asia",
    ]
    
    struct Contants {
        static var cellIdentifier = "MagicCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        contriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Contants.cellIdentifier)
        
//        contriesTableView.dataSource = self
//        contriesTableView.delegate = self
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Contants.cellIdentifier, for: indexPath )
        
        var cellContentConfiguration = tableViewCell.defaultContentConfiguration()
        let countryName = countries[indexPath.row]
        cellContentConfiguration.text = countryName
        cellContentConfiguration.secondaryText = countriesWithContinent[countryName] ?? ""
        
        tableViewCell.contentConfiguration = cellContentConfiguration
        
        
        return tableViewCell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(countries[indexPath.row]) is tapped")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
