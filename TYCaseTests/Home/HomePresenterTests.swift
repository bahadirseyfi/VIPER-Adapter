//
//  HomePresenterTests.swift
//  TYCaseTests
//
//  Created by Bahadir on 20.05.2022.
//

import XCTest
@testable import TYCase

final class HomePresenterTests: XCTestCase {
    var presenter: HomePresenter!
    var view: MockHomeViewController!
    var interactor: MockHomeInteractor!
    
    private var adapter: TableViewAdapter?
    
    override func setUp() {
        super.setUp()
        view = .init()
        interactor = .init()
        presenter = .init(view: view, interactor: interactor)
    }
    
    func test_onLoad_InvokesRequiredViewMethods() {
        XCTAssertFalse(view.invokedPrepareNavigationBarUI)
        XCTAssertFalse(view.invokedRegisterCells)
        XCTAssertFalse(view.invokedSetTitle)
        XCTAssertNil(view.invokedSetTitleParameters)
        XCTAssertFalse(interactor.invokedFetchWidgets)
        
        presenter.onLoad()
        
        XCTAssertTrue(view.invokedPrepareNavigationBarUI)
        XCTAssertTrue(view.invokedRegisterCells)
        XCTAssertTrue(view.invokedSetTitle)
        XCTAssertEqual(view.invokedSetTitleParameters?.title,
                       "Mobile Case")
        XCTAssertTrue(interactor.invokedFetchWidgets)
    }
    
    func test_handleWidgetResult_SuccessResponseAndServiceURLisEmpty() {
        XCTAssertEqual(presenter.items.count, 0)
        
        presenter.handleWidgetResult(.success(.response))
        
        XCTAssertEqual(presenter.items.count, 4)
    }
    
    func test_handleProductResult_SucessResponseAndServiceURLisNotEmpty() {
        XCTAssertEqual(presenter.items.count, 0)
        
        presenter.handleProductResult(.success(.response), url: "", index: 0, displayType: .single, type: .banner, height: 0)
        
        XCTAssertEqual(presenter.items.count, 1)
    }
}

extension HomeList {
    static var response: HomeList {
        let bundle = Bundle(for: HomePresenterTests.self)
        let path = bundle.path(forResource: "HomeWidgetsResponse",
                               ofType: "json")!
        let file = try! String(contentsOfFile: path)
        let data = file.data(using: .utf8)!
        let homeResponse = try! JSONDecoder().decode(HomeList.self, from: data)
        return homeResponse
    }
}

extension Products {
    static var response: Products {
        let bundle = Bundle(for: HomePresenterTests.self)
        let path = bundle.path(forResource: "ProductElementResponse",
                               ofType: "json")!
        let file = try! String(contentsOfFile: path)
        let data = file.data(using: .utf8)!
        let homeResponse = try! JSONDecoder().decode(Products.self, from: data)
        return homeResponse
    }
}
