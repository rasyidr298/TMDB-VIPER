//
//  ItemMovieCell.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 18/01/23.
//

import UIKit

class ItemMovieCell: UITableViewCell {
  
  @IBOutlet weak var lblOverview: UILabel!
  @IBOutlet weak var lblVote: UILabel!
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var imgPoster: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
  }
  
  func setupView(movie: Movie) {
    lblTitle.text = movie.title
    lblVote.text = movie.voteAveragePercentText
    lblOverview.text = movie.overview
    imgPoster.setImageUrl(urlPath: movie.posterURL)
  }
}
