//
//  DetailsView.swift
//  BookingApp
//
//  Created by Vishal on 5/17/21.
//  Copyright © 2021 zenchef. All rights reserved.
//

import UIKit


///Create DetailsView to show details of users
class DetailsView: UIView {
    
    var namelabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        return label
    }()
    var valueLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(self.namelabel)
        addSubview(self.valueLabel)
        
        valueLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for: .horizontal)
        addconstraints(namelabel, valuelabel: valueLabel)
    }
    
    func setNameText(_ text: String) -> Void {
        namelabel.text = text
    }
    
    func setValuesText(_ text: String) -> Void {
        valueLabel.text = text
    }
    
    func addconstraints(_ namelabel: UILabel, valuelabel:UILabel) -> Void {
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        valuelabel.translatesAutoresizingMaskIntoConstraints = false
        
        namelabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        namelabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        namelabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        namelabel.trailingAnchor.constraint(equalTo: valuelabel.leadingAnchor, constant: -5).isActive = true
        
        valuelabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        valuelabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        valuelabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
