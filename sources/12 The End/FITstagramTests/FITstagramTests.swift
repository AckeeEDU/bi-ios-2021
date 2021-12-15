//
//  FITstagramTests.swift
//  FITstagramTests
//
//  Created by Lukáš Hromadník on 15.12.2021.
//

import XCTest
@testable import FITstagram

class FITstagramTests: XCTestCase {
    func testDummyUser() {
        let user = User.dummy
        
        XCTAssertEqual(user.username, "jan.novak")
    }
}
