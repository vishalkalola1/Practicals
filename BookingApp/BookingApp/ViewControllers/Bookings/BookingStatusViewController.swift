//
//  BookingStatusViewController.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import UIKit

///Change selected Booking Status Delegate
protocol ChangeBookingStatusDelegate {
    func changeBookingStatus() -> Void
}


///Change selected Booking Status
class BookingStatusViewController: UIViewController {

    var viewModelBookings : BookingsViewModel?
    
    var delegate : ChangeBookingStatusDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func confirmAction(_ sender: CustomButton) {
        viewModelBookings?.selectedBooking?.status = .confirmed
        self.dismiss()
    }
    
    @IBAction func waitingAction(_ sender: CustomButton) {
        viewModelBookings?.selectedBooking?.status = .waiting
        self.dismiss()
    }
    @IBAction func cancleAction(_ sender: CustomButton) {
        viewModelBookings?.selectedBooking?.status = .cancel
        self.dismiss()
    }
    @IBAction func closeAction(_ sender: CustomButton) {
        self.dismiss()
    }
    
    func dismiss() -> Void {
        delegate?.changeBookingStatus()
        self.dismiss(animated: true, completion: nil)
    }
}
