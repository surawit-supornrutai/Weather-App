//
//  WholeDayLayout.swift
//  OpenWeather
//
//  Created by jung on 11/4/2566 BE.
//

import UIKit

class WholeDayLayout: UIViewController {

    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Whole Day"
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    let backButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Back", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.black.cgColor
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.layer.cornerRadius = UIScreen.main.bounds.width * 0.04
        return btn
    }()
    
    let tableView: UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .grouped)
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = UITableView.automaticDimension
        return table
    }()
    
    func setUpViewLayout(){
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        view.addSubview(backButton)
        view.addSubview(tableView)
        
        //title
        view.addConstraints(with: "V:|-top-[v0]", to: titleLabel, topPadding: 60)
        view.addConstraints(with: "H:[v0]", to: titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        //button
        view.addConstraints(with: "V:[v0(\(screenWidth * 0.13))]", to: backButton)
        view.addConstraints(with: "H:[v0(\(screenWidth * 0.2))]", to: backButton)
        backButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        backButton.leftAnchor.constraint(equalTo: tableView.leftAnchor, constant: 10).isActive = true
        
        //table
        view.addConstraints(with: "V:[v0]|", to: tableView)
        view.addConstraints(with: "H:|[v0]|", to: tableView)
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
    }
}
