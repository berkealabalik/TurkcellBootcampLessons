//
//  DetailViewTests.swift
//  PopcornDailyTests
//
//  Created by Berke Alabalik on 2.05.2022.
//

import XCTest
@testable import PopcornDaily
class DetailViewTests: XCTestCase {

    //DetailView
    var detailPresenter : MovieDetailPresenter!
    var detailView : MovieDetailViewController!
    var detailInteractor : MovieDetailInteractor!
    var detailRouter : MovieDetailRouter!
    
    override func setUp() {
        super.setUp()
        detailView = .init()
        detailInteractor = .init()
        detailRouter = .init()
        detailPresenter = .init(view: detailView, router: detailRouter, interactor: detailInteractor)
        detailView.MovieID = 4122
        detailPresenter.viewDidLoad()
    }
    override func tearDown() {
        detailView = nil
        detailPresenter = nil
        detailInteractor = nil
        detailRouter = nil
    }
    
    func test_MovieIDComing() {
        XCTAssertFalse(detailView.MovieID == nil , "MovieID Comes")
    }
    func test_DataFetched() {
        XCTAssertTrue(detailPresenter.movieSelected(0).id != nil, "Movie Not Come")
    }
    func test_MovieImage() {
        XCTAssertFalse(detailView == nil , "Movie Image Not Come")
    }

}
