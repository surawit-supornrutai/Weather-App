//
//  WholeDayViewController.swift
//  OpenWeather
//
//  Created by jung on 11/4/2566 BE.
//

import UIKit
import Alamofire

struct dailyWeather {
    let day: String
    let temp: Double
    let hum: Int
}

class WholeDayViewController: WholeDayLayout {
    
    var cityName = ""
    var cityID = 0
    var listDailyWeather: [dailyWeather] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewLayout()
        setupDelegate()
        getDailyWeather()
        backButton.addTarget(self, action: #selector(goBackVC), for: .touchUpInside)
    }
    
    @objc func goBackVC(){
        self.dismiss(animated: true)
    }
    
    func setupDelegate(){
        tableView.register(ListWeatherTableViewCell.self, forCellReuseIdentifier: ListWeatherTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension WholeDayViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDailyWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListWeatherTableViewCell.identifier, for: indexPath) as! ListWeatherTableViewCell
                cell.tempLabel.text = "Temperature \(listDailyWeather[indexPath.row].temp) F"
                cell.humidityLabel.text = "Humidity \(listDailyWeather[indexPath.row].hum) %"
                cell.dateLabel.text = listDailyWeather[indexPath.row].day
        return cell
    }
    
}

extension WholeDayViewController {
    func getDailyWeather() {
        
        let url = "\(Connection.getAPI(apiName: Connection.API_get_daily))"
        
        let param = [
            "q" : self.cityName,
            "appid" : Connection.APIKey
        ] as [String : Any]
        
        print("xxx param : \(param)")
        
        AF.request(url,parameters: param).validate().responseDecodable(of: DailyWeatherModel.self) { (response) in
            switch response.result {
            case.success(let result):
                if result.cod == "200" {
                    for i in 0...6 {
                        self.listDailyWeather.append(dailyWeather(day: result.list[i].dtTxt,temp: result.list[i].main.temp, hum: result.list[i].main.humidity))
                    }
                    self.tableView.reloadData()
                } else {
                    self.showDialog("ไม่พบข้อมูล")
                }
            case .failure(_):
                self.showDialog("ไม่พบข้อมูล")
            }
        }
    }
}
