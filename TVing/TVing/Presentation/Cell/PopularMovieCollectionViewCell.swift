//
//  PopularMovieCollectionViewCell.swift
//  TVing
//
//  Created by seozero on 5/2/25.
//

import UIKit

class PopularMovieCollectionViewCell: UICollectionViewCell {
    static let identifier = "PopularMovieCollectionViewCell"
    
    private let movieImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        movieImageView.do {
            $0.layer.cornerRadius = 3
            $0.clipsToBounds = true
        }
    }
    
    private func setLayout() {
        [movieImageView].forEach {
            contentView.addSubview($0)
        }
        
        movieImageView.snp.makeConstraints {
            $0.width.equalTo(98)
            $0.height.equalTo(146)
        }
    }
}

extension PopularMovieCollectionViewCell {
    func popularMovieDataBind(_ data: PopularMovieModel) {
        movieImageView.image = data.image
    }
}
