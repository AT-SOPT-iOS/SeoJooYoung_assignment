//
//  WelcomeViewController.swift
//  TVing
//
//  Created by seozero on 4/25/25.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var id: String?

    // MARK: - Property
    
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = .logo
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .pretendard(size: 23, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private let backToLoginVCButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.setTitle("메인으로", for: .normal)
        button.titleLabel?.font = .pretendard(size: 14, weight: .medium)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setAddTarget()
        bindID()
    }
    
    private func setLayout() {
        view.backgroundColor = .black
        
        [logoImageView, welcomeLabel, backToLoginVCButton].forEach {
            self.view.addSubview($0)
        }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(58)
            $0.height.equalTo(210)
            $0.width.equalToSuperview()
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(70)
            $0.centerX.equalToSuperview()
        }
        
        backToLoginVCButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-66)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setAddTarget() {
        backToLoginVCButton.addTarget(self, action: #selector(backToLoginVCButtonTapped), for: .touchUpInside)

    }
    
    private func bindID() {
        if let id = self.id, !id.isEmpty {
            self.welcomeLabel.text = "\(id)님 \n반가워요!"
        } else {
            self.welcomeLabel.text = "로그인을 해주세요!"
        }
    }
    
    @objc
    private func backToLoginVCButtonTapped() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

#Preview {
    WelcomeViewController()
}
