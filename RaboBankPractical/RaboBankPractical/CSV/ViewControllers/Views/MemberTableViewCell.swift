//
//  ListTableViewCell.swift
//  RaboBankPractical
//
//  Created by Vishal on 7/14/21.
//
import UIKit

final class MemberTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var issueLabel: UILabel!
    @IBOutlet weak var issueStackView: UIStackView!
    @IBOutlet weak var parentStackView: UIView!
    
    override func awakeFromNib() {
        issueStackView.layer.cornerRadius = 10
        issueStackView.layer.borderWidth = 1
        issueStackView.layer.borderColor = UIColor.red.cgColor
        
        parentStackView.layer.cornerRadius = 10
        parentStackView.layer.shadowColor = UIColor.black.cgColor
        parentStackView.layer.shadowRadius = 3.0
        parentStackView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        parentStackView.layer.shadowOpacity = 0.3
    }
    
    func config(_ viewModel: MemberViewModel) {
        nameLabel.text = viewModel.fullName
        dobLabel.attributedText = NSMutableAttributedString().bold("Birthdate: ").normal(viewModel.dateOfBirth?.UTCToLocal(incomingFormat: "YYYY-MM-DD'T'hh:mm:ss", outGoingFormat: "DD/MMM/YYYY") ?? "")
        issueLabel.text = "\(viewModel.issueCount ?? 0)"
    }
}


