//
//  GenreInteractorTest.swift
//  TMDB-VIPERTests
//
//  Created by Rasyid Ridla on 11/02/23.
//

import XCTest
import Alamofire
@testable import TMDB_VIPER

final class GenreFeatureTest: XCTestCase {
  
  var fakeInteractor = FakeGenreInteractor()
  var fakePresenter = FakeGenrePresenter()
  var fakeView = FakeGenreView()
  
  struct FakeGenreResult {
    static let errorGenres: AFError = .sessionDeinitialized
    static let successGenres = [
      Genre(id: 1, name: "adventure"),
      Genre(id: 2, name: "drama")
    ]
  }
  
  override func setUp() {
    super.setUp()
    
    fakeInteractor.presenter = fakePresenter
    fakePresenter.interactor = fakeInteractor
    fakePresenter.genreView = fakeView
  }
  
  func test_success_presenter() {
    fakeInteractor.fetchGenres()
    
    guard let genres = fakePresenter.genres else {
      XCTFail("Genres Nil")
      return
    }
    
    XCTAssertEqual(genres, FakeGenreResult.successGenres)
  }

  func test_error_presenter() {
    fakeInteractor.fetchGenres()
    
    XCTAssertEqual(fakePresenter.error?.localizedDescription, FakeGenreResult.errorGenres.localizedDescription)
  }
  
  func test_success_view() {
    fakeInteractor.fetchGenres()
    
    guard let genres = fakePresenter.genres else {
      XCTFail("Genres Nil")
      return
    }
    
    XCTAssertEqual(genres, FakeGenreResult.successGenres)
  }
  
  func test_error_view() {
    fakeInteractor.fetchGenres()
    
    XCTAssertEqual(fakeView.error?.localizedDescription, FakeGenreResult.errorGenres.localizedDescription)
  }
  
}


//setup genre feature
extension GenreFeatureTest {
  
  //fake genre interactor
  class FakeGenreInteractor: GenrePresenterToInteractorProtocol {
    var presenter: GenreInteractorToPresenterProtocol?
    
    func fetchGenres() {
      presenter?.genreFetchedSucces(genres: FakeGenreResult.successGenres)
      presenter?.genreFetchedFailed(error: FakeGenreResult.errorGenres)
    }
  }
  
  //fake genre presenter
  class FakeGenrePresenter: GenreInteractorToPresenterProtocol, GenreViewToPresenterProtocol {
    var genres: [Genre]?
    var error: Error?
    
    func genreFetchedSucces(genres: [TMDB_VIPER.Genre]) {
      genreView?.showGenre(genres: genres)
      self.genres = genres
    }
    
    func genreFetchedFailed(error: Error) {
      genreView?.showError(error: error)
      self.error = error
    }
    
    var genreView: GenrePresenterToViewProtocol?
    var interactor: GenrePresenterToInteractorProtocol?
    var router: GenrePresenterToRouterProtocol?
    func startFetchGenre() {}
    func showMovieVC(controller: UINavigationController, genre: Genre) {}
  }
  
  //fake genre view
  class FakeGenreView: GenrePresenterToViewProtocol {
    var genres: [Genre]?
    var error: Error?
    
    func showGenre(genres: [Genre]) {
      self.genres = genres
    }
    
    func showError(error: Error) {
      self.error = error
    }
  }
}
