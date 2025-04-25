//
//  LoginViewController.swift
//  TVing
//
//  Created by seozero on 4/25/25.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    // MARK: - Property
    
    let loginTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "TVING ID 로그인"
        label.textColor = .white
        label.font = .pretendard(size: 23, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    var idTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "아이디"
        textfield.setPlaceholderColor(.gray2)
        textfield.textColor = .gray2
        textfield.backgroundColor = .gray4
        textfield.font = .pretendard(size: 15, weight: .semiBold)
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: 0))
        textfield.leftViewMode = .always
        textfield.layer.cornerRadius = 3
        return textfield
    }()
    
    var pwTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "비밀번호"
        textfield.setPlaceholderColor(.gray2)
        textfield.textColor = .gray2
        textfield.backgroundColor = .gray4
        textfield.font = .pretendard(size: 15, weight: .semiBold)
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: 0))
        textfield.leftViewMode = .always
        textfield.layer.cornerRadius = 3
        return textfield
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.titleLabel?.font = .pretendard(size: 14, weight: .semiBold)
        button.setTitleColor(.gray2, for: .normal)
        button.layer.borderColor = UIColor.gray4.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        return button
    }()
    
    let findIDButton: UIButton = {
        let button = UIButton()
        button.setTitle("아이디 찾기", for: .normal)
        button.titleLabel?.font = .pretendard(size: 14, weight: .semiBold)
        button.setTitleColor(.gray2, for: .normal)
        return button
    }()
    
    let findPWButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 찾기", for: .normal)
        button.titleLabel?.font = .pretendard(size: 14, weight: .semiBold)
        button.setTitleColor(.gray2, for: .normal)
        return button
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray4
        return view
    }()
    
    let signUpPromptLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.textColor = .gray3
        label.font = .pretendard(size: 14, weight: .semiBold)
        return label
    }()
    
    let createNickNameButton: UIButton = {
        let button = UIButton()
        button.setTitle("닉네임 만들러가기", for: .normal)
        button.titleLabel?.font = .pretendard(size: 14, weight: .regular)
        button.setTitleColor(.gray2, for: .normal)
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        setLayout()
        setDelegate()
    }
    
    // MARK: - Function
    
    private func setLayout() {
        [loginTitleLabel, idTextField, pwTextField, loginButton, ].forEach {
            self.view.addSubview($0)
        }
        
        dividerView.snp.makeConstraints { make in
            make.width.equalTo(1)
            make.height.equalTo(12)
        }
        
        let findButtonStackView = UIStackView(arrangedSubviews: [findIDButton, dividerView, findPWButton])
        findButtonStackView.axis = .horizontal
        findButtonStackView.distribution = .fillProportionally
        findButtonStackView.spacing = 34
        
        self.view.addSubview(findButtonStackView)
        
        let signUpStackView = UIStackView(arrangedSubviews: [signUpPromptLabel, createNickNameButton])
        signUpStackView.axis = .horizontal
        signUpStackView.distribution = .fillEqually
        signUpStackView.spacing = 30
        
        self.view.addSubview(signUpStackView)
        
        loginTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(90)
            make.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(loginTitleLabel.snp.bottom).offset(31)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(52)
        }
        
        pwTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(7)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(pwTextField.snp.bottom).offset(21)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(52)
        }
        
        findButtonStackView.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(31)
            make.centerX.equalToSuperview()
            make.width.equalTo(240)
        }
        
        signUpStackView.snp.makeConstraints { make in
            make.top.equalTo(findButtonStackView.snp.bottom).offset(28)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
        }
    }
    
    private func setDelegate() {
        idTextField.delegate = self
        pwTextField.delegate = self
    }
}

    // MARK: - Extension

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.gray2.cgColor
        textField.layer.borderWidth = 1
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.gray4.cgColor
        textField.layer.borderWidth = 0
    }
}


#Preview {
    LoginViewController()
}
