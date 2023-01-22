//
//  GenreVC.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 17/01/23.
//

import UIKit

class GenreVC: UIViewController {
  @IBOutlet weak var collectionViewGenre: UICollectionView!
  @IBOutlet weak var actIndikator: UIActivityIndicatorView!
  
  var presenter: GenreViewToPresenterProtocol?
  private var genres = [Genre]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureView()
  }
  
  private func configureView() {
    title = "Movie Genre"
    navigationController?.navigationBar.prefersLargeTitles = true
    
    presenter?.startFetchGenre()
    actIndikator.start()
    
    self.collectionViewGenre.delegate = self
    self.collectionViewGenre.dataSource = self
    self.collectionViewGenre.register(ItemGenreCell.self, forCellWithReuseIdentifier: ItemGenreCell.REUSE_IDENTIFIER)
  }
  
}

extension GenreVC: GenrePresenterToViewProtocol {
  func showGenre(genres: [Genre]) {
    self.genres.append(contentsOf: genres)
    self.collectionViewGenre.reloadData()
    actIndikator.stop()
  }
  
  func showError(error: Error) {
    print("show error -> \(error)")
    actIndikator.stop()
  }
}

extension GenreVC: UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return genres.count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemGenreCell.REUSE_IDENTIFIER, for: indexPath) as! ItemGenreCell
    cell.setupView(genre: genres[indexPath.row])
    
    return cell
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath
  ) {
    guard let navigationController = navigationController else {
      return
    }
    presenter?.showMovieVC(controller: navigationController, genre: genres[indexPath.row])
  }
}

extension GenreVC: UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumInteritemSpacingForSectionAt section: Int
  ) -> CGFloat {
    return 5
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let itemWidth = view.bounds.width / 2
    return CGSize(width: itemWidth - 12 , height: (itemWidth - 12) * 0.6 )
  }
}
