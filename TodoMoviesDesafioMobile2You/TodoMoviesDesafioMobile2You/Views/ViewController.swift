//
//  ViewController.swift
//  TodoMoviesDesafioMobile2You
//
//  Created by Thiago de Oliveira Sousa on 30/11/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
        Task {
            do {
                let movieDetails = (try await ServiceTMDB.shared.getMovieDetails(id: 724495))
                print(movieDetails)
            }
        }
    }
}

