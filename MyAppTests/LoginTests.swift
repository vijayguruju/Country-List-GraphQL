//
//  LoginTests.swift
//  MyAppTests
//
//  Created by Vijay Guruju on 25/06/24.
//

import XCTest
@testable import MyApp

final class LoginTests: XCTestCase {
    var loginView:LoginView?
    var loginVM:LoginViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loginView = LoginView()
        loginVM = LoginViewModel(username:"vijay" ,password: "123456")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        loginView = nil
        loginVM = nil
    }
    
    func test_ValidUser() {
        let validUser = loginVM.validateUser()
        XCTAssertTrue(validUser,"Invalid user")
    }
    
    func test_InvalidUser() {
        loginVM.username = "qwerty"
        loginVM.password = "1a2a3a"
        let inValidUser = loginVM.validateUser()
        XCTAssertFalse(inValidUser)
    }
    
    func test_ValidUserName() {
        var uName = "vijay"
        let validUname = loginVM.isUsernameValid(username: uName)
        XCTAssertTrue(validUname)
        uName = "qwerty"
        let inValidUname = loginVM.isUsernameValid(username: uName)
        XCTAssertFalse(inValidUname)
    }
    
    func test_ValidPassword() {
        var pwd = "123456"
        let validPwd = loginVM.isPasswordValid(password: pwd)
        XCTAssertTrue(validPwd)
        pwd = "1a2a3a"
        let inValidPwd = loginVM.isPasswordValid(password: pwd)
        XCTAssertFalse(inValidPwd)
    }
    
    func test_LoginData() {
        let loginData: () = loginVM.fetchUserData()
        XCTAssertNotNil(loginData)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
