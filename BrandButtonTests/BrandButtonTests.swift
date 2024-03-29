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
    
    func test_configurationForPrimaryVariant_matchesPrimaryVariantSpecifications() {
        sut.variant = .primary
        sut.style = .mainBlue
        
        XCTAssertEqual(sut.backgroundColor, DS.Colors.Button.defaultBlue)
        XCTAssertEqual(sut.layer.borderColor, UIColor.clear.cgColor)
        XCTAssertEqual(sut.titleColor(for: .normal), DS.Colors.Button.neutralsWhite)
    }
    
    func test_configurationForSecondaryVariant_matchesSecondaryVariantSpecificiations() {
        sut.variant = .secondary
        sut.style = .mainBlue
        
        XCTAssertEqual(sut.backgroundColor, DS.Colors.Button.neutralsWhite)
        XCTAssertEqual(sut.layer.borderColor, DS.Colors.Button.defaultBlue.cgColor)
        XCTAssertEqual(sut.titleColor(for: .normal), DS.Colors.Button.defaultBlue)
    }
    
    func test_intrinsicContentSize_matchesButtonHeight() {
        XCTAssertEqual(sut.intrinsicContentSize.height, 44)
    }
    
    func test_fullWidthSize_matchesIntrinsicContentSizeForFullWidth() {
        sut.fullWidth = true
        XCTAssertEqual(sut.intrinsicContentSize.width, UIScreen.main.bounds.width)
    }
    
    func test_intrinsicContentSize_matchesRegularSize() {
        sut.size = .regular
        XCTAssertEqual(sut.intrinsicContentSize.width, 139)
        XCTAssertEqual(sut.intrinsicContentSize.height, 44)
    }
    
    func test_intrinsicContentSize_matchesMediumSize() {
        sut.size = .medium
        XCTAssertEqual(sut.intrinsicContentSize.width, 175)
        XCTAssertEqual(sut.intrinsicContentSize.height, 44)
    }
    
    func testSetLeadingIcon() {
        let leadingIcon = UIImage(systemName: "star.fill")
        sut.leadingIcon = leadingIcon
        
        XCTAssertNotNil(sut.leadingIcon)
        XCTAssertEqual(sut.leadingIcon, leadingIcon)
    }
    
    func testSetTrailingIcon() {
        let trailingIcon = UIImage(systemName: "star.fill")
        sut.trailingIcon = trailingIcon
        
        XCTAssertNotNil(sut.trailingIcon)
        XCTAssertEqual(sut.trailingIcon, trailingIcon)
    }
    
    func test_sutState_isEnabled() {
        sut.variant = .primary
        sut.style = .mainGreen
        sut.isEnabled = true
        
        XCTAssertEqual(sut.backgroundColor, DS.Colors.Button.defaultGreen)
        XCTAssertEqual(sut.layer.borderColor, UIColor.clear.cgColor)
        XCTAssertEqual(sut.titleColor(for: .normal), DS.Colors.Button.neutralsWhite)
    }
    
    func test_sutState_isHighlighted() {
        sut.variant = .secondary
        sut.style = .mainGreen
        sut.isEnabled = true
        sut.isHighlighted = true
        
        XCTAssertEqual(sut.backgroundColor, DS.Colors.Button.backgroundGreen)
        XCTAssertEqual(sut.layer.borderColor, DS.Colors.Button.highlightedGreen.cgColor)
        XCTAssertEqual(sut.titleColor(for: .normal), DS.Colors.Button.highlightedGreen)
    }
    
    func test_sutState_isDisabled() {
        sut.variant = .primary
        sut.style = .mainGreen
        sut.isEnabled = false
        sut.isHighlighted = false
        
        XCTAssertEqual(sut.backgroundColor, DS.Colors.Button.backgroundDisabled)
        XCTAssertEqual(sut.layer.borderColor, UIColor.clear.cgColor)
        XCTAssertEqual(sut.titleColor(for: .normal), DS.Colors.Button.neutralsWhite)
    }
    
    func test_sutDisabledState_isTheSameOnTheSameVariantWithDifferentStyles() {
        sut.variant = .primary
        sut.style = .mainGreen
        sut.isEnabled = false
        sut.isHighlighted = false
        
        XCTAssertEqual(sut.backgroundColor, DS.Colors.Button.backgroundDisabled)
        XCTAssertEqual(sut.layer.borderColor, UIColor.clear.cgColor)
        XCTAssertEqual(sut.titleColor(for: .normal), DS.Colors.Button.neutralsWhite)

        sut.style = .mainBlue

        XCTAssertEqual(sut.backgroundColor, DS.Colors.Button.backgroundDisabled)
        XCTAssertEqual(sut.layer.borderColor, UIColor.clear.cgColor)
        XCTAssertEqual(sut.titleColor(for: .normal), DS.Colors.Button.neutralsWhite)
    }
}
