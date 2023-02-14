//
//  MoviesListCell.swift
//  MovieApp
//
//  Created by Elias Gabriel on 07/02/23.
//

import UIKit

protocol MoviesListCellConfiguration: UITableViewCell {
    func configureCell(with movieModel: MovieModel)
}

class MoviesListCell: UITableViewCell & CustomViewCodeProtocol{
    
    private lazy var posterImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var popularityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var contentStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [titleLabel, popularityLabel, dateLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 8
        
        return view
    }()
    
    private lazy var imageWithContentStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [posterImageView, contentStackView])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 16
        view.alignment = .center
        
        return view
    }()
    
    static let reuseId = "MoviesListCell"
    static let rowHeight: CGFloat = 112
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func subviews() {
        contentView.addSubview(imageWithContentStackView)
    }
    
    func layout() {
        addConstraints([
            posterImageView.widthAnchor.constraint(equalToConstant: 60),
            posterImageView.heightAnchor.constraint(equalToConstant: 75),
            
            imageWithContentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageWithContentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imageWithContentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            imageWithContentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }

}

extension MoviesListCell: MoviesListCellConfiguration {
    func configureCell(with movieModel: MovieModel) {
        titleLabel.text = movieModel.title
        popularityLabel.text = "\(movieModel.popularity) " + String(repeating: "⭐️", count: Int(movieModel.popularity))
        dateLabel.text = movieModel.releaseDate
    }
}
