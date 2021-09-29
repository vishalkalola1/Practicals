//
//  EagelEyePracticalTests.swift
//  EagelEyePracticalTests
//
//  Created by Vishal on 7/21/21.
//

import XCTest
@testable import EagelEyePractical

class CamerasViewModelTests: XCTestCase {
    
    var mockCamerasViewModel: MockCamerasViewModel!
    
    override func setUp() async throws {
        mockCamerasViewModel = MockCamerasViewModel()
    }
    
    func testGetCameras() {
        mockCamerasViewModel.getCameras { error in
            XCTAssertEqual(self.mockCamerasViewModel.cameras.count, 3)
        }
    }
    
    func testNumberOfRows() {
        mockCamerasViewModel.getCameras { error in
            XCTAssertEqual(self.mockCamerasViewModel.numberOfRows, 3)
        }
    }
    
    func testNumberOfSections() {
        XCTAssertEqual(self.mockCamerasViewModel.numberOfSections, 1)
    }
    
    func testCameraAt() {
        mockCamerasViewModel.getCameras { error in
            let actualResult = self.mockCamerasViewModel.camera(at: 1)
            let expectedResult = CameraTableCellViewModel(cameraModel: CameraModel(cameraId: 2, name: "test1", deviceTypeId: 1, ethMacAddress: "1", zoneId: 1, accountId: 1))
            XCTAssertEqual(actualResult.cameraModel.cameraId!, expectedResult.cameraModel.cameraId!)
            XCTAssertEqual(actualResult.cameraModel.name!, expectedResult.cameraModel.name!)
            XCTAssertEqual(actualResult.cameraModel.deviceTypeId!, expectedResult.cameraModel.deviceTypeId!)
            XCTAssertEqual(actualResult.cameraModel.ethMacAddress!, expectedResult.cameraModel.ethMacAddress!)
            XCTAssertEqual(actualResult.cameraModel.zoneId!, expectedResult.cameraModel.zoneId!)
            XCTAssertEqual(actualResult.cameraModel.accountId!, expectedResult.cameraModel.accountId!)
        }
    }
    
    func testCameraDidSelect() {
        mockCamerasViewModel.camera(didSelectAt: 1)
        XCTAssertTrue(mockCamerasViewModel.isSelect)
    }
    
    func testLogout() {
        mockCamerasViewModel.logout()
        XCTAssertTrue(mockCamerasViewModel.isLogout)
    }
}

class MockCamerasViewModel: CamerasViewModelType {
    
    var cameras: [CameraModel] = []
    
    var numberOfSections: Int {
        1
    }
    
    var numberOfRows: Int {
        return cameras.count
    }
    
    func getCameras(_ completion: @escaping reloadView) {
        let camera = CameraModel(cameraId: 1, name: "test", deviceTypeId: 1, ethMacAddress: "1", zoneId: 1, accountId: 1)
        let camera1 = CameraModel(cameraId: 2, name: "test1", deviceTypeId: 1, ethMacAddress: "1", zoneId: 1, accountId: 1)
        let camera2 = CameraModel(cameraId: 3, name: "test2", deviceTypeId: 1, ethMacAddress: "1", zoneId: 1, accountId: 1)
        cameras.append(camera)
        cameras.append(camera1)
        cameras.append(camera2)
        completion(nil)
    }
    
    func camera(at index: Int) -> CameraTableCellViewModel {
        return CameraTableCellViewModel(cameraModel: cameras[index])
    }
    
    var isSelect: Bool = false
    func camera(didSelectAt index: Int) {
        isSelect = true
    }
    
    var isLogout: Bool = false
    func logout() {
        isLogout = true
    }
}
