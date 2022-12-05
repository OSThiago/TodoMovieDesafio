//
//  MovieDatailsCell.swift
//  TodoMoviesDesafioMobile2You
//
//  Created by Thiago de Oliveira Sousa on 04/12/22.
//

import UIKit

class MovieDetailsCell: UITableViewCell {
    
    static let identifier = "MovieDetailsCell"
    
    var isLiked = false
    
    // MARK: - COMPONENTS
    lazy var subInformationStack = makeSubInformationsStack()
    
    lazy var movieImage = makeMovieImage()
    lazy var title = makeTitle()
    lazy var buttonLike = makeLikeButton()
    lazy var likes = makeVoteCount()
    lazy var popularity = makePopularity()
    
    // MARK: - INITIALIZER
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SETUP
    func setupWith(movieDetails: MovieDetailsModel) {
        // TITLE
        title.text = movieDetails.title
        
        // LIKES
        var likesTextFormated = "\(movieDetails.vote_count?.roundedWithAbbreviations ?? 0.roundedWithAbbreviations)"
        likes.text = "\(likesTextFormated) Likes"
        
        // POPULARITY
        var popularityTextFormated = "\(movieDetails.popularity?.roundedWithAbbreviations ?? 0.roundedWithAbbreviations)"
        popularity.text = "\(popularityTextFormated) Watched"

        if let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movieDetails.poster_path ?? "")") {
            movieImage.load(url: url)
        }
    }
    
    // MARK: - MAKE COMPONENTS
    
    // SUBTINFORMATIONS STACK
    func makeSubInformationsStack() -> UIStackView {
        let stack = UIStackView()
        // SET DIRACTION
        stack.axis = .horizontal
        // SET SPACING
        stack.spacing = 10
        // SET ALIGNMENT
        stack.alignment = .leading
        return stack
    }
    
    // TITLE
    func makeTitle() -> UILabel {
        let title = UILabel()
        title.text = "Title"
        title.numberOfLines = 2
        title.lineBreakMode = .byTruncatingTail
        title.font = UIFont.boldSystemFont(ofSize: 30)
        // TODO: - trocar cor e font
        return title
    }
    
    // VOTE COUNT
    func makeVoteCount() -> UILabel {
        let voteCount = UILabel()
        voteCount.text = "\(0) Likes"
        // TODO: - trocar cor e font
        return voteCount
    }
    
    // POPULARITY
    func makePopularity() -> UILabel {
      let popularity = UILabel()
        popularity.text = "\(0000)"
        
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
    
    func makeLikeButton() -> UIButton {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        
        button.tintColor = .black
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        //button.backgroundColor = .gray
        
        return button
    }
    
    @objc func buttonTapped() {
        isLiked.toggle()
        
        if isLiked {
            buttonLike.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            buttonLike.tintColor = .red
        } else {
            buttonLike.setImage(UIImage(systemName: "heart"), for: .normal)
            buttonLike.tintColor = .black
        }
    }
}

extension MovieDetailsCell: ViewSetup {
    func addViews() {
        addSubview(movieImage)
        addSubview(title)
        addSubview(subInformationStack)
        //addSubview(buttonLike)
        contentView.addSubview(buttonLike)
        
        [likes, popularity].forEach { components in
            subInformationStack.addArrangedSubview(components)
        }
    }
    
    func setupConstraints() {
        
        // IMAGE
        movieImage.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height * 0.45)
        }
        
        // TITLE
        title.snp.makeConstraints { make in
            make.top.equalTo(movieImage.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        // BUTTON LIKE
        buttonLike.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(movieImage.snp.bottom).offset(10)
            make.size.equalTo(30)
        }
        
        // SUBINFORMATINO STACK
        subInformationStack.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
        }
    }
    
    func otherConfigurations() {
        
    }
}

extension Int {
    var roundedWithAbbreviations: String {
        let number = Double(self)
        let thousand = number / 1000
        let million = number / 1000000
        if million >= 1.0 {
            return "\(round(million*10)/10)M"
        }
        else if thousand >= 1.0 {
            return "\(round(thousand*10)/10)K"
        }
        else {
            return "\(self)"
        }
    }
}


extension Double {
    var roundedWithAbbreviations: String {

        if self >= 10000, self <= 999999 {
            return String(format: "%.1fK", locale: Locale.current,self/1000).replacingOccurrences(of: ".0", with: "")
        }

        if self > 999999 {
            return String(format: "%.1fM", locale: Locale.current,self/1000000).replacingOccurrences(of: ".0", with: "")
        }

        return String(format: "%.0f", locale: Locale.current,self)
    }
}

