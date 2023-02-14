//
//  MoviesCatalogView.swift
//  MovieApp
//
//  Created by Elias Gabriel on 04/02/23.
//

import UIKit

protocol MoviesListViewConfiguration: UIView {
    var movies: [MovieModel] { get }
    func numberOfRowsInSegment() -> Int
    func updatedContentList()
    func makeCell(indexPath: IndexPath) -> UITableViewCell
    func setup(viewModel: MoviesListModels.RequestListView.ViewModel)
}

final class MoviesListView: BaseView {
    // MARK: - Properties
    private (set) var movies = [
        MovieModel(title: "Batman", posterImage: "", popularity: 3.0, releaseDate: "2015"),
        MovieModel(title: "Superman", posterImage: "", popularity: 4.2, releaseDate: "2011"),
        MovieModel(title: "Titanic", posterImage: "", popularity: 3.2, releaseDate: "2016"),
        MovieModel(title: "Dune", posterImage: "", popularity: 3.2, releaseDate: "2020"),
        MovieModel(title: "TLOU", posterImage: "", popularity: 5.0, releaseDate: "2022")
    ]
    
    // MARK: - UI
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        
        view.register(MoviesListCell.self, forCellReuseIdentifier: MoviesListCell.reuseId)
        view.rowHeight = MoviesListCell.rowHeight
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    // MARK: - CustomViewCodeProtocol
    override func subviews() {
        addSubview(tableView)
    }
    
    override func layout() {
        addConstraints([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
}

// MARK: - MoviesListViewCOnfiguration
extension MoviesListView: MoviesListViewConfiguration {
    func numberOfRowsInSegment() -> Int {
        return movies.count
    }
    
    func updatedContentList() {
        DispatchQueue.main.async { [self] in
            tableView.reloadData()
        }
    }
    
    func makeCell(indexPath: IndexPath) -> UITableViewCell {
        guard !movies.isEmpty else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: MoviesListCell.reuseId, for: indexPath) as! MoviesListCellConfiguration
        cell.configureCell(with: movies[indexPath.row])
        
        return cell
    }
    
    func setup(viewModel: MoviesListModels.RequestListView.ViewModel) {
        movies = viewModel.movies
    }
    
    
}

// MARK: - UITableViewDataSource
extension MoviesListView: UITableViewDelegate {
    
}


// MARK: - UITableViewDelegate
extension MoviesListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRowsInSegment()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        makeCell(indexPath: indexPath)
    }
}
