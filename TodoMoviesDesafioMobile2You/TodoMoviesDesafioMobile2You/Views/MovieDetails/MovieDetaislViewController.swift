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
    }
    
    func setupTableView() {
        movieDetailsView.similarMoviesTableView.delegate = self
        movieDetailsView.similarMoviesTableView.dataSource = self
        movieDetailsView.similarMoviesTableView.rowHeight = UIScreen.main.bounds.height * 0.09
    }
}

// MARK: - DELEGATES
extension MovieDetaislViewController: MovieDetaisDelegate {
    func movieDetailsFeteched() {
        DispatchQueue.main.async {
            self.movieDetailsView.setupWith(movieDetails: self.viewModel.movieDetailsModel)
            self.movieDetailsView.similarMoviesTableView.reloadData()
        }
    }
}

// MARK: - TABLE VIEW

extension MovieDetaislViewController: UITableViewDataSource, UITableViewDelegate {
    // DATASOURCER
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: - PEGAR A QUANTIDADE VINDA DA API E RETORNAR
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: - PEGAR DADOS DA API E ADIIONAR NA CELULAR
        
        // Create cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SimilarMovieTableViewCell.identifier, for: indexPath) as? SimilarMovieTableViewCell else {
            return UITableViewCell()
        }
        
        // TODO: - TROCAR PARA OS DADOS VINDO DA API
        cell.setupWith(similarMovie: SimilarMovieModel.JusticeLeague)
        
        return cell
    }
    
    // DELEGATE
}
