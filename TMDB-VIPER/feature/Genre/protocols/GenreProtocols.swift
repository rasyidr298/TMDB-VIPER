//
//  GenreProtocols.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 17/01/23.
//

import Foundation
import UIKit

protocol GenrePresenterToInteractorProtocol {
  var presenter: GenreInteractorToPresenterProtocol? {get set}
  func fetchGenres()
}

protocol GenreInteractorToPresenterProtocol: AnyObject {
  func genreFetchedSucces(genres: [Genre])
  func genreFetchedFailed(error: Error)
}

protocol GenreViewToPresenterProtocol {
  var genreView: GenrePresenterToViewProtocol? {get set}
  var interactor: GenrePresenterToInteractorProtocol? {get set}
  var router: GenrePresenterToRouterProtocol? {get set}
  
  func startFetchGenre()
  func showMovieVC(controller: UINavigationController, genre: Genre)
}

protocol GenrePresenterToViewProtocol {
  func showGenre(genres: [Genre])
  func showError(error: Error)
}

protocol GenrePresenterToRouterProtocol {
  static func createModule() -> GenreVC
  func pushToMovie(controller: UINavigationController, genre: Genre)
}
