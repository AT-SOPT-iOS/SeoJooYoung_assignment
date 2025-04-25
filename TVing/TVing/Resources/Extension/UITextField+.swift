//
//  UITextField+.swift
//  TVing
//
//  Created by seozero on 4/25/25.
//

import UIKit

extension UITextField {
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues { $0 }
        )
    }
}
