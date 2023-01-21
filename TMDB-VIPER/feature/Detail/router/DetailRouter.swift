//
//  DetailRouter.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 17/01/23.
//

import Foundation

class DetailRouter: DetailPresenterToRouterProtocol {
  static func createModule() -> DetailVC {
    
    let view = DetailVC()
    let interactor = DetailInteractor()
    let presenter = DetailPresenter()
    let router = DetailRouter()
    
    view.presenter = presenter
    interactor.presenter = presenter
    presenter.detailView = view
    presenter.router = router
    presenter.interactor = interactor
    
    return view
  }
}
