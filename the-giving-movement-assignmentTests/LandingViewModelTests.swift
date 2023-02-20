//
//  the_giving_movement_assignmentTests.swift
//  the-giving-movement-assignmentTests
//
//  Created by Sakib Kurtic on 2/20/23.
//

import XCTest
@testable import the_giving_movement_assignment

class LandingViewModelTests: XCTestCase {
    var testNavigator: MockNavigator?
    var viewModel: LandingViewModel?

    override func setUpWithError() throws {
        testNavigator = MockNavigator()
        viewModel = LandingViewModel(navigator: testNavigator!)
    }

    override func tearDownWithError() throws {
        testNavigator = nil
        viewModel = nil
    }

    func testStrings() throws {
        // given
        let testLeftString: String = "SAME-DAY DELIVERY IN UAE"
        let testRightString: String = "2-3 DAYS' DELIVERY IN GCC"

        // when

        // then
        XCTAssertTrue(testLeftString == viewModel?.infoStringLeft, "Left string not match")
        XCTAssertTrue(testRightString == viewModel?.infoStringRight, "Right string not match")
    }

    func testNavigateToProduct() {
        // given
        let numberOfNavigationToProduct = testNavigator!.productsCounter
        // when
        viewModel?.navigateToProducts(of: .woman)
        // then
        XCTAssert(numberOfNavigationToProduct < testNavigator!.productsCounter, "Navigation is not working")
    }

    func testNavigateToProductAndBack() {
        // given
        let numberOfNavigationToProduct = testNavigator!.productsCounter
        // when
        viewModel?.navigateToProducts(of: .woman)
        viewModel?.navigateHome()
        // then
        XCTAssert(numberOfNavigationToProduct == testNavigator!.productsCounter, "Navigation to or from is not working")
    }
}
