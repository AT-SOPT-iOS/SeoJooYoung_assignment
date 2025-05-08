//
//  PDFavoriteWorkCollectionViewCell.swift
//  TVing
//
//  Created by seozero on 5/2/25.
//

import UIKit

class PDFavoriteWorkCollectionViewCell: UICollectionViewCell {
    static let identifier = "PDFavoriteWorkCollectionViewCell"
    
    private let pdFavoriteWorkImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        pdFavoriteWorkImageView.do {
            $0.layer.cornerRadius = 3
            $0.clipsToBounds = true
        }
    }
    
    private func setLayout() {
        [pdFavoriteWorkImageView].forEach {
            contentView.addSubview($0)
        }
        
        pdFavoriteWorkImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.width.equalTo(160)
            $0.height.equalTo(90)
        }
    }
}

extension PDFavoriteWorkCollectionViewCell {
    func pdFavoriteWorkDataBind(_ data: PDFavoriteWorkModel) {
        pdFavoriteWorkImageView.image = data.image
    }
}
