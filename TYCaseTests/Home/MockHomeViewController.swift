//
//  MockHomeViewController.swift
//  TYCaseTests
//
//  Created by Bahadir on 20.05.2022.
//

@testable import TYCase
import UIKit

final class MockHomeViewController: HomeViewInterface {

    var invokedRegisterCells = false
    var invokedRegisterCellsCount = 0

    func registerCells() {
        invokedRegisterCells = true
        invokedRegisterCellsCount += 1
    }

    var invokedPrepareNavigationBarUI = false
    var invokedPrepareNavigationBarUICount = 0

    func prepareNavigationBarUI() {
        invokedPrepareNavigationBarUI = true
        invokedPrepareNavigationBarUICount += 1
    }

    var invokedSetTitle = false
    var invokedSetTitleCount = 0
    var invokedSetTitleParameters: (title: String, Void)?
    var invokedSetTitleParametersList = [(title: String, Void)]()

    func setTitle(_ title: String) {
        invokedSetTitle = true
        invokedSetTitleCount += 1
        invokedSetTitleParameters = (title, ())
        invokedSetTitleParametersList.append((title, ()))
    }
}
