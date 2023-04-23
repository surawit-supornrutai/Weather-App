//
//  ViewController.swift
//  OpenWeather
//
//  Created by jung on 11/4/2566 BE.
//

import UIKit
import Alamofire
import AlamofireImage
import Foundation

class ViewController: HomeLayout {
    
    var cityID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewLayout()
        hideKeyboardWhenTappedAroundTableView()
        
                setupDelegate()
        
                submitButton.addTarget(self, action: #selector(pressAcceptButton), for: .touchUpInside)
                convertButton.addTarget(self, action: #selector(convertTemp), for: .touchUpInside)
                nextPageButton.addTarget(self, action: #selector(goNextVC), for: .touchUpInside)
        

    }
    
    func setupDelegate() {
        cityTF.delegate = self
        celsiusTF.delegate = self
        fahrenheitTF.delegate = self
    }
    
    @objc func pressAcceptButton(){
        getCurrentWeather()
    }
    
    @objc func convertTemp(){
        
        if celsiusTF.text!.isEmpty {
            let celsius = (Double(fahrenheitTF.text!)! - 32) * (5 / 9)
            celsiusTF.text = String(celsius)
            convertButton.backgroundColor = .red
            convertButton.setTitle("Clear", for: .normal)
        } else if fahrenheitTF.text!.isEmpty {
            let fahrenheit = (Double(celsiusTF.text!)! * (9 / 5)) + 32
            fahrenheitTF.text = String(fahrenheit)
            convertButton.backgroundColor = .red
            convertButton.setTitle("Clear", for: .normal)
        } else {
            celsiusTF.text = ""
            fahrenheitTF.text = ""
            convertButton.disableButtonRegister(btn: convertButton)
            convertButton.setTitle("Convert", for: .normal)
            
        }
        
    }
    
    @objc func goNextVC(){
        let vc = WholeDayViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.cityName = cityTF.text ?? ""
        vc.cityID = cityID
        self.present(vc, animated: true)
    }
    
}

extension ViewController {
    func getCurrentWeather() {
        
        let url = "\(Connection.getAPI(apiName: Connection.API_get_current))"
        
        let param = [
            "q" : cityTF.text ?? "Bangkok",
            "appid" : Connection.APIKey
        ] as [String : Any]
        
        AF.request(url,parameters: param).validate().responseDecodable(of: CurrentWeatherModel.self) { (response) in
            switch response.result {
            case.success(let result):
                if result.cod == 200 {
                    self.titleLable.text = result.name
                    self.tempLabel.text = "Temperature \(result.main.temp) F"
                    self.humidityLabel.text = "Humidity \(result.main.humidity) %"
                    self.cityID = result.id
                    self.nextPageButton.enableButtonRegister(btn: self.nextPageButton)
                } else {
                    self.showDialog("ไม่พบข้อมูล")
                    self.nextPageButton.disableButtonRegister(btn: self.nextPageButton)
                }
            case .failure(_):
                self.showDialog("ไม่พบข้อมูล")
                self.nextPageButton.disableButtonRegister(btn: self.nextPageButton)
            }
            
        }
        
    }
}

extension UIViewController {
    func showDialog(_ msg: String){
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "ตกลง", style: .default, handler: { (action: UIAlertAction!) in
            self.dismiss(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if !cityTF.text!.isEmpty {
            submitButton.enableButtonRegister(btn: submitButton)
        } else {
            submitButton.disableButtonRegister(btn: submitButton)
        }
        
        if !celsiusTF.text!.isEmpty || !fahrenheitTF.text!.isEmpty {
            convertButton.enableButtonRegister(btn: convertButton)
        } else {
            convertButton.disableButtonRegister(btn: convertButton)
        }
    }
}
