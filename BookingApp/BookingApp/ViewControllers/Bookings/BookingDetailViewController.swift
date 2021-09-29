//
//  BooingDetailTableViewController.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import UIKit

class BookingDetailViewController: UIViewController {
    
    var viewModelBookings: BookingsViewModel?
    var name : DetailsView!
    var email : DetailsView!
    var gender : DetailsView!
    var status : DetailsView!
    var phone : DetailsView!
    var button : UIButton!
    var stackview : UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = USERDETAILS
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.drawUI()
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
            super.viewWillTransition(to: size, with: coordinator)
            DispatchQueue.main.async {
                self.drawUI()
            }
    }
    
    @objc func statuschange(_ sender : UIButton) {
        showChangeStatus()
    }
    
    /// Go to `BookingStatusViewController` for change booking
    func showChangeStatus() {
        let objBookingStatusViewController = BookingStatusViewController(nibName: "BookingStatusViewController", bundle: nil)
        objBookingStatusViewController.viewModelBookings = viewModelBookings
        objBookingStatusViewController.delegate = self
        self.present(objBookingStatusViewController, animated: true, completion: nil)
    }
}
///Create UI and Fill Data by using below Methods
extension BookingDetailViewController {
    func filldata() -> Void {
        guard let viewModelBookings = viewModelBookings  else {
            return
        }
        name.setValuesText(viewModelBookings.selectedBooking?.user.fullname ?? "")
        email.setValuesText(viewModelBookings.selectedBooking?.user.email ?? "")
        gender.setValuesText(viewModelBookings.selectedBooking?.user.gender.rawValue ?? "")
        status.setValuesText(viewModelBookings.selectedBooking?.status.rawValue ?? "")
        status.valueLabel.textColor = viewModelBookings.selectedBooking?.status.color
        phone.setValuesText(viewModelBookings.selectedBooking?.user.phone ?? "")
    }
    
    func drawUI() -> Void {
        if stackview != nil {
            stackview.removeFromSuperview()
        }
        stackview = createstackview(.vertical)
        name = createDetails(NOM, y: self.view.safeAreaInsets.top + 10)
        email = createDetails(EMAIL, y: name.frame.maxY)
        gender = createDetails(GENDER,y:email.frame.maxY)
        status = createDetails(BOOKINGSSTATUS, y:gender.frame.maxY)
        phone = createDetails(NUMBER, y: status.frame.maxY)
        button = createButton()
        
        self.view.addSubview(stackview)
        stackview.addSubview(name)
        stackview.addSubview(email)
        stackview.addSubview(gender)
        stackview.addSubview(status)
        stackview.addSubview(phone)
        stackview.addSubview(button)
        
        self.view.addconstraints(stackview)
    
        self.filldata()
    }
}

///Create view and reuse it
extension BookingDetailViewController {
    func createstackview(_ axis : NSLayoutConstraint.Axis, alignment : UIStackView.Alignment = .fill, distribution:UIStackView.Distribution = .fill ) -> UIStackView {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = alignment
        stackview.distribution = distribution
        return stackview
    }
    
    func createButton() -> UIButton {
        let button = UIButton(frame: CGRect.init(x: 20, y: phone.frame.maxY + 10, width: phone.frame.width - 40, height: 40))
        button.addTarget(self, action: #selector(statuschange(_:)), for: .touchUpInside)
        button.setTitle(CHANGESTATUS, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.backgroundColor = .brown
        return button
    }
    
    func createDetails(_ name: String, y: CGFloat) -> DetailsView {
        let label = DetailsView()
        label.frame = CGRect.init(x: 0, y: y, width: self.view.frame.width-20, height: 35)
        label.setNameText("\(name) :")
        return label
    }
}

///Calling delegate method to update status of details
extension BookingDetailViewController: ChangeBookingStatusDelegate {
    func changeBookingStatus() {
        self.filldata()
    }
}
