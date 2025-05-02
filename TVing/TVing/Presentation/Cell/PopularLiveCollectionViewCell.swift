//
//  PopularLiveCollectionViewCell.swift
//  TVing
//
//  Created by seozero on 5/1/25.
//

import UIKit
import SnapKit
import Then

class PopularLiveCollectionViewCell: UICollectionViewCell {
    static let identifier = "PopularLiveCollectionViewCell"
    
    private let liveImageView = UIImageView()
    private let rankLabel = UILabel()
    private let channelLabel = UILabel()
    private let programNameLabel = UILabel()
    private let ratingLabel = UILabel()
    private let programInfoStackView = UIStackView()
    private let popularLiveInfoStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        liveImageView.do {
            $0.layer.cornerRadius = 3
            $0.clipsToBounds = true
        }
        
        rankLabel.do {
            $0.font = .italicSystemFont(ofSize: 19)
            $0.textColor = .white
        }
        
        channelLabel.do {
            $0.textColor = .white
            $0.font = .pretendard(size: 10, weight: .medium)
        }
        
        programNameLabel.do {
            $0.textColor = .gray1
            $0.font = .pretendard(size: 10, weight: .regular)
        }
        
        ratingLabel.do {
            $0.textColor = .gray1
            $0.font = .pretendard(size: 10, weight: .regular)
        }
        
        programInfoStackView.do {
            [channelLabel, programNameLabel, ratingLabel].forEach {
                programInfoStackView.addArrangedSubview($0)
            }
            $0.axis = .vertical
            $0.spacing = 0
            $0.alignment = .leading
        }
        
        popularLiveInfoStackView.do {
            [rankLabel, programInfoStackView].forEach {
                popularLiveInfoStackView.addArrangedSubview($0)
            }
            $0.axis = .horizontal
            $0.spacing = 5
            $0.alignment = .leading
        }
    }
    
    private func setLayout() {
        [liveImageView, popularLiveInfoStackView].forEach {
            contentView.addSubview($0)
        }
        
        liveImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(80)
        }
        
        popularLiveInfoStackView.snp.makeConstraints {
            $0.top.equalTo(liveImageView.snp.bottom).offset(10)
            $0.leading.bottom.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
    }
}

extension PopularLiveCollectionViewCell {
    func popularLiveDataBind(_ data: PopularLiveModel) {
        liveImageView.image = data.image
        rankLabel.text = "\(data.rank)"
        channelLabel.text = data.channel
        programNameLabel.text = data.programName
        ratingLabel.text = "\(data.rate.convertToOneDecimalString)%"
    }
}
