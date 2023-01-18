//
//  GenrePresenter.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 17/01/23.
//

import Foundation
import UIKit

class GenrePresenter: GenreViewToPresenterProtocol {
  var genreView: GenrePresenterToViewProtocol?
  var interactor: GenrePresenterToInteractorProtocol?
  var router: GenrePresenterToRouterProtocol?
  
  func startFetchGenre() {
    interactor?.fetchGenres()
  }
  
  func showMovieVC(controller: UINavigationController, genre: Genre) {
    router?.pushToMovie(controller: controller, genre: genre)
  }
}


extension GenrePresenter: GenreInteractorToPresenterProtocol {
  
  func genreFetchedSucces(genres: [Genre]) {
    genreView?.showGenre(genres: genres)
  }
  
  func genreFetchedFailed(error: Error) {
    genreView?.showError(error: error)
  }
}
