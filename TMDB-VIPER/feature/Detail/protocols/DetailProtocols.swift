//
//  DetailProtocols.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 17/01/23.
//

import Foundation
import UIKit

protocol DetailPresenterToInteractorProtocol {
  var presenter: DetailInteractorToPresenterProtocol? {get set}
  func fetchReviews(idMovie: Int, page: Int)
}

protocol DetailInteractorToPresenterProtocol {
  func reviewFetchedSucces(reviews: [MovieReview])
  func reviewFetchedFailed(error: Error)
}

protocol DetailViewToPresenterProtocol {
  var detailView: DetailPresenterToViewProtocol? {get set}
  var interactor: DetailPresenterToInteractorProtocol? {get set}
  var router: DetailPresenterToRouterProtocol? {get set}
  
  func startFetchReviews(idMovie: Int, page: Int)
}

protocol DetailPresenterToViewProtocol {
  func showReviews(reviews: [MovieReview])
  func showError(error: Error)
}

protocol DetailPresenterToRouterProtocol {
  static func createModule() -> DetailVC
}
