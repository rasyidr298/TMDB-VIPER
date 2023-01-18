//
//  GenreRouter.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 17/01/23.
//

import Foundation
import UIKit

class GenreRouter: GenrePresenterToRouterProtocol {
  static func createModule() -> GenreVC {
    
    let view = GenreVC()
    let interactor = GenreInteractor()
    let presenter = GenrePresenter()
    let router = GenreRouter()
    
    view.presenter = presenter
    interactor.presenter = presenter
    presenter.genreView = view
    presenter.router = router
    presenter.interactor = interactor
    
    return view
  }
  
  func pushToMovie(controller: UINavigationController, genre: Genre) {
    let vc = MovieRouter.createModule()
    vc.genre = genre
    controller.pushViewController(vc, animated: true)
  }
}
