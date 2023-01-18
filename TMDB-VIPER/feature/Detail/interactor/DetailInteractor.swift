//
//  DetailInteractor.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 17/01/23.
//

import Foundation
import Alamofire

class DetailInteractor: DetailPresenterToInteractorProtocol {
  var presenter: DetailInteractorToPresenterProtocol?
  
  func fetchReviews(idMovie: Int, page: Int) {
    if let requestURL = URL(string: ApiCall.URL_MOVIES_REVIEW(idMovie, page)) {
      AF.request(requestURL, method: .get)
        .validate()
        .responseDecodable(of: MovieReviewResponse.self) {response in
          switch response.result {
          case .success(let value):
            self.presenter?.reviewFetchedSucces(reviews: value.reviews)
          case .failure(let error):
            self.presenter?.reviewFetchedFailed(error: error)
          }
        }
    }
  }
}
