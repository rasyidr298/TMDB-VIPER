//
//  MovieProtocols.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 17/01/23.
//

import Foundation
import UIKit

protocol MoviePresenterToInteractorProtocol {
  var presenter: MovieInteractorToPresenterProtocol? {get set}
  func fetchMovies(idGenre: Int, page: Int)
}

protocol MovieInteractorToPresenterProtocol: AnyObject {
  func movieFetchedSucces(movies: [Movie])
  func movieFetchedFailed(error: Error)
}

protocol MovieViewToPresenterProtocol {
  var movieView: MoviePresenterToViewProtocol? {get set}
  var interactor: MoviePresenterToInteractorProtocol? {get set}
  var router: MoviePresenterToRouterProtocol? {get set}
  
  func startFetchMovie(idGenre: Int, page: Int)
  func showDetailVC(controller: UINavigationController, movie: Movie)
}

protocol MoviePresenterToViewProtocol {
  func showMovie(movies: [Movie])
  func showError(error: Error)
}

protocol MoviePresenterToRouterProtocol {
  static func createModule() -> MovieVC
  func pushToDetail(controller: UINavigationController, movie: Movie)
}
