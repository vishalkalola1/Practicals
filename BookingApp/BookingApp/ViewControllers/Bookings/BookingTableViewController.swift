//
//  BookingsViewController.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import UIKit

class BookingTableViewController: UITableViewController {
    
    var viewModelBookings : BookingsViewModel?
    var client = Client()
    var tabController : CustomTabViewController? {
        return self.splitViewController?.tabBarController as? CustomTabViewController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = BOOKINGS
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModelBookings = tabController?.bookingViewModel
    }
    
    func showDetails() {
        let detailViewController = BookingDetailViewController()
        detailViewController.viewModelBookings = viewModelBookings
        self.splitViewController?.showDetailViewController(detailViewController, sender: nil)
    }
}

extension BookingTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelBookings?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        guard let booking = viewModelBookings?.objectAt(indexPath.row) else { return cell }
        cell.textLabel?.text = booking.user.firstName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let booking = viewModelBookings?.objectAt(indexPath.row) else { return }
        viewModelBookings?.selectedBooking = booking
        showDetails()
    }
}
