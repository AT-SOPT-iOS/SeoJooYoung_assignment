//
//  ContentsCategoryCollectionViewCell.swift
//  TVing
//
//  Created by seozero on 5/2/25.
//

import UIKit

class ContentsCategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "ContentsCategoryCollectionViewCell"
    
    private let contentsCategoryBackgroundView = UIView()
    private let contentsCategoryLogoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        contentsCategoryBackgroundView.do {
            $0.backgroundColor = .gray4
            $0.layer.cornerRadius = 3
        }
        
        contentsCategoryLogoImageView.do {
            $0.contentMode = .scaleAspectFit
        }
    }
    
    private func setLayout() {
        contentView.addSubview(contentsCategoryBackgroundView)
        contentsCategoryBackgroundView.addSubview(contentsCategoryLogoImageView)
        
        contentsCategoryBackgroundView.snp.makeConstraints {
            $0.width.equalTo(90)
            $0.height.equalTo(45)
        }
        
        contentsCategoryLogoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.bottom.equalToSuperview().inset(5)
        }
    }
}

extension ContentsCategoryCollectionViewCell {
    func contentsCategoryDataBind(_ data: ContentsCategoryModel) {
        contentsCategoryLogoImageView.image = data.image
    }
}
