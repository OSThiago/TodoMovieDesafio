//
//  ViewController.swift
//  TodoMoviesDesafioMobile2You
//
//  Created by Thiago de Oliveira Sousa on 30/11/22.
//

import UIKit

class MovieDetaislViewController: UIViewController {
    
    let movieDetailsView = MovieDetailsView()
    
    lazy var viewModel = MovieDetailsViewModel(delegate: self)
    
    override func loadView() {
        view = movieDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        setupTableView()
    }
    
    func setup() {
        // Faz request do filme
        viewModel.fetchMovieDetail(movieID: 436270)
        viewModel.fetchGenres()
    }
    
    func setupTableView() {
        movieDetailsView.tableView.delegate = self
        movieDetailsView.tableView.dataSource = self
        // make table view ignore safe area
        movieDetailsView.tableView.contentInsetAdjustmentBehavior = .never
    }
}

// MARK: - DELEGATES
extension MovieDetaislViewController: MovieDetaisDelegate {
    func similarMoviesFetched() {
        DispatchQueue.main.async {
            self.movieDetailsView.tableView.reloadData()
        }
    }
    
    func genresFetched() {
        DispatchQueue.main.async {
            self.movieDetailsView.tableView.reloadData()
        }
    }
    
    func movieDetailsFetched() {
        DispatchQueue.main.async {
            //self.movieDetailsView.setupWith(movieDetails: self.viewModel.movieDetailsModel)
            self.movieDetailsView.tableView.reloadData()
        }
    }
}

// MARK: - TABLE VIEW

extension MovieDetaislViewController: UITableViewDataSource, UITableViewDelegate {
    // DATASOURCER
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: - PEGAR A QUANTIDADE VINDA DA API E RETORNAR
        
        let similarMoviesCount = viewModel.similarMoviesModel.count
        
        return similarMoviesCount + 1
    }
    
    @objc func buttonLikeAction() {
        print("Clicou em like")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // MOVIE DETAILS CELL
        if indexPath.row == 0 {
            if let movieCell = tableView.dequeueReusableCell(withIdentifier: MovieDetailsCell.identifier, for: indexPath) as? MovieDetailsCell {
                
                // movieCell.setupWith(movieDetails: MovieDetailsModel.mock)
                movieCell.setupWith(movieDetails: self.viewModel.movieDetailsModel)
                
                movieCell.selectionStyle = .none
                
                movieCell.isUserInteractionEnabled = true
                
                //movieCell.buttonLike.addTarget(self, action: #selector(buttonLikeAction), for: .touchUpInside)
                
                return movieCell
            }
        }
        
        // SIMILAR MOVIE
        if indexPath.row > 0 {
            if let similarMovieCell = tableView.dequeueReusableCell(withIdentifier: SimilarMovieTableViewCell.identifier, for: indexPath) as? SimilarMovieTableViewCell {
                
                // mock
                //similarMovieCell.setupWith(similarMovie: SimilarMovieModel.Watchmen)
                
                similarMovieCell.setupWith(similarMovie: self.viewModel.similarMoviesModel[indexPath.row - 1])
                
                similarMovieCell.genreList = viewModel.genresModel
                
                return similarMovieCell
            }
        }
        
        let cell = UITableViewCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // MOVIE DETAILS CELL
        if indexPath.row == 0 {
            return UIScreen.main.bounds.height * 0.58
        }
        
        
        // SIMILAR MOVIES
        //return UIScreen.main.bounds.height * 0.13
        return 100
    }
    
    // DELEGATE
}
