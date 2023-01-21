//
//  UIViewController.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 21/01/23.
//

import Foundation
import Lottie

extension UIViewController {
  func showLottie(name: String, view: UIView, loop: LottieLoopMode, speed: CGFloat) {
    let animation = LottieAnimationView(name: name)
    animation.frame = view.bounds
    animation.contentMode = .center
    animation.loopMode = loop
    animation.animationSpeed = speed
    view.addSubview(animation)
    animation.play()
  }
}
