//
//  Untitled.swift
//  TVing
//
//  Created by seozero on 5/2/25.
//

import UIKit

struct ContentsCategoryModel {
    var name: String
    var image: UIImage
}

extension ContentsCategoryModel {
    static func dummy() -> [ContentsCategoryModel] {
        return [
            ContentsCategoryModel(name: "Apple TV Plus", image: .appleTV),
            ContentsCategoryModel(name: "KBO", image: .kbo),
            ContentsCategoryModel(name: "KBL", image: .kbl),
            ContentsCategoryModel(name: "AFC Champions League", image: .afc)
        ]
    }
}
