//
//  UIButton.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 18/01/23.
//

import Foundation
import Kingfisher

extension UIButton {
  func setToImage(urlPath: String) {
    if let url = URL(string: urlPath) {
      let modifier = AnyImageModifier { return $0.withRenderingMode(.alwaysOriginal) }
      self.kf.setImage(
        with: url,
        for: .normal,
        options: [.imageModifier(modifier)]
      )
    }
  }
}
