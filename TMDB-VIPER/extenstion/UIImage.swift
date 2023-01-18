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
      let processor = DownsamplingImageProcessor(size: self.bounds.size) |> RoundCornerImageProcessor(cornerRadius: 8)
      self.kf.indicatorType = .activity
      self.kf.setImage(
        with: url,
        options: [
          .processor(processor),
          .scaleFactor(UIScreen.main.scale),
          .transition(.fade(1)),
          .cacheOriginalImage
        ]
      )
    }
  }
}
