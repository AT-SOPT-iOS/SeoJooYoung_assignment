//
//  ContentCategoryModel.swift
//  TVing_SwiftUI
//
//  Created by seozero on 5/29/25.
//

import SwiftUI

struct ContentCategoryModel: Identifiable {
    var id = UUID()
    var name: String
    var image: Image
}

extension ContentCategoryModel {
    static func dummy() -> [ContentCategoryModel] {
        return [
            ContentCategoryModel(name: "Apple TV Plus", image: Image(.appleTV)),
            ContentCategoryModel(name: "KBO", image: Image(.kbo)),
            ContentCategoryModel(name: "KBL", image: Image(.kbl)),
            ContentCategoryModel(name: "AFC Champions League", image: Image(.afc))
        ]
    }
}
