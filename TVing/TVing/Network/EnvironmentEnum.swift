//
//  EnvironmentEnum.swift
//  TVing
//
//  Created by seozero on 5/28/25.
//

import UIKit

enum EnvironmentEnum {
    static let API_KEY: String = Bundle.main.infoDictionary?["API_KEY"] as! String
}
