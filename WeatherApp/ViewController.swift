//
//  ViewController.swift
//  WeatherApp
//
//  Created by Surawit Supornrutai on 23/9/2565 BE.
//

import UIKit
import Alamofire
import SDWebImage

struct dataWeather{
    var name: String
    var temp: Double
    var hum: Double
    var date: String
    var img: String
    var fullDate: String
    var weather: String
    var description: String
}

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humLabel: UILabel!
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var enterCity: UIButton!
    
    @IBOutlet weak var celsiusTextField: UITextField!
    @IBOutlet weak var fahTextField: UITextField!
    @IBOutlet weak var enterCelsius: UIButton!
    
    @IBOutlet weak var goNextPage: UIButton!
    
    @IBOutlet weak var errorCity: UILabel!
    @IBOutlet weak var errorCelsius: UILabel!
    
    var dataAll:[dataWeather] = []
    var q: String = "Bangkok"
    var appid: String = "8cb8bf5ff12d5239fd40845434aa6a61"
    var statusHide:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTextField.delegate = self
        celsiusTextField.delegate = self
        fahTextField.isEnabled = false
        
        self.getCurrentWeather()
        
        customButton()
        
    }
    
    //function for customAddButton
    func customButton(){
        enterCity.layer.shadowColor = UIColor.gray.cgColor
        enterCity.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        enterCity.layer.shadowOpacity = 1.0
        enterCelsius.layer.shadowColor = UIColor.gray.cgColor
        enterCelsius.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        enterCelsius.layer.shadowOpacity = 1.0
    }
    
    @IBAction func gonextPage(_ sender: Any) {
        let nameStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = nameStoryboard.instantiateViewController(withIdentifier: "Page2ViewController") as! Page2ViewController
        vc.data = dataAll
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func pressEnterCity(_ sender: Any) {
        if cityTextField.text != ""{
            q = cityTextField.text!
            errorCity.isHidden = true
            self.getCurrentWeather()
        }else{
            errorCity.isHidden = false
            cityTextField.text = ""
        }
    }
    
    @IBAction func pressEnterCelsius(_ sender: Any) {
        //F = 1.80(C) + 32
        if celsiusTextField.text != ""{
            let cel = Double(celsiusTextField.text!)
            fahTextField.text = "\((1.8*cel!) + 32) °F"
            errorCelsius.isHidden = true
        }else{
            errorCelsius.isHidden = false
            fahTextField.text = ""
        }
    }
    
    
    //function for hide keyboard when touch in UIView
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //function for return keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    
    private func getCurrentWeather(){
        
        var sURL: String!
        sURL = "https://api.openweathermap.org/data/2.5/weather?q=\(self.q)&appid=\(self.appid)"
        print("Connect to API....")
        
        let serializer = DataResponseSerializer(emptyResponseCodes:Set([200,204,205]))
        
        var request = URLRequest(url: (URL(string: sURL)!))
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("text/plain; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        
        AF.request(request).uploadProgress{
            progress in
        }.response(responseSerializer: serializer){
            response in
            if (response.error == nil){
                if (response.data != nil){
                    let json = response.value!
                    let data = Data(json)
                    do {
                        let jsonn = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                        
                        let main = jsonn["main"] as! NSDictionary
                        var temp = main["temp"] as! Double
                        temp = temp - 273.15
                        temp = round(temp * 10) / 10.0
                        let hum = main["humidity"] as! Double
                        
                        var img = ""
                        
                        for weather in jsonn["weather"] as! [NSDictionary]{
                            img = weather["icon"] as! String
                        }
                        
                        self.tempLabel.text = "\(temp) °C"
                        self.humLabel.text = "\(hum) %"
                        self.weatherImage.sd_setImage(with: URL(string: "https://openweathermap.org/img/wn/\(img)@2x.png"))
                        self.errorCity.isHidden = true
                        self.errorCelsius.isHidden = true
                        self.getWeather()
                    }catch{
                        print("Unexpected error: \(error).")
                    }
                }
            }
        }
    }
    private func getWeather(){
        
        var sURL: String!
        sURL = "https://api.openweathermap.org/data/2.5/forecast?q=\(self.q)&appid=\(self.appid)"
        
        let serializer = DataResponseSerializer(emptyResponseCodes:Set([200,204,205]))
        
        var request = URLRequest(url: URL(string: sURL)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("text/plain; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        
        AF.request(request).uploadProgress{
            progress in
        }.response(responseSerializer: serializer){
            response in
            if (response.error == nil){
                if (response.data != nil){
                    let json = response.value!
                    let data = Data(json)
                    do {
                        let jsonn = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
//                        print("JSONN : \(jsonn)")
                        let city = jsonn["city"] as! NSDictionary
                        let name = city["name"]
                        self.dataAll = []
                        
                        for json in jsonn["list"] as! [NSDictionary] {
                            
                            let data = json["dt_txt"] as! String
                            let start = data.index(data.startIndex, offsetBy:8)
                            let end = data.index(data.startIndex, offsetBy:9)
                            let range = start...end
                            let newDate = String(data[range])
                            
                            let main = json["main"] as! NSDictionary
                            var temp = main["temp"] as! Double
                            temp = temp - 273.15
                            temp = round(temp * 10) / 10.0
                            let hum = main["humidity"]
                            
                            var mainW = ""
                            var descrip = ""
                            var img = ""
                            for weather in json["weather"] as! [NSDictionary]{
                                mainW = weather["main"] as! String
                                descrip = weather["description"] as! String
                                img = weather["icon"] as! String
                            }
                            
                            let date = Date()
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "dd/MM/yyyy"
                            let dateNow = dateFormatter.string(from: date)
                            let start2 = dateNow.index(dateNow.startIndex, offsetBy:0)
                            let end2 = dateNow.index(dateNow.startIndex, offsetBy:1)
                            let range2 = start2...end2
                            let currentDate = String(dateNow[range2])
                        
                            if currentDate != newDate{
                                if self.dataAll.contains(where: { $0.date == newDate }) != true{
                                    self.dataAll.append(dataWeather(name: name as! String, temp: temp , hum: hum as! Double, date: newDate, img: img ,fullDate: data, weather: mainW ,description: descrip ))
                                }
                            }
                            self.errorCity.isHidden = true
                            self.errorCelsius.isHidden = true
                        }
                    }catch{
                        print("Unexpected error: \(error).")
                    }
                }
            }
        }
    }
    
}

