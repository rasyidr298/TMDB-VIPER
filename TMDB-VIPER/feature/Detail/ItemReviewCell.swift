//
//  ItemReviewCell.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 18/01/23.
//

import UIKit

class ItemReviewCell: UITableViewCell {
  
  @IBOutlet weak var lblAuthor: UILabel!
  @IBOutlet weak var lblContent: UILabel!
  @IBOutlet weak var imgAvatar: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
  }
  
  func setupView(review: MovieReview) {
    lblAuthor.text = review.author
    lblContent.text = review.content
    imgAvatar.setImageUrl(urlPath: (review.avatarPath ?? review.authorDetails.avatarPathUrl) ?? "")
  }
}
