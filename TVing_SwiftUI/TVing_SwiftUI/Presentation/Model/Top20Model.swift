//
//  Top20Model.swift
//  TVing_SwiftUI
//
//  Created by seozero on 5/29/25.
//

import SwiftUI

struct Top20Model: Identifiable {
    let id = UUID()
    let rank: Int
    let image: Image
}

extension Top20Model {
    static func dummy() -> [Top20Model] {
        return [
            Top20Model(rank: 1, image: Image("signal")),
            Top20Model(rank: 2, image: Image("harryPotter")),
            Top20Model(rank: 3, image: Image("theLordofRings")),
            Top20Model(rank: 4, image: Image("suzume"))
        ]
    }
}
