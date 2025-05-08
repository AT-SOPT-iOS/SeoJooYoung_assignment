//
//  BaseBallTeamModel.swift
//  TVing
//
//  Created by seozero on 5/2/25.
//

import UIKit

struct BaseBallTeamModel {
    var teamName: String
    var teamImage: UIImage
}

extension BaseBallTeamModel {
    static func dummy() -> [BaseBallTeamModel] {
        return [
            BaseBallTeamModel(teamName: "LG Twins", teamImage: .lgTwins),
            BaseBallTeamModel(teamName: "Lotte Giants", teamImage: .lotteGiants),
            BaseBallTeamModel(teamName: "Hanhwa Eagles", teamImage: .hanhwaEagles),
            BaseBallTeamModel(teamName: "Samsung Lions", teamImage: .samsungLions),
            BaseBallTeamModel(teamName: "KT Wiz", teamImage: .ktWiz),
            BaseBallTeamModel(teamName: "SSG Landers", teamImage: .ssgLanders),
            BaseBallTeamModel(teamName: "Kia Tigers", teamImage: .kiaTigers),
            BaseBallTeamModel(teamName: "Doosan Bears", teamImage: .doosanBears),
            BaseBallTeamModel(teamName: "NC Dinos", teamImage: .ncDinos),
            BaseBallTeamModel(teamName: "Kiwoom Heros", teamImage: .kiwoomHeros)
        ]
    }
}
