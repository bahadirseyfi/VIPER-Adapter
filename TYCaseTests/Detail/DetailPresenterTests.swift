//
//  DetailPresenterTests.swift
//  TYCaseTests
//
//  Created by Bahadir on 21.05.2022.
//

import XCTest
@testable import TYCase

final class DetailPresenterTests: XCTestCase {
    var presenter: DetailPresenter!
    var view: MockDetailViewController!
    var interactor: MockDetailInteractor!
    
    override func setUp() {
        super.setUp()
        view = .init()
        interactor = .init()
        presenter = .init(view: view, interactor: interactor)
    }
    
    func test_onLoad_InvokesRequiredViewMethods() {
        XCTAssertFalse(interactor.invokedFetchProduct)
        
        XCTAssertFalse(view.invokedPrepareUI)
        XCTAssertEqual(view.invokedPrepareUICount, 0)
        
        
        XCTAssertFalse(view.invokedSetBrandName)
        XCTAssertEqual(view.invokedSetBrandNameCount, 0)
        XCTAssertNil(view.invokedSetBrandNameParameters)
        XCTAssertEqual(view.invokedSetBrandNameParametersList.count, 0)
        
        XCTAssertFalse(view.invokedSetBottomView)
        XCTAssertEqual(view.invokedSetBottomViewCount, 0)
        XCTAssertEqual(view.invokedSetBottomViewParametersList.count, 0)
        
        XCTAssertFalse(view.invokedSetupStarRatingView)
        XCTAssertEqual(view.invokedSetupStarRatingViewCount, 0)
        XCTAssertEqual(view.invokedSetupStarRatingViewParametersList.count, 0)
        
        presenter.onLoad()
        
        XCTAssertTrue(interactor.invokedFetchProduct)
        
        XCTAssertTrue(view.invokedPrepareUI)
        XCTAssertEqual(view.invokedPrepareUICount, 1)
        
        XCTAssertTrue(view.invokedSetBrandName)
        XCTAssertEqual(view.invokedSetBrandNameCount, 1)
        XCTAssertEqual(view.invokedSetBrandNameParametersList.count, 1)
        
        XCTAssertTrue(view.invokedSetBottomView)
        XCTAssertEqual(view.invokedSetBottomViewCount, 1)
        XCTAssertEqual(view.invokedSetBottomViewParametersList.count, 1)
        
        XCTAssertTrue(view.invokedSetupStarRatingView)
        XCTAssertEqual(view.invokedSetupStarRatingViewCount, 1)
        XCTAssertEqual(view.invokedSetupStarRatingViewParametersList.count, 1)
    }
}
