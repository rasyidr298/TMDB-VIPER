//
//  MovieFeatureTest.swift
//  TMDB-VIPERTests
//
//  Created by Rasyid Ridla on 11/02/23.
//

import XCTest
import Alamofire
@testable import TMDB_VIPER

final class MovieFeatureTest: XCTestCase {
  
  var fakeInteractor = FakeMovieInteractor()
  var fakePresenter = FakeMoviePresenter()
  var fakeView = FakeMovieView()
  
  struct FakeMovieResult {
    static let errorMovie: AFError = .sessionDeinitialized
    static let successMovies = [
      Movie(id: 1,
            title: "Terrifier 2",
            backdropPath: "backdrop_terrifier",
            posterPath: "poster_terrifier",
            overview: "After being resurrected by a sinister entity",
            releaseDate: "2022-10-06",
            voteAverage: 9.0,
            voteCount: 100),
      Movie(id: 2,
            title: "You People",
            backdropPath: "backdrop_people",
            posterPath: "poster_people",
            overview: "A new couple and their families reckon with modern love",
            releaseDate: "2022-10-06",
            voteAverage: 8.0,
            voteCount: 100)
    ]
  }
  
  override func setUp() {
    super.setUp()
    
    fakeInteractor.presenter = fakePresenter
    fakePresenter.interactor = fakeInteractor
    fakePresenter.movieView = fakeView
  }
  
  func test_success_presenter() {
    fakeInteractor.fetchMovies(idGenre: 1, page: 1)
    
    guard let movies = fakePresenter.movies else {
      XCTFail("Movies Nil")
      return
    }
    
    XCTAssertEqual(movies, FakeMovieResult.successMovies)
  }
  
  func test_error_presenter() {
    fakeInteractor.fetchMovies(idGenre: 1, page: 1)
    
    XCTAssertEqual(fakePresenter.error?.localizedDescription, FakeMovieResult.errorMovie.localizedDescription)
  }
  
  func test_success_view() {
    fakeInteractor.fetchMovies(idGenre: 1, page: 1)
    
    guard let movies = fakePresenter.movies else {
      XCTFail("Movies Nil")
      return
    }
    
    XCTAssertEqual(movies, FakeMovieResult.successMovies)
  }
  
  func test_error_view() {
    fakeInteractor.fetchMovies(idGenre: 1, page: 1)
    
    XCTAssertEqual(fakeView.error?.localizedDescription, FakeMovieResult.errorMovie.localizedDescription)
  }
}


//setup MovieFeature Test
extension MovieFeatureTest {
  
  //fake movies interactor
  class FakeMovieInteractor: MoviePresenterToInteractorProtocol {
    var presenter: MovieInteractorToPresenterProtocol?
    
    func fetchMovies(idGenre: Int, page: Int) {
      presenter?.movieFetchedSucces(movies: FakeMovieResult.successMovies)
      presenter?.movieFetchedFailed(error: FakeMovieResult.errorMovie)
    }
  }
  
  //fake movies presenter
  class FakeMoviePresenter: MovieInteractorToPresenterProtocol, MovieViewToPresenterProtocol {
    
    var movies: [Movie]?
    var error: Error?
    
    func movieFetchedSucces(movies: [Movie]) {
      movieView?.showMovie(movies: movies)
      self.movies = movies
    }
    
    func movieFetchedFailed(error: Error) {
      movieView?.showError(error: error)
      self.error = error
    }
    
    var movieView: MoviePresenterToViewProtocol?
    
    var interactor: MoviePresenterToInteractorProtocol?
    
    var router: MoviePresenterToRouterProtocol?
    
    func startFetchMovie(idGenre: Int, page: Int) {}
    
    func showDetailVC(controller: UINavigationController, movie: Movie) {}
  }
  
  //fake movies view
  class FakeMovieView: MoviePresenterToViewProtocol {
    
    var movies: [Movie]?
    var error: Error?
    
    func showMovie(movies: [Movie]) {
      self.movies = movies
    }
    
    func showError(error: Error) {
      self.error = error
    }
  }
}
