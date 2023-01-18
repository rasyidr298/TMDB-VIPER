//
//  GenreInteractor.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 17/01/23.
//

import Foundation
import Alamofire

class GenreInteractor: GenrePresenterToInteractorProtocol {
  var presenter: GenreInteractorToPresenterProtocol?
  
  func fetchGenres() {
    if let requestURL = URL(string: ApiCall.URL_MOVIES_GENRE) {
      AF.request(requestURL, method: .get)
        .validate()
        .responseDecodable(of: genreResponse.self) {response in
          switch response.result {
          case .success(let value):
            self.presenter?.genreFetchedSucces(genres: value.genre)
          case .failure:
            self.presenter?.genreFetchedFailed(error: "The server responded with empty objects")
          }
        }
    }
  }
}
