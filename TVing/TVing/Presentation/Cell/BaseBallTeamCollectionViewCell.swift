//
//  BaseBallTeamCollectionViewCell.swift
//  TVing
//
//  Created by seozero on 5/2/25.
//

import UIKit

class BaseBallTeamCollectionViewCell: UICollectionViewCell {
    static let identifier = "BaseBallTeamCollectionViewCell"
        
    private let baseballBackgroundView = UIView()
    private let baseballTeamLogoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle(for index: Int) {
        baseballBackgroundView.do {
            $0.backgroundColor = (index % 2 == 0) ? .white : .black
            $0.layer.cornerRadius = 3
        }
    }
    
    private func setLayout() {
        contentView.addSubview(baseballBackgroundView)
        baseballBackgroundView.addSubview(baseballTeamLogoImageView)
        
        baseballBackgroundView.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(50)
        }
        
        baseballTeamLogoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(10)
        }
    }
}

extension BaseBallTeamCollectionViewCell {
    func baseBallTeamDataBind(_ data: BaseBallTeamModel, at index: Int) {
        baseballTeamLogoImageView.image = data.teamImage
        setStyle(for: index)
    }
}
