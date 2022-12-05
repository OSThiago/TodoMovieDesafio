//
//  MovieDetailsVIew.swift
//  TodoMoviesDesafioMobile2You
//
//  Created by Thiago de Oliveira Sousa on 02/12/22.
//

import UIKit
import SnapKit

class MovieDetailsView: UIView {
    
    // TODO: - Criar uma arquivo para guardar todos os tamanhos
    private let screen = UIScreen.main.bounds
    
    lazy var tableView: UITableView = makeTableView()
    
    // MARK: - INIT
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SETUP
//    func setupWith(movieDetails: MovieDetailsModel) {
//        movieTitle.text = movieDetails.title
//        likes.text = "\(movieDetails.vote_count ?? 0)"
//        popularity.text = "\(movieDetails.popularity ?? 0)"
//
//        if let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movieDetails.poster_path!)") {
//            movieImage.load(url: url)
//        }
//    }
    
    func setupWith(_ movieDetails: MovieDetailsModel) {
        
    }
    
    // MARK: - MAKE COMPONENTS
    
    // SIMILAR MOVIES TABLE VIEW
    func makeTableView() -> UITableView {
        let tableView = UITableView()
        
        // MOVIE INFORMATION CELL
        tableView.register(MovieDetailsCell.self, forCellReuseIdentifier: MovieDetailsCell.identifier)
        
        // SIMILAR MOVIE CELL
        tableView.register(SimilarMovieTableViewCell.self, forCellReuseIdentifier: SimilarMovieTableViewCell.identifier)
        
        tableView.separatorStyle = .singleLine
        
        return tableView
    }
}

// MARK: - VIEWSETUP
extension MovieDetailsView: ViewSetup {
    func addViews() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        // TABLEVIEW
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.horizontalEdges.equalToSuperview()
            //make.edges.equalToSuperview()
        }
    }
    
    func otherConfigurations() {
        backgroundColor = .white
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
