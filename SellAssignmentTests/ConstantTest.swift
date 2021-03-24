//
//  ConstantTest.swift
//  SellAssignmentTests
//
//  Created by Thejeswara Reddy on 24/03/21.
//

import XCTest
@testable import SellAssignment

struct UserTest{
    let user = User(emailID: "test@email.com")
    
    let model = UserModel(id: 1, name: "Test name", username: "Test username", email: "test@email.com", address: Address(street: "Test street", suite: "Test suite", city: "Test city", zipcode: "Test zipcode", geo:Geo(lat: "1.11", lng: "1.23")), phone: "Test phonenumber", website: "Test website", company: Company(name: "Test companyName", catchPhrase: "Test catchPharse", bs: "Test bs"))
}
