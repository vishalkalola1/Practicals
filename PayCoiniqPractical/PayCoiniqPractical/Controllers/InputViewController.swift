//
//  ViewController.swift
//  PayCoiniqPractical
//
//  Created by Vishal on 7/30/21.
//

import UIKit

class InputViewController: UIViewController {
    
    @IBOutlet private var textField: UITextField!
    var viewModel: InputViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getOfflineData()
        subscribeNotification()
    }
    
    private func getOfflineData() {
        if let receivedData = KeyChain.load(key: "code"){
            textField.text = String(data: receivedData, encoding: .utf8)
        }
    }
    
    private func subscribeNotification() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    @objc private func appMovedToBackground() {
        let status = KeyChain.save(key: "code", data: textField.text!.data(using: .utf8)!)
        print("status: ", status)
    }
    
    @IBAction private func popUpAction(_ sender: UIButton) {
        guard let text = textField.text,
              text != "" else { print("Please enter text"); return }
        
        viewModel.moveToPopUp(text)
    }
}

extension InputViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if self.textField == textField, let oldString = textField.text, let range = Range(range, in: oldString) {
            let newString = oldString.replacingCharacters(in: range, with: string)
            textField.text = viewModel.addSpecialCharacterOrResuffel(newString)
            return false
        } else {
            return true
        }
    }
}

extension InputViewController: ReshuffleCharacterProtocol {
    func reshuffleProtocol() {
        textField.text = resuffel()
    }
    
    private func resuffel() -> String {
        return viewModel.addSpecialCharacterOrResuffel(textField.text!, reshuffle: true)
    }
}

