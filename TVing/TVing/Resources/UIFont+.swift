//
//  UIFont+.swift
//  TVing
//
//  Created by seozero on 4/25/25.
//

import UIKit

extension UIFont {
    enum Pretendard: String {
        case black = "Pretendard-Black" // 900
        case extraBold = "Pretendard-ExtraBold" // 800
        case bold = "Pretendard-Bold" // 700
        case semiBold = "Pretendard-SemiBold" // 600
        case medium = "Pretendard-Medium" // 500
        case regular = "Pretendard-Regular" // 400
        case light = "Pretendard-Light" // 300
        case extraLight = "Pretendard-ExtraLight" // 200
        case thin = "Pretendard-Thin" // 100
    }
    
    static func pretendard(size: CGFloat, weight: Pretendard) -> UIFont {
        return UIFont(name: weight.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
