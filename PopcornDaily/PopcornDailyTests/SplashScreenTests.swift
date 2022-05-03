//
//  PopcornDailyTests.swift
//  PopcornDailyTests
//
//  Created by Berke Alabalik on 24.04.2022.
//

import XCTest
@testable import PopcornDaily
class PopcornDailyTests: XCTestCase {
    
    //SplashScreen
    var splashScreenPresenter : SplashPresenter!
    var splashview : SplashViewController!
    var splashInteractor : SplashInteractor!
    var splashRouter : SplashRouter!
    
    override func setUp() {
        super.setUp()
        splashview = .init()
        splashInteractor = .init()
        splashRouter = .init()
        splashScreenPresenter = .init(view: splashview, router: splashRouter, interactor: splashInteractor)
    }

   
    override func tearDown() {
        splashview = nil
        splashScreenPresenter = nil
        splashInteractor = nil
        splashRouter = nil
    }
    
    func test_SplashScreenOpensCorrectly() {
        XCTAssertFalse(splashview.isViewLoaded, "SplashScreen Opened")
        XCTAssertFalse(splashview.isBeingDismissed, "SplashScreen Screen Missed")
        
    }
    func test_checkInternetConnection() {
        splashScreenPresenter.internetConnection(status: true)
        let connection = NetworkManager.shared.isConnectedToInternet()
        XCTAssertTrue(connection, "Connection not True")
    }
    func test_alert() {
        
        splashScreenPresenter.internetConnection(status: false)
        let connection = NetworkManager.shared.isConnectedToInternet()
        XCTAssertFalse(connection,"Connected To Internet")
        
    }
}
