//
//  RaboBankPracticalTests.swift
//  RaboBankPracticalTests
//
//  Created by Vishal on 7/16/21.
//

import XCTest
@testable import RaboBankPractical

class MemberProfilesViewModelTests: XCTestCase {

    var viewModel: MemberProfilesViewModel!
    
    override func setUp() {
        let coordinate = AppCoordinator(navigationController: UINavigationController())
        viewModel = MemberProfilesViewModel(coordinator: coordinate)
    }
    
    func testfetchMemberProfiles() {
        let bundle = Bundle(identifier: "com.andesinfotech.RaboBankPractical")!
        let url = bundle.url(forResource: "issues", withExtension: "csv")!
        viewModel.fetchMemberProfiles(url)
        XCTAssertEqual(viewModel.members.count, 3)
    }
    
    func testNumberOfRows() {
        let bundle = Bundle(identifier: "com.andesinfotech.RaboBankPractical")!
        let url = bundle.url(forResource: "issues", withExtension: "csv")!
        viewModel.fetchMemberProfiles(url)
        XCTAssertEqual(viewModel.numberOfRows, 3)
    }
    
    func testNumberOfSections() {
        let bundle = Bundle(identifier: "com.andesinfotech.RaboBankPractical")!
        let url = bundle.url(forResource: "issues", withExtension: "csv")!
        viewModel.fetchMemberProfiles(url)
        XCTAssertEqual(viewModel.numberOfSections, 1)
    }
    
    func testMemberAtIndexPath() {
        let bundle = Bundle(identifier: "com.andesinfotech.RaboBankPractical")!
        let url = bundle.url(forResource: "issues", withExtension: "csv")!
        viewModel.fetchMemberProfiles(url)
        let indexPath = IndexPath(row: 1, section: 1)
        let actualMemberViewModel = viewModel.member(at: indexPath)
        let expectedMemberViewModel = MemberViewModel(fullName: "Fiona De Vries",
                                                      dateOfBirth: "1950-11-12T00:00:00",
                                                      issueCount: 7)
        XCTAssertEqual(actualMemberViewModel.fullName!, expectedMemberViewModel.fullName!)
        XCTAssertEqual(actualMemberViewModel.dateOfBirth!, expectedMemberViewModel.dateOfBirth!)
        XCTAssertEqual(actualMemberViewModel.issueCount!, expectedMemberViewModel.issueCount!)
    }
}
