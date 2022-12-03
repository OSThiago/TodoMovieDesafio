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
    }
    
    func setup() {
        // Faz request do filme
        viewModel.fetchMovieDetail(movieID: 436270)
    }
}

extension MovieDetaislViewController: MovieDetaisDelegate {
    func movieDetailsFeteched() {
        DispatchQueue.main.async {
            self.movieDetailsView.setupWith(movieDetails: self.viewModel.movieDetailsModel)
        }
    }
}
