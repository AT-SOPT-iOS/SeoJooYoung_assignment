//
//  PopularMovieModel.swift
//  TVing_SwiftUI
//
//  Created by seozero on 5/29/25.
//

import SwiftUI

struct PopularMovieModel: Identifiable {
    var id = UUID()
    var image: Image
}

extension PopularMovieModel {
    static func dummy() -> [PopularMovieModel] {
        return [
            PopularMovieModel(image: Image(.signal)),
            PopularMovieModel(image: Image(.harryPotter)),
            PopularMovieModel(image: Image(.theLordofRings)),
            PopularMovieModel(image: Image(.suzume))
        ]
    }
}
