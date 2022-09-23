//
//  Page2ViewController.swift
//  WeatherApp
//
//  Created by Surawit Supornrutai on 23/9/2565 BE.
//

import UIKit

class Page2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    var data:[dataWeather] = []

    @IBOutlet weak var titles: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        table.refreshControl = UIRefreshControl()
        self.table.backgroundColor = UIColor.white
        
        titles.text = "Weather Of \(data[0].name)"
        
        print("data : \(data)")
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        cell.date.text = "Date : \(data.fullDate)"
        cell.main.text = "Weather : \(data.weather)"
        cell.des.text = "Description : \(data.description)"
        cell.temp.text = "Temp : \(data.temp) °C"
        cell.humidity.text = "Humidity : \(data.hum) %"
        return cell
    }
    
    @IBAction func pressBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
