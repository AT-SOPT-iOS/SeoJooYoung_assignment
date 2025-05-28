//
//  PopularLiveModel.swift
//  TVing_SwiftUI
//
//  Created by seozero on 5/29/25.
//

import SwiftUI

struct PopularLiveModel: Identifiable {
    var id = UUID()
    var image: Image
    var rank: Int
    var channel: String
    var programName: String
    var rate: Float
}

extension PopularLiveModel {
    static func dummy() -> [PopularLiveModel] {
        return [
            PopularLiveModel(image: Image(.exchange), rank: 1, channel: "JTBC", programName: "환승연애3", rate: 27.2),
            PopularLiveModel(image: Image(.askTheStars), rank: 2, channel: "TvN", programName: "별들에게 물어봐 10화", rate: 20.9),
            PopularLiveModel(image: Image(.seonjae), rank: 3, channel: "JTBC", programName: "선재 업고 튀어 13화", rate: 19.2)
        ]
    }
}
