//
//  FileManagerCoordinator.swift
//  RaboBankPractical
//
//  Created by Vishal on 7/18/21.
//

import UIKit
import UniformTypeIdentifiers

protocol FileManagerCoordinatorType {
    var navigationController: UINavigationController { get set }
    func start(_ delegate: UIDocumentPickerDelegate)
}

final class FileManagerCoordinator: FileManagerCoordinatorType {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(_ delegate: UIDocumentPickerDelegate) {
        let supportedTypes: [UTType] = [UTType.commaSeparatedText]
        let pickerViewController = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes, asCopy: false)
        pickerViewController.delegate = delegate
        navigationController.present(pickerViewController, animated: true)
    }
}
