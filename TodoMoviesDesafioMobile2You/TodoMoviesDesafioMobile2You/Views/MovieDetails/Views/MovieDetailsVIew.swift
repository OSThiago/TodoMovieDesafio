//
//  MovieDetailsVIew.swift
//  TodoMoviesDesafioMobile2You
//
//  Created by Thiago de Oliveira Sousa on 02/12/22.
//

import UIKit
import SnapKit

class MovieDetailsView: UIView {

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
        }
    }
    
    func otherConfigurations() {
        backgroundColor = .white
    }
}
