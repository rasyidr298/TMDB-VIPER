//
//  ItemMovieCell.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 18/01/23.
//

import UIKit
import SnapKit

class ItemMovieCell: UITableViewCell {
  
  static let CELL_HEIGHT: CGFloat = 220
  
  lazy var imgPoster: UIImageView = {
    let imgPoster = UIImageView()
    lblTitle.translatesAutoresizingMaskIntoConstraints = false
    imgPoster.layer.masksToBounds = true
    imgPoster.layer.cornerRadius = 8
    imgPoster.contentMode = .scaleAspectFill
    contentView.addSubview(imgPoster)
    return imgPoster
  }()
  
  lazy var lblTitle: UILabel = {
    let lblTitle = UILabel()
    lblTitle.translatesAutoresizingMaskIntoConstraints = false
    lblTitle.font = UIFont.font(type: .sfSemibold, size: CGFloat.size_18)
    lblTitle.numberOfLines = 2
    contentView.addSubview(lblTitle)
    return lblTitle
  }()
  
  lazy var lblVote: UILabel = {
    let lblVote = UILabel()
    lblVote.translatesAutoresizingMaskIntoConstraints = false
    lblVote.font = UIFont.font(type: .sfSemibold, size: CGFloat.size_12)
    lblVote.numberOfLines = 1
    contentView.addSubview(lblVote)
    return lblVote
  }()
  
  lazy var lblOverview: UILabel = {
    let lblOverview = UILabel()
    lblOverview.translatesAutoresizingMaskIntoConstraints = false
    lblOverview.font = UIFont.font(type: .sfRegular, size: CGFloat.size_12)
    lblOverview.numberOfLines = 8
    contentView.addSubview(lblOverview)
    return lblOverview
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupConstraint()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()

    contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
  }
  
  func configureView(movie: Movie) {
    lblTitle.text = movie.title
    lblVote.text = movie.voteAverage?.rating()
    lblOverview.text = movie.overview
    imgPoster.setImageUrl(urlPath: movie.posterURL)
  }
}

extension ItemMovieCell {
  private func setupConstraint() {
    imgPoster.snp.makeConstraints { make in
      make.width.equalTo(140)
      make.left.equalToSuperview()
      make.top.bottom.equalToSuperview()
    }
    
    lblTitle.snp.makeConstraints { make in
      make.left.equalTo(imgPoster.snp_rightMargin).offset(15)
      make.right.equalToSuperview().offset(-15)
      make.top.equalToSuperview().offset(12)
    }
    
    lblVote.snp.makeConstraints { make in
      make.left.equalTo(imgPoster.snp_rightMargin).offset(15)
      make.right.equalToSuperview().offset(-15)
      make.top.equalTo(lblTitle.snp_bottomMargin).offset(12)
    }
    
    lblOverview.snp.makeConstraints { make in
      make.left.equalTo(imgPoster.snp_rightMargin).offset(15)
      make.right.equalToSuperview().offset(-15)
      make.top.equalTo(lblVote.snp_bottomMargin).offset(12)
    }
  }
}
