//
//  PDFavoriteWorkModel.swift
//  TVing
//
//  Created by seozero on 5/2/25.
//

import UIKit

struct PDFavoriteWorkModel {
    var title: String
    var image: UIImage
}

extension PDFavoriteWorkModel {
    static func dummy() -> [PDFavoriteWorkModel] {
        return [
            PDFavoriteWorkModel(title: "뿅뿅 지구오락실 2", image: .earthArcade),
            PDFavoriteWorkModel(title: "언젠가는 슬기로울 전공의생활", image: .unseulsaeng),
            PDFavoriteWorkModel(title: "이혼보험", image: .divorceInsurance)
        ]
    }
}
