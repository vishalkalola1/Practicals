//
//  CSVDataViewModel.swift
//  RaboBankPractical
//
//  Created by Vishal on 7/14/21.
//

import CSVParser
import UIKit

protocol PersonsViewModelType {
    var numberOfSections: Int { get }
    var numberOfRows: Int { get }
    var delegate: RefreshViewDelegate? { get set }
    func member(at indexPath: IndexPath) -> MemberViewModel
    func fetchMemberProfiles(_ url: URL)
    func openDocumentViewController(_ delegate: UIDocumentPickerDelegate)
}

protocol RefreshViewDelegate: AnyObject {
    func load()
    func refresh()
    func error(_ error: Error)
}

final class MemberProfilesViewModel: PersonsViewModelType {
    
    private let coordinator: CoordinatorType
    weak var delegate: RefreshViewDelegate?
    
    public var members: [MemberModel] = [] {
        didSet {
            self.delegate?.refresh()
        }
    }
    
    var numberOfSections: Int {
        1
    }
    
    var numberOfRows: Int {
        members.count
    }
    
    init(coordinator: CoordinatorType) {
        self.coordinator = coordinator
    }
    
    func fetchMemberProfiles(_ url: URL) {
        let csv = CSV(url: url, delimeter: ",")
        self.delegate?.load()
        do {
            let persons = try csv.parseCSV(into: [MemberModel].self)
            self.members = persons
        } catch let error {
            self.delegate?.error(error)
        }
    }
    
    func member(at indexPath: IndexPath) -> MemberViewModel {
        let member = members[indexPath.row]
        return MemberViewModel(fullName: member.fullName,
                               dateOfBirth: member.dateOfBirth,
                               issueCount: member.issueCount)
    }
    
    func openDocumentViewController(_ delegate: UIDocumentPickerDelegate) {
        coordinator.navigateToFileManager(delegate)
    }
}
