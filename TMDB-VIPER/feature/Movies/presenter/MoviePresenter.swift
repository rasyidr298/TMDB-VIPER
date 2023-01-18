//
//  MoviePresenter.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 17/01/23.
//

import Foundation
import UIKit

class MoviePresenter: MovieViewToPresenterProtocol {
  var movieView: MoviePresenterToViewProtocol?
  var interactor: MoviePresenterToInteractorProtocol?
  var router: MoviePresenterToRouterProtocol?
  
  func startFetchMovie(idGenre: Int, page: Int) {
    interactor?.fetchMovies(idGenre: idGenre, page: page)
  }
  
  func showDetailVC(controller: UINavigationController) {
    router?.pushToDetail(controller: controller)
  }
}


extension MoviePresenter: MovieInteractorToPresenterProtocol {
  
  func movieFetchedSucces(movies: [Movie]) {
    movieView?.showMovie(movies: movies)
  }
  
  func movieFetchedFailed(error: Error) {
    movieView?.showError(error: error)
  }
}
