//
//  UIImage.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 17/01/23.
//

import Foundation
import Kingfisher

public extension UIImageView {
  func setImageUrl(urlPath: String){
    if let url = URL(string: urlPath) {
      self.kf.setImage(with: url)
    }
  }
}
