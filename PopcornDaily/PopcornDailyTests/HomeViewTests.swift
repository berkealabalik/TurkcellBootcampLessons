//
//  HomeViewTests.swift
//  PopcornDailyTests
//
//  Created by Berke Alabalik on 1.05.2022.
//

import XCTest
@testable import PopcornDaily
class HomeViewTests: XCTestCase {

    //HomeView
    var homePresenter : HomePresenter!
    var homeView    :   HomeViewController!
    var homeInteractor : HomeInteractor!
    var homeRouter : HomeRouter!
    
    override func setUp() {
        super.setUp()
        homeView = .init()
        homeInteractor = .init()
        homeRouter = .init()
        homePresenter = .init(view: homeView, router: homeRouter, interactor: homeInteractor)
    }
    
    override func tearDown() {
        super.tearDown()
        homeView = nil
        homePresenter = nil
        homeInteractor = nil
        homeRouter = nil
    }
    func test_showLoadingView(){
        var showloading : Bool = false
        if ((homePresenter.view?.showLoading()) != nil) {
            showloading = true
        }
        XCTAssertTrue(showloading,"Loading Not Work")
    }
    func test_hideLoadingView() {
        var hideloading : Bool = false
        if homePresenter.view?.hideLoading() != nil {
            hideloading = true
        }
        XCTAssertTrue(hideloading , "Hide Loading Not Work")
    }
    func test_CollectionViewSlider() {
        XCTAssertTrue(homeView.sliderCollectionView.numberOfItems(inSection: 0) > 0 , "Collection View Not Created")
    }
    func test_TableviewConfigure() {
        XCTAssertTrue(homeView.listTableView.numberOfSections > 0 , "Table View Not Created")
    }
    func test_imageNum() {
        XCTAssertTrue(homeView.sliderNum.numberOfPages != nil , "Slider Not Have Image")
    }
    
    func test_TableMovies() {
        XCTAssertFalse(((homePresenter.GettableMovies(0).originalTitle?.isEmpty) != nil) , "MoviesFetched" )
    }


}
