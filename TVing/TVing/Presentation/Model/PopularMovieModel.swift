//
//  PopularMovieModel.swift
//  TVing
//
//  Created by seozero on 5/2/25.
//

import UIKit

struct PopularMovieModel {
    var image: UIImage
}

extension PopularMovieModel {
    static func dummy() -> [PopularMovieModel] {
        return [
            PopularMovieModel(image: .signal),
            PopularMovieModel(image: .harryPotter),
            PopularMovieModel(image: .theLordofRings),
            PopularMovieModel(image: .suzume)
        ]
    }
}
