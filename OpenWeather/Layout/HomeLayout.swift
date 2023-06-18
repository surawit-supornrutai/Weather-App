//
//  HomeLayout.swift
//  OpenWeather
//
//  Created by jung on 11/4/2566 BE.
//

import UIKit

class HomeLayout: UIViewController {

    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    let titleLable: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Please fill city"
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Temperature  F"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let humidityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Humidity  %"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let cityTF: UITextField = {
        let txf = UITextField()
        txf.placeholder = "Please fill your city"
        txf.backgroundColor = .white
        txf.layer.borderWidth = 1
        txf.layer.borderColor = UIColor.black.cgColor
        txf.font = UIFont.systemFont(ofSize: 15)
        txf.layer.cornerRadius = UIScreen.main.bounds.width * 0.04
        txf.setPadding(left: 15)
        return txf
    }()
    
    let submitButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Enter", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.backgroundColor = UIColor(hex: "EFF3F8")
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.cornerRadius = UIScreen.main.bounds.width * 0.04
        btn.isEnabled = false
        return btn
    }()
    
    let convertTempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Convert Temperature"
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    let celsiusTF: UITextField = {
        let txf = UITextField()
        txf.placeholder = "Please fill Temp"
        txf.backgroundColor = .white
        txf.layer.borderWidth = 1
        txf.layer.borderColor = UIColor.black.cgColor
        txf.font = UIFont.systemFont(ofSize: 15)
        txf.layer.cornerRadius = UIScreen.main.bounds.width * 0.04
        txf.keyboardType = .decimalPad
        txf.setPadding(left: 15)
        return txf
    }()
    
    let cLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "C"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let fahrenheitTF: UITextField = {
        let txf = UITextField()
        txf.placeholder = "Please fill Temp"
        txf.backgroundColor = .white
        txf.layer.borderWidth = 1
        txf.layer.borderColor = UIColor.black.cgColor
        txf.font = UIFont.systemFont(ofSize: 15)
        txf.layer.cornerRadius = UIScreen.main.bounds.width * 0.04
        txf.keyboardType = .decimalPad
        txf.setPadding(left: 15)
        return txf
    }()
    
    let fLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "F"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let convertButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Convert", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.backgroundColor = UIColor(hex: "EFF3F8")
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.cornerRadius = UIScreen.main.bounds.width * 0.04
        btn.isEnabled = false
        return btn
    }()
    
    let nextPageButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Next", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.backgroundColor = UIColor(hex: "EFF3F8")
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.cornerRadius = UIScreen.main.bounds.width * 0.04
        btn.isEnabled = false
        return btn
    }()
    
    func setUpViewLayout(){
        view.backgroundColor = .white
        
        view.addSubview(titleLable)
        view.addSubviews([tempLabel, humidityLabel])
        view.addSubview(cityTF)
        view.addSubview(submitButton)
        
        view.addSubview(convertTempLabel)
        view.addSubviews([celsiusTF, cLabel, fahrenheitTF, fLabel])
        view.addSubview(convertButton)
        
        view.addSubview(nextPageButton)
        
        //title
        view.addConstraints(with: "V:|-top-[v0]", to: titleLable, topPadding: 60)
        view.addConstraints(with: "H:[v0]", to: titleLable)
//        titleLable.topAnchor.constraint(equalTo: view.topAnchor,constant: 50).isActive = true
        titleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        //tempLabel
        view.addConstraints(with: "V:[v0]", to: tempLabel)
        view.addConstraints(with: "H:[v0]", to: tempLabel)
        tempLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor,constant: 10).isActive = true
        tempLabel.leftAnchor.constraint(equalTo: cityTF.leftAnchor).isActive = true
        
        //humidityLabel
        view.addConstraints(with: "V:[v0]", to: humidityLabel)
        view.addConstraints(with: "H:[v0]", to: humidityLabel)
        humidityLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor,constant: 10).isActive = true
        humidityLabel.leftAnchor.constraint(equalTo: cityTF.leftAnchor).isActive = true
        
        //city
        view.addConstraints(with: "V:[v0(\(screenWidth * 0.13))]", to: cityTF)
        view.addConstraints(with: "H:[v0(\(screenWidth * 0.9))]", to: cityTF)
        cityTF.topAnchor.constraint(equalTo: humidityLabel.bottomAnchor,constant: 30).isActive = true
        cityTF.centerXAnchor.constraint(equalTo: titleLable.centerXAnchor).isActive = true
        
        //button
        view.addConstraints(with: "V:[v0(\(screenWidth * 0.13))]", to: submitButton)
        view.addConstraints(with: "H:[v0(\(screenWidth * 0.9))]", to: submitButton)
        submitButton.topAnchor.constraint(equalTo: cityTF.bottomAnchor,constant: 20).isActive = true
        submitButton.centerXAnchor.constraint(equalTo: cityTF.centerXAnchor).isActive = true
        
        //covert
        view.addConstraints(with: "V:[v0]", to: convertTempLabel)
        view.addConstraints(with: "H:[v0]", to: convertTempLabel)
        convertTempLabel.topAnchor.constraint(equalTo: submitButton.bottomAnchor,constant: 40).isActive = true
        convertTempLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // celsius
        view.addConstraints(with: "V:[v0(\(screenWidth * 0.13))]", to: celsiusTF)
        view.addConstraints(with: "H:[v0(\(screenWidth * 0.36))]", to: celsiusTF)
        celsiusTF.topAnchor.constraint(equalTo: convertTempLabel.bottomAnchor,constant: 30).isActive = true
        celsiusTF.leftAnchor.constraint(equalTo: submitButton.leftAnchor).isActive = true
        
        //C label
        view.addConstraints(with: "V:[v0]", to: cLabel)
        view.addConstraints(with: "H:[v0]", to: cLabel)
        cLabel.centerYAnchor.constraint(equalTo: celsiusTF.centerYAnchor).isActive = true
        cLabel.leftAnchor.constraint(equalTo: celsiusTF.rightAnchor, constant: 10).isActive = true
        
        // fahrenheit
        view.addConstraints(with: "V:[v0(\(screenWidth * 0.13))]", to: fahrenheitTF)
        view.addConstraints(with: "H:[v0(\(screenWidth * 0.36))]", to: fahrenheitTF)
        fahrenheitTF.centerYAnchor.constraint(equalTo: celsiusTF.centerYAnchor).isActive = true
        fahrenheitTF.rightAnchor.constraint(equalTo: fLabel.leftAnchor, constant: -10).isActive = true
        
        //F Label
        view.addConstraints(with: "V:[v0]", to: fLabel)
        view.addConstraints(with: "H:[v0]", to: fLabel)
        fLabel.centerYAnchor.constraint(equalTo: fahrenheitTF.centerYAnchor).isActive = true
        fLabel.rightAnchor.constraint(equalTo: convertButton.rightAnchor).isActive = true
        
        //convert button
        view.addConstraints(with: "V:[v0(\(screenWidth * 0.13))]", to: convertButton)
        view.addConstraints(with: "H:[v0(\(screenWidth * 0.9))]", to: convertButton)
        convertButton.topAnchor.constraint(equalTo: fahrenheitTF.bottomAnchor,constant: 20).isActive = true
        convertButton.centerXAnchor.constraint(equalTo: titleLable.centerXAnchor).isActive = true

        //nextpagebutton
        view.addConstraints(with: "V:[v0(\(screenWidth * 0.13))]-bottom-|", to: nextPageButton, bottomPadding: 30)
        view.addConstraints(with: "H:[v0(\(screenWidth * 0.9))]", to: nextPageButton)
        nextPageButton.centerXAnchor.constraint(equalTo: titleLable.centerXAnchor).isActive = true
    }
}
