//
//  InputViewModel.swift
//  PayCoiniqPractical
//
//  Created by Vishal on 7/31/21.
//

import Foundation


class InputViewModel {
    
    private let coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func moveToPopUp(_ text: String) {
        coordinator.popUPViewController(text)
    }
    
    func addSpecialCharacterOrResuffel(_ text: String, specialCharacter: String = "-", reshuffle: Bool = false) -> String {
        var removedOccurances = text.replacingOccurrences(of: specialCharacter, with: "")
        if reshuffle {
            removedOccurances = String(removedOccurances.reversed())
        }
        var stringWithSpeciaCharacter = ""
        for (index, eachCharacter) in removedOccurances.enumerated() {
            if (index % 3 == 0) && (index != 0) {
                stringWithSpeciaCharacter.append(specialCharacter)
            }
            stringWithSpeciaCharacter += "\(eachCharacter)"
        }
        return stringWithSpeciaCharacter
    }
}
