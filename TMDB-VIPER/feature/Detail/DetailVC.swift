//
//  DetailVC.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 17/01/23.
//

import UIKit

class DetailVC: UIViewController {
  
  var presenter: DetailViewToPresenterProtocol?
  var movie: Movie?
  private var reviews = [MovieReview]()
  private var curentPage = 1
  
  @IBOutlet weak var actIndicator: UIActivityIndicatorView!
  @IBOutlet weak var tblViewReview: UITableView!
  @IBOutlet weak var lblOverview: UILabel!
  @IBOutlet weak var lblVote: UILabel!
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var imgPoster: UIImageView!
  @IBOutlet weak var imgBackdrop: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }
  
  private func configureView() {
    self.lblOverview.text = movie?.overview
    self.lblVote.text = movie?.voteAveragePercentText
    self.lblTitle.text = movie?.title
    self.imgBackdrop.setImageUrl(urlPath: movie?.backdropURL ?? "")
    self.imgPoster.setImageUrl(urlPath: movie?.posterURL ?? "")
    
    presenter?.startFetchReviews(idMovie: movie?.id ?? 0, page: 1)
    actIndicator.startAnimating()
    
    self.tblViewReview.delegate = self
    self.tblViewReview.dataSource = self
    self.tblViewReview.register(UINib(nibName: ItemReviewCell.REUSE_IDENTIFIER, bundle: nil), forCellReuseIdentifier: ItemReviewCell.REUSE_IDENTIFIER)
  }
}

extension DetailVC: DetailPresenterToViewProtocol {
  func showReviews(reviews: [MovieReview]) {
    self.reviews.append(contentsOf: reviews)
    self.tblViewReview.reloadData()
    actIndicator.stopAnimating()
    actIndicator.hidesWhenStopped = true
  }
  
  func showError(error: Error) {
    print("error -> \(error)")
    actIndicator.stopAnimating()
    actIndicator.hidesWhenStopped = true
  }
}

extension DetailVC: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return reviews.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ItemReviewCell.REUSE_IDENTIFIER, for: indexPath) as! ItemReviewCell
    cell.setupView(review: reviews[indexPath.row])
    
    if indexPath.row == reviews.count - 1 {
      curentPage += 1
      presenter?.startFetchReviews(idMovie: movie?.id ?? 0, page: 1)
    }
    
    return cell
  }
}
