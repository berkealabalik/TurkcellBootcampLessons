//
//  HomeInteractor.swift
//  PopcornDaily
//
//  Created by Berke Alabalik on 24.04.2022.
//

import Foundation
protocol HomeInteractorProtocol : AnyObject {
    func fetchMovies()
}
protocol HomeInteractorOutputProtocol : AnyObject {
    func fetchMoviesOutput(result : NowPlayingResult , tableResult : NowPlayingResult)
}

//TODO: servis ekle newsService: NewsServiceProtocol = NewsService()
typealias NowPlayingResult = Result<NowPlaying , Error>
fileprivate var moviesService : MovieServiceProtocol = MovieService()
final class HomeInteractor {
    var output : HomeInteractorOutputProtocol!
}

extension HomeInteractor : HomeInteractorProtocol {
    func fetchMovies() {
        moviesService.fetchSlider { [weak self] result in
            guard let self = self else { return }
            moviesService.fetchUpcoming { [weak self] tableresult in
                self?.output.fetchMoviesOutput(result: result, tableResult: tableresult)
            }
        }
        
    }
}
