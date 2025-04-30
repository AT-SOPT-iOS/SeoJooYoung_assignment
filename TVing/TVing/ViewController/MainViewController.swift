//
//  MainViewController.swift
//  TVing
//
//  Created by seozero on 4/30/25.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    // MARK: - Property
    
    
    // MARK: - UI Property
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = .mainLogo
        return image
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(.search, for: .normal)
        return button
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.setImage(.profile, for: .normal)
        return button
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
    }
    
    // MARK: - UI Setting
    
    private func setLayout() {
        view.backgroundColor = .black
        
        let headerButtonStackView = UIStackView(arrangedSubviews: [searchButton, profileButton])
        headerButtonStackView.axis = .horizontal
        headerButtonStackView.distribution = .fillProportionally
        headerButtonStackView.spacing = 10
        
        let headerStackView = UIStackView(arrangedSubviews: [logoImageView, headerButtonStackView])
        headerStackView.axis = .horizontal
        headerStackView.distribution = .fillProportionally
        headerStackView.spacing = 130
        headerStackView.alignment = .center
        
        self.view.addSubview(headerStackView)
        
        headerStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(78)
        }
        
        searchButton.snp.makeConstraints {
            $0.width.height.equalTo(30)
        }
        
        profileButton.snp.makeConstraints {
            $0.width.height.equalTo(30)
        }
    }
    
    // MARK: - Function
    
}

#Preview {
    MainViewController()
}
