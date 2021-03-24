//
//  SellAssignmentTests.swift
//  SellAssignmentTests
//
//  Created by Thejeswara Reddy on 22/03/21.
//

import XCTest
@testable import SellAssignment

class SellAssignmentTests: XCTestCase {
    
    private let userVM = UserDetailVM()
    private let user = UserTest().user
    private let userModel = UserTest().model

    func testFetchUsersFromServer(){
        let expectations = expectation(description: "fetchUsersFromServer")
        AppServerClient.shared.getWeatherData(url: usersURL) { (result) in
            switch result{
            case .success(let _result):
                XCTAssertNotNil(_result)
                XCTAssert(_result?.count != 0, "Invalid users")
                expectations.fulfill()
            case .failure(_):
                break
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testUsersReturnInvalidResponse(){
        let expectations = expectation(description: "usersReturnErrorResponse")
        AppServerClient.shared.getWeatherData(url: userErrorURL) { (result) in
            switch result{
            case .success(_):
                break
            case .failure(let _error):
                XCTAssertNotNil(_error.rawValue)
                XCTAssertEqual(_error.rawValue, 404)
                expectations.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testUserModel_ShouldNotNill(){
        XCTAssertNotNil(userModel)
        XCTAssertEqual(userModel.email, "test@email.com")
        XCTAssertEqual(userModel.id, 1)
        XCTAssertEqual(userModel.company.name, "Test companyName")
    }
    // Checking emailID is added as favorite or not, if not added as favorite then adding as favorite
    func testUserAddedAsFavorite(){
        if !userVM.isUseraddedAsFavorite(user: user){
            let userData = userVM.addToFavorites(user: user)
            XCTAssertTrue(userData)
        }
    }
    
    // If user is already added as favorite below test is removed added user as from favorites
    func testUnfavoriteUser(){
        if userVM.isUseraddedAsFavorite(user: user){
            let userData = userVM.deleteFavorite(user: user)
            XCTAssertTrue(userData)
        }
    }
}
