//
//  ListWeatherTableViewCell.swift
//  OpenWeather
//
//  Created by jung on 12/4/2566 BE.
//

import UIKit

class ListWeatherTableViewCell: UITableViewCell {

    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    static var identifier: String {
        return String(describing: self)
    }
    
    let borderView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = UIScreen.main.bounds.width * 0.04
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let humidityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        self.addSubview(borderView)
        borderView.addSubviews([dateLabel, tempLabel, humidityLabel])
        
        self.addConstraints(with: "V:[v0(\(screenWidth * 0.2))]", to: borderView)
        self.addConstraints(with: "H:[v0(\(screenWidth * 0.9))]", to: borderView)
        borderView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        borderView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        borderView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        
        //temp
        borderView.addConstraints(with: "V:[v0]", to: tempLabel)
        borderView.addConstraints(with: "H:[v0]", to: tempLabel)
        tempLabel.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 10).isActive = true
        tempLabel.leftAnchor.constraint(equalTo: borderView.leftAnchor, constant: 10).isActive = true
        
        //hum
        borderView.addConstraints(with: "V:[v0]", to: humidityLabel)
        borderView.addConstraints(with: "H:[v0]", to: humidityLabel)
        humidityLabel.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 10).isActive = true
        humidityLabel.rightAnchor.constraint(equalTo: borderView.rightAnchor, constant: -10).isActive = true
        
        //date
        borderView.addConstraints(with: "V:[v0]", to: dateLabel)
        borderView.addConstraints(with: "H:[v0]", to: dateLabel)
        dateLabel.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: -10).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: tempLabel.leftAnchor).isActive = true
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
