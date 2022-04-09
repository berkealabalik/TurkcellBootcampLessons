//
//  UITestExampleUITests.swift
//  UITestExampleUITests
//
//  Created by Egitim on 9.04.2022.
//

import XCTest

final class UITestExampleUITests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("***** UITest ******")
    }
    
    func test_navigate_to_welcome_view_controller() {
        
        app.launch()
        
        //İlk ekrandaki öğeler göründü mü??
        XCTAssertTrue(app.isUsernameTextFieldDisplayed)
        XCTAssertTrue(app.isPasswordTextFieldDisplayed)
        XCTAssertTrue(app.isDoneButtonDisplayed)
        
        // İlk ekrandaki Öğeler tıklanıp, birşeyler yazılabiliyor mu??
        app.usernameTextField.tap()
        app.usernameTextField.typeText("Test")
        app.keyboards.buttons["Return"].tap()
        
        app.passwordTextField.tap()
        //app.passwordTextField.doubleTap()
        app.keys["t"].tap()
        app.keys["e"].tap()
        app.keys["s"].tap()
        app.keys["t"].tap()
        app.keyboards.buttons["Return"].tap()
        
        XCTAssertEqual(app.usernameTextField.value as? String, "Test")
        
        app.doneButton.tap()
        
        //İkinci Ekrana Geçilip, label okunabiliyor mu??
        XCTAssertTrue(app.isWelcomeLabelDisplayed)
    }
}
 
extension XCUIApplication {
    
    var usernameTextField: XCUIElement! {
        textFields["usernameTextField"]
    }
    
    var passwordTextField: XCUIElement! {
        secureTextFields["passwordTextField"]
    }
    
    var doneButton: XCUIElement! {
        buttons["doneButton"]
    }
    
    var welcomeLabel: XCUIElement! {
        staticTexts.matching(identifier: "welcomeLabel").element
    }
    
    var isUsernameTextFieldDisplayed: Bool {
        usernameTextField.exists
    }
    
    var isPasswordTextFieldDisplayed: Bool {
        passwordTextField.exists
    }
    
    var isDoneButtonDisplayed: Bool {
        doneButton.exists
    }
    
    var isWelcomeLabelDisplayed: Bool {
        welcomeLabel.exists
    }
}
