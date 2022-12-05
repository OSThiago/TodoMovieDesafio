//
//  SimilarMovieTableViewCell.swift
//  TodoMoviesDesafioMobile2You
//
//  Created by Thiago de Oliveira Sousa on 03/12/22.
//

import UIKit

class SimilarMovieTableViewCell: UITableViewCell {
    
    private let screen = UIScreen.main.bounds
    
    static let identifier = "SimilarMovieTableViewCell"
    
    // MARK: - COMPONENTS
    // IMAGE
    lazy var image = makeImage()
    
    // TITLE
    lazy var title = makeTitle()
    
    // RELEASE DATE
    lazy var releaseDate = makeReleaseDate()
    
    // GENRES
    lazy var genres = makeGenres()
    
    // MARK: - INIT
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWith(similarMovie: SimilarMovieModel) {
        self.title.text = similarMovie.title
        self.releaseDate.text = similarMovie.release_date
        
        // genres
        // TODO: - Criar uma lista de generos padrão para receber o id do genero
        self.genres.text?.removeAll()
        for genre in similarMovie.genre_ids {
            self.genres.text?.append("\(genre), ")
        }
        // Remove last "," and " "
        self.genres.text?.removeLast(2)
        
        // image
        if let url = URL(string: "\(ServiceTMDB.shared.baseImage)\(similarMovie.poster_path)") {
            self.image.load(url: url)
        }
    }
    
    // MARK: - MAKE COMPONENTES
    
    // IMAGE
    func makeImage() -> UIImageView {
        let image = UIImageView()
        
        // Placeholder
        let rect = CGRect(x: 0, y: 0, width: 50, height: 50)
        let renderer = UIGraphicsImageRenderer(bounds: rect)
        let grayImg = renderer.image { context in
            context.cgContext.setFillColor(gray: 1, alpha: 0.5)
            context.cgContext.fill(rect)
        }
        image.image = grayImg
        
        // Config Images
        image.contentMode = .scaleAspectFill
        //image.clipsToBounds = true
        return image
    }
    
    // TITLE
    func makeTitle() -> UILabel {
        let title = UILabel()
        title.text = "Title"
        title.numberOfLines = 2
        title.lineBreakMode = .byTruncatingTail
        title.font = UIFont.boldSystemFont(ofSize: 12)
        return title
    }
    
    // RELEASE DATE
    func makeReleaseDate() -> UILabel {
        let date = UILabel()
        date.text = "0000"
        date.font = UIFont.systemFont(ofSize: 8)
        return date
    }
    
    // GENRES
    func makeGenres() -> UILabel {
        let genres = UILabel()
        genres.text = ""
        genres.font = UIFont.systemFont(ofSize: 8)
        return genres
    }
}

// MARK: - VIEW SETUP
extension SimilarMovieTableViewCell: ViewSetup {
    func addViews() {
        addSubview(image)
        addSubview(title)
        addSubview(releaseDate)
        addSubview(genres)
    }
    
    func setupConstraints() {
        // Image
        image.snp.makeConstraints { make in
            make.width.equalTo(50)
            
            make.leading.equalToSuperview().offset(20)
            make.top.bottom.equalToSuperview().inset(5)
        }
        
        // title
        title.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(20)
        }

        // release date
        releaseDate.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(10)
            //make.leading.equalToSuperview()
            make.top.equalTo(title.snp.bottom).offset(5)
        }

        // genres
        genres.snp.makeConstraints { make in
            make.leading.equalTo(releaseDate.snp.trailing).offset(10)
            make.top.equalTo(title.snp.bottom).offset(5)
        }
    }
    
    func otherConfigurations() {
        title.adjustsFontSizeToFitWidth = true
        title.minimumScaleFactor = 0.8
    }
}
