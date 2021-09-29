//
//  PopupViewController.swift
//  PayCoiniqPractical
//
//  Created by Vishal on 7/30/21.
//

import UIKit

protocol ReshuffleCharacterProtocol: AnyObject {
    func reshuffleProtocol()
}

class PopupViewController: UIViewController {
    
    weak var delegate: ReshuffleCharacterProtocol?
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var discriptionLabel: UILabel!
    
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.discriptionLabel.text = text
        addGesture()
    }
    
    func addGesture(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        tapGestureRecognizer.delegate = self
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func didTapView(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction private func reshuffleAction(_ sender: UIButton) {
        delegate?.reshuffleProtocol()
        dismissAction(sender)
    }
    
    @IBAction private func dismissAction(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
}

extension PopupViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == gestureRecognizer.view
    }
}
