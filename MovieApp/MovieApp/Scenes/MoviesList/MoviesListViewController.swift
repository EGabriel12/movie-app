//
//  ViewController.swift
//  MovieApp
//
//  Created by Elias Gabriel on 03/02/23.
//

import UIKit

class MoviesListViewController: UIViewController {
    
    private let customView: MoviesListViewConfiguration
    
    init(customView: MoviesListViewConfiguration) {
        self.customView = customView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        view.backgroundColor = .systemBackground
    }
}

