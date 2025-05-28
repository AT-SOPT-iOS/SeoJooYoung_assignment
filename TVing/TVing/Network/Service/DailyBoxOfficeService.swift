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
    
    // URLRequest 생성
    private func makeRequest(for date: String) -> URLRequest? {
        var key = EnvironmentEnum.API_KEY
        print(key)
        var urlString = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key="
        
        urlString += "\(key)&targetDt=\(date)"
        
        print(urlString)
        
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

