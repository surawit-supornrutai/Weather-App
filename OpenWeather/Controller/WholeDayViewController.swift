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
        
                AF.request(url, parameters: param).validate().responseDecodable(of: DailyWeatherModel.self) { response in
                    switch response.result {
                    case.success(let result):
                        for i in 0...result.list.count-1 {
                            
                            var myDouble = Double(result.list[i].main.temp)
                            var formattedString = String(format: "%.2f", myDouble)
                            
                            let currentDate = Date()
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "yyyy-MM-dd"
                            let dateString = dateFormatter.string(from: currentDate)
                            
                            if result.list[i].dtTxt.contains(dateString) {
                                self.listDailyWeather.append(dailyWeather(day: result.list[i].dtTxt,temp: Double(formattedString)!, hum: result.list[i].main.humidity))
                            }
                            
                            
                        }
                        self.tableView.reloadData()
                    case .failure(let error):
                        print("Error: \(error.localizedDescription)")
                        // Check the error status code and display an appropriate message
                        if let statusCode = response.response?.statusCode {
                            switch statusCode {
                            case 400:
                                print("Bad request")
                            case 401:
                                print("Unauthorized")
                            case 404:
                                print("City not found")
                            default:
                                print("An error occurred")
                            }
                        }
                        self.showDialog("ไม่พบข้อมูล")
                    }
                }
    }
}
