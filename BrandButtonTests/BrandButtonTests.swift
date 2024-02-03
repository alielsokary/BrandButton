//
//  BrandButtonTests.swift
//  BrandButtonTests
//
//  Created by Ali Elsokary on 30/01/2024.
//

import XCTest
@testable import BrandButton

final class BrandButtonTests: XCTestCase {
    
    var sut: BrandButton!
    
    override func setUpWithError() throws {
        super.setUp()
        sut = BrandButton()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func testConfigurationForPrimaryVariant() {
        sut.variant = .primary
        sut.style = .mainBlue
        
        XCTAssertEqual(sut.backgroundColor, DS.Colors.Button.defaultBlue)
        XCTAssertEqual(sut.layer.borderColor, UIColor.clear.cgColor)
        XCTAssertEqual(sut.titleColor(for: .normal), DS.Colors.Button.neutralsWhite)
    }
}
