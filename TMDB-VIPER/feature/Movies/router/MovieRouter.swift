//
//  MovieRouter.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 17/01/23.
//

import Foundation
import UIKit

class MovieRouter: MoviePresenterToRouterProtocol {
  static func createModule() -> MovieVC {
    
    let view = MovieVC()
    let interactor = MovieInteractor()
    let presenter = MoviePresenter()
    let router = MovieRouter()
    
    view.presenter = presenter
    interactor.presenter = presenter
    presenter.movieView = view
    presenter.router = router
    presenter.interactor = interactor
    
    return view
  }
  
  func pushToDetail(controller: UINavigationController) {
    //to movie
  }
}
