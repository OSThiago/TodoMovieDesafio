//
//  MovieDatailsCell.swift
//  TodoMoviesDesafioMobile2You
//
//  Created by Thiago de Oliveira Sousa on 04/12/22.
//

import UIKit

class MovieDetailsCell: UITableViewCell {
    
    static let identifier = "MovieDetailsCell"
    
    // MARK: - COMPONENTS
    lazy var titleStack = makeTitleStack()
    lazy var subInformationStack = makeSubInformationsStack()
    
    lazy var movieImage = makeMovieImage()
    lazy var title = makeTitle()
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
        title.text = movieDetails.title
        likes.text = "\(movieDetails.vote_count ?? 0)"
        popularity.text = "\(movieDetails.popularity ?? 0)"

        if let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movieDetails.poster_path ?? "")") {
            movieImage.load(url: url)
        }
    }
    
    // MARK: - MAKE COMPONENTS
    // TITLE STACK
    func makeTitleStack() -> UIStackView {
        let stack = UIStackView()
        // SET STACK DIRACTION
        stack.axis = .horizontal
        // TODO: - Trocar a forma de preenchimento
        // SET ALIGNMENT
        stack.alignment = .fill
        
        return stack
    }
    
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
}

extension MovieDetailsCell: ViewSetup {
    func addViews() {
        addSubview(movieImage)
        addSubview(titleStack)
        addSubview(subInformationStack)

        [title].forEach { components in
            titleStack.addArrangedSubview(components)
        }

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
        
        // TITLE STACK
        titleStack.snp.makeConstraints { make in
            make.top.equalTo(movieImage.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(10)
        }

        // SUBINFORMATINO STACK
        subInformationStack.snp.makeConstraints { make in
            make.top.equalTo(titleStack.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
        }
    }
    
    func otherConfigurations() {
        
    }
}
