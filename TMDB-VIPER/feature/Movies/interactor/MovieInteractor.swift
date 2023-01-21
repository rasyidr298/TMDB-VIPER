//
//  MovieInteractor.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 17/01/23.
//

import Foundation
import Alamofire

class MovieInteractor: MoviePresenterToInteractorProtocol {
  var presenter: MovieInteractorToPresenterProtocol?
  
  func fetchMovies(idGenre: Int, page: Int) {
    if let requestURL = URL(string: ApiCall.URL_MOVIES_DISCOVER(idGenre, page)) {
      AF.request(requestURL, method: .get)
        .validate()
        .responseDecodable(of: MovieResponse.self) {response in
          switch response.result {
          case .success(let value):
            self.presenter?.movieFetchedSucces(movies: value.movie ?? [Movie.default])
          case .failure(let error):
            self.presenter?.movieFetchedFailed(error: error)
          }
        }
    }
  }
}
