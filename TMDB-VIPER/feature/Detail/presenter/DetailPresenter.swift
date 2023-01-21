//
//  DetailPresenter.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 17/01/23.
//

import Foundation
import UIKit

class DetailPresenter: DetailViewToPresenterProtocol {
  var detailView: DetailPresenterToViewProtocol?
  var interactor: DetailPresenterToInteractorProtocol?
  var router: DetailPresenterToRouterProtocol?
  
  func startFetchReviews(idMovie: Int, page: Int) {
    interactor?.fetchReviews(idMovie: idMovie, page: page)
  }
  
  func startFetchVideo(idMovie: Int) {
    interactor?.fetchVideo(idMovie: idMovie)
  }
  
}


extension DetailPresenter: DetailInteractorToPresenterProtocol {
  func reviewFetchedSucces(reviews: [MovieReview]) {
    detailView?.showReviews(reviews: reviews)
  }
  
  func reviewFetchedFailed(error: Error) {
    detailView?.showError(error: error)
  }
  
  func videoFetchedSucces(videos: [MovieVideo]) {
    detailView?.showVideo(videos: videos)
  }
}
