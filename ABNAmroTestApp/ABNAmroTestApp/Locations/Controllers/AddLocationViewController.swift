//
//  AddLocationViewController.swift
//  ABNAmroTestApp
//
//  Created by Vishal on 7/3/21.
//

import UIKit

protocol LocationDelegate: AnyObject {
    func add(location: Location)
}

final class AddLocationViewController: UIViewController {

    @IBOutlet private weak var inputName: UITextField!
    @IBOutlet private weak var inputLat: UITextField!
    @IBOutlet private weak var inputLong: UITextField!
    
    var viewModel: AddLocationViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Location"
    }
    
    private func validateUserInput() -> String? {
        if inputName.text == "" {
            return "Please enter name"
        } else if inputLat.text == "" {
            return "Please enter latitude"
        } else if inputLong.text == "" {
            return "Please enter longitude"
        } else {
            return nil
        }
    }

    @IBAction private func saveAction(_ sender: UIButton) {
        
        if let error = validateUserInput() {
            alert(error)
        } else {
            guard let name = inputName.text,
                  let lat = inputLat.text,
                  let long = inputLong.text,
                  let latDouble = Double(lat),
                  let longDouble = Double(long) else {
                print("Input is not valid")
                alert("Input is not valid")
                return
            }
            viewModel?.saveAction(name, lat: latDouble, long: longDouble)
            viewModel?.popToLocationsScreen()
        }
    }
    
    func alert(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
