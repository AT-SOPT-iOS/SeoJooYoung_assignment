//
//  TestModel.swift
//  TVing
//
//  Created by seozero on 5/1/25.
//

import UIKit

struct Top20Model {
    var rank: Int
    var image: UIImage
}

extension Top20Model {
    static func dummy() -> [Top20Model] {
        return [
            Top20Model(rank: 1, image: .signal),
            Top20Model(rank: 2, image: .harryPotter),
            Top20Model(rank: 3, image: .theLordofRings),
            Top20Model(rank: 4, image: .suzume)
        ]
    }
}
