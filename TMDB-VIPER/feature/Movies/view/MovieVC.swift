//
//  MovieVC.swift
//  TMDB-VIPER
//
//  Created by Rasyid Ridla on 17/01/23.
//

import UIKit

class MovieVC: UIViewController {
  
  @IBOutlet weak var tblViewMovies: UITableView!
  @IBOutlet weak var actIndicator: UIActivityIndicatorView!
  
  var presenter: MovieViewToPresenterProtocol?
  var genre: Genre?
  private var movies = [Movie]()
  private var curentPage = 1
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }
  
  private func configureView() {
    title = genre?.name
    navigationController?.navigationBar.prefersLargeTitles = true
    
    presenter?.startFetchMovie(idGenre: genre?.id ?? 0, page: curentPage)
    actIndicator.start()
    
    self.tblViewMovies.delegate = self
    self.tblViewMovies.dataSource = self
    self.tblViewMovies.register(UINib(nibName: ItemMovieCell.REUSE_IDENTIFIER, bundle: nil), forCellReuseIdentifier: ItemMovieCell.REUSE_IDENTIFIER)
  }
}

extension MovieVC: MoviePresenterToViewProtocol {
  func showMovie(movies: [Movie]) {
    self.movies.append(contentsOf: movies)
    self.tblViewMovies.reloadData()
    actIndicator.stop()
  }
  
  func showError(error: Error) {
    print("error -> \(error)")
    actIndicator.stop()
  }
}

extension MovieVC: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movies.count
  }
  
  func tableView(
    _ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath
  ) {
    guard let navigationController = navigationController else {
      return
    }
    presenter?.showDetailVC(controller: navigationController, movie: movies[indexPath.row])
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    ItemMovieCell.CELL_HEIGHT
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ItemMovieCell.REUSE_IDENTIFIER, for: indexPath) as! ItemMovieCell
    cell.setupView(movie: movies[indexPath.row])
    
    if indexPath.row == movies.count - 1 {
      curentPage += 1
      presenter?.startFetchMovie(idGenre: genre?.id ?? 0, page: curentPage)
    }
    
    return cell
  }
}
