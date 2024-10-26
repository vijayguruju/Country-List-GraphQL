//
//  MyAppTests.swift
//  MyAppTests
//
//  Created by Vijay Guruju on 23/06/24.
//

import XCTest
@testable import MyApp

final class MyAppTests: XCTestCase {
    var countryView :CountryListView?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        countryView = CountryListView()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        countryView = nil
    }

    func testExample() throws {
        XCTAssertNotNil(countryView?.viewModel.fetchCountries())
        //XCTAssertNotNil(countryView?.body)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
