//
//  Top20CollectionViewCell.swift
//  TVing
//
//  Created by seozero on 5/1/25.
//

import UIKit
import SnapKit
import Then

class Top20CollectionViewCell: UICollectionViewCell {
    static let identifier = "Top20CollectionViewCell"
    
    private let rankLabel = UILabel()
    private let movieImageView = UIImageView()
    private let top20StackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        rankLabel.do {
            $0.textColor = .white
            $0.font = .italicSystemFont(ofSize: 50)
        }
        
        top20StackView.do {
            [rankLabel, movieImageView].forEach { top20StackView.addArrangedSubview($0) }
            $0.axis = .horizontal
//            $0.spacing = 3
            $0.alignment = .trailing
            $0.distribution = .equalCentering
        }
        
        movieImageView.do {
            $0.layer.cornerRadius = 3
            $0.clipsToBounds = true
        }
    }
    
    private func setLayout() {
        [top20StackView].forEach { self.addSubview($0) }
        
        top20StackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(140)
        }
        
        movieImageView.snp.makeConstraints {
            $0.width.equalTo(98)
            $0.height.equalTo(146)
        }
        
    }
}

extension Top20CollectionViewCell {
    func top20DataBind(_ data: Top20Model) {
        rankLabel.text = "\(data.rank)"
        movieImageView.image = data.image
    }
}
