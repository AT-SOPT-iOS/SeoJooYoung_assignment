//
//  BaseballTeamModel.swift
//  TVing_SwiftUI
//
//  Created by seozero on 5/29/25.
//

import SwiftUI

struct BaseballTeamModel: Identifiable {
    var id = UUID()
    var teamName: String
    var teamImage: Image
}

extension BaseballTeamModel {
    static func dummy() -> [BaseballTeamModel] {
        return [
            BaseballTeamModel(teamName: "LG Twins", teamImage: Image(.lgTwins)),
            BaseballTeamModel(teamName: "Lotte Giants", teamImage: Image(.lotteGiants)),
            BaseballTeamModel(teamName: "Hanhwa Eagles", teamImage: Image(.hanhwaEagles)),
            BaseballTeamModel(teamName: "Samsung Lions", teamImage: Image(.samsungLions)),
            BaseballTeamModel(teamName: "KT Wiz", teamImage: Image(.ktWiz)),
            BaseballTeamModel(teamName: "SSG Landers", teamImage: Image(.ssgLanders)),
            BaseballTeamModel(teamName: "Kia Tigers", teamImage: Image(.kiaTigers)),
            BaseballTeamModel(teamName: "Doosan Bears", teamImage: Image(.doosanBears)),
            BaseballTeamModel(teamName: "NC Dinos", teamImage: Image(.ncDinos)),
            BaseballTeamModel(teamName: "Kiwoom Heros", teamImage: Image(.kiwoomHeros))
        ]
    }
}
