//
//  PopcornDailyUITests.swift
//  PopcornDailyUITests
//
//  Created by Berke Alabalik on 24.04.2022.
//

import XCTest

final class PopcornDailyUITests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("***** UITest *****")
        
    }
    func test_searchbar() {
        app.launch()
        app.SearchbarTextField.tap()
        app.SearchbarTextField.typeText("Miracle in ")
        app.SearchbarTextField.typeText("")
        app.SearchbarTextField.typeText("Batman")
    }
    
    func test_navigate_To_DetailScreen_TableView() {
        app.launch()
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
    }
    func test_navigate_To_DetailScreen_CollectionView() {
        app.launch()
        app.collectionViews.element(boundBy: 0).cells.element(boundBy: 0).tap()
    }
    
    func test_ImdbButton() {
        app.launch()
        app.collectionViews.element(boundBy: 0).cells.element(boundBy: 0).tap()
        app.ImdbButton.firstMatch.tap()
    }
    
    func test_similarMovies() {
        app.launch()
        app.collectionViews.element(boundBy: 0).cells.element(boundBy: 0).tap()
        app.collectionViews.element(boundBy: 0).cells.element(boundBy: 0).tap()
    }
  
}

extension XCUIApplication {
    var SearchbarTextField : XCUIElement! {
        searchFields.firstMatch
    }
    
    var ImdbButton : XCUIElement! {
        buttons["ImdbButton"]
    }
    
  
    
}
