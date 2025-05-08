//
//  DailyBoxOfficeService.swift
//  TVing
//
//  Created by seozero on 5/9/25.
//

import Foundation

final class DailyBoxOfficeService {
    
    static let shared = DailyBoxOfficeService()
    private init() {}
    
    private let apiKey = "8e075a7b9de00c9639f8c734e2c7b07c"
    
    // URLRequest 생성
    private func makeRequest(for date: String) -> URLRequest? {
        let urlString = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(apiKey)&targetDt=\(date)"
        guard let url = URL(string: urlString) else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
    
    // 실제 네트워크 통신
    func fetchDailyBoxOffice(for date: String) async throws -> [DailyBoxOffice] {
        guard let request = makeRequest(for: date) else {
            throw NetworkError.requestEncodingError
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        
        do {
            let decoded = try JSONDecoder().decode(BoxOfficeResponse.self, from: data)
            return decoded.boxOfficeResult.dailyBoxOfficeList
        } catch {
            print("디코딩 실패: \(error)")
            throw NetworkError.responseDecodingError
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
}

