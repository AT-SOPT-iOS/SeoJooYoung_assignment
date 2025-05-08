//
//  DailyBoxOfficeResponseModel.swift
//  TVing
//
//  Created by seozero on 5/9/25.
//

import Foundation

struct BoxOfficeResponse: Codable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [DailyBoxOffice]
}

struct DailyBoxOffice: Codable {
    let rank: String
    let movieNm: String
    let audiCnt: String
}
