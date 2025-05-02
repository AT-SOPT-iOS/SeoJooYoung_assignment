//
//  PopularLiveModel.swift
//  TVing
//
//  Created by seozero on 5/2/25.
//

import UIKit

struct PopularLiveModel {
    var image: UIImage
    var rank: Int
    var channel: String
    var programName: String
    var rate: Float
}

extension PopularLiveModel {
    static func dummy() -> [PopularLiveModel] {
        return [
            PopularLiveModel(image: .exchange, rank: 1, channel: "JTBC", programName: "환승연애3", rate: 27.2),
            PopularLiveModel(image: .askTheStars, rank: 2, channel: "TvN", programName: "별들에게 물어봐 10화", rate: 20.9),
            PopularLiveModel(image: .seonjae, rank: 3, channel: "JTBC", programName: "선재 업고 튀어 13화", rate: 19.2)
        ]
    }
}
