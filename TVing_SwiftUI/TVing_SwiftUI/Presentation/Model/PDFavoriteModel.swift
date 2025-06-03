//
//  PDFavoriteModel.swift
//  TVing_SwiftUI
//
//  Created by seozero on 5/29/25.
//

import SwiftUI

struct PDFavoriteModel: Identifiable {
    var id = UUID()
    var title: String
    var image: Image
}

extension PDFavoriteModel {
    static func dummy() -> [PDFavoriteModel] {
        return [
            PDFavoriteModel(title: "뿅뿅 지구오락실 2", image: Image(.earthArcade)),
            PDFavoriteModel(title: "언젠가는 슬기로울 전공의생활", image: Image(.unseulsaeng)),
            PDFavoriteModel(title: "이혼보험", image: Image(.divorceInsurance)),
            PDFavoriteModel(title: "선재 업고 튀어", image: Image(.seonjae)),
            PDFavoriteModel(title: "환승연애3", image: Image(.exchange))
        ]
    }
}
