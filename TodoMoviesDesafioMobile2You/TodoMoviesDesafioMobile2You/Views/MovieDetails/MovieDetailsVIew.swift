//
//  MovieDetailsVIew.swift
//  TodoMoviesDesafioMobile2You
//
//  Created by Thiago de Oliveira Sousa on 02/12/22.
//

import UIKit
import SnapKit

class MovieDetailsView: UIView {
    
    // MARK: - COMPONENTS
    lazy var movieTitle: UILabel = makeTitle(titleText: "Movie Title")
    
    lazy var likes: UILabel = makeVoteCount(voteCountValue: 0)
    
    lazy var popularity: UILabel = makePopularity(popularityValue: 0)
    
    lazy var movieImage: UIImageView = makeMovieImage()
    
    var gradientLayer = CAGradientLayer()
    
    // MARK: - INIT
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SETUP
    func setupWith(movieDetails: MovieDetailsModel) {
        movieTitle.text = movieDetails.title
        likes.text = "\(movieDetails.vote_count ?? 0)"
        popularity.text = "\(movieDetails.popularity ?? 0)"
        
        if let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movieDetails.poster_path!)") {
            movieImage.load(url: url)
        }
    }
    
    // MARK: - MAKE COMPONENTS
    // TITLE
    func makeTitle(titleText: String) -> UILabel {
        let title = UILabel()
        title.text = titleText
        title.numberOfLines = 2
        title.lineBreakMode = .byTruncatingTail
        title.font = UIFont.boldSystemFont(ofSize: 30)
        // TODO: - trocar cor e font
        return title
    }
    
    // VOTE COUNT
    func makeVoteCount(voteCountValue: Int) -> UILabel {
        let voteCount = UILabel()
        voteCount.text = "\(voteCountValue) Likes"
        // TODO: - trocar cor e font
        return voteCount
    }
    
    // POPULARITY
    func makePopularity(popularityValue: Double) -> UILabel {
      let popularity = UILabel()
        popularity.text = "\(popularityValue)"
        
        return popularity
    }
    
    // MOVIE IMAGE
    func makeMovieImage() -> UIImageView {
        // TODO: - melhorar a forma de carregar a setar a imagem
        let image = UIImageView()
        
        // Size
        let size = CGRect(x: 0, y: 0, width: 100, height: 100)
        image.frame(forAlignmentRect: size)
        
        // Placeholder
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
            let renderer = UIGraphicsImageRenderer(bounds: rect)
            let img = renderer.image { ctx in
                ctx.cgContext.setFillColor(gray: 1, alpha: 0.5)
                ctx.cgContext.fill(rect)
            }
        // Set placeholder
        image.image = img
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }
}

// MARK: - VIEWSETUP
extension MovieDetailsView: ViewSetup {
    func addViews() {
        
        let components = [movieImage, movieTitle, likes, popularity]
        
        for component in components {
            addSubview(componet)
        }
    }
    
    func setupConstraints() {
        
        // IMAGE
        movieImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(400)
        }
        
        // TITLE
        movieTitle.snp.makeConstraints { make in
            make.top.equalTo(movieImage.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        // LIKES
        likes.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(movieTitle.snp.bottom).offset(30)
        }
        
        // POPULARITY
        popularity.snp.makeConstraints { make in
            make.leading.equalTo(likes.snp.trailing).offset(20)
            make.top.equalTo(movieTitle.snp.bottom).offset(30)
        }
    }
    
    func otherConfigurations() {
        backgroundColor = .white
    }
}

// link to get a image
// https://image.tmdb.org/t/p/w500/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg

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
