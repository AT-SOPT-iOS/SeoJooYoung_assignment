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
    
    let securityToggleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(.eyeSlash, for: .normal)
        return button
    }()
    
    let allClearButton: UIButton = {
        let button = UIButton()
        button.setImage(.xCircle, for: .normal)
        button.tintColor = .gray2
        return button
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
        textfield.isSecureTextEntry = true
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
        setAddTarget()
    }
    
    // MARK: - UI Setting
    
    private func setLayout() {
        [loginTitleLabel, idTextField, pwTextField, loginButton, securityToggleButton, allClearButton].forEach {
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
        
        securityToggleButton.snp.makeConstraints { make in
            make.top.equalTo(pwTextField.snp.top).offset(18)
            make.trailing.equalTo(pwTextField.snp.trailing).offset(-20)
            make.width.height.equalTo(20)
        }
        
        allClearButton.snp.makeConstraints { make in
            make.top.equalTo(securityToggleButton.snp.top).offset(0)
            make.trailing.equalTo(securityToggleButton.snp.leading).offset(-16)
            make.width.height.equalTo(20)
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
    
    // MARK: - Function
    
    private func setDelegate() {
        idTextField.delegate = self
        pwTextField.delegate = self
    }
    
    private func setAddTarget() {
        idTextField.addTarget(self, action: #selector(textfieldDidChange), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(textfieldDidChange), for: .editingChanged)
        securityToggleButton.addTarget(self, action: #selector(togglePWSecurity), for: .touchUpInside)
        allClearButton.addTarget(self, action: #selector(clearTextField(_:)), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func textfieldDidChange() {
        let isIDFilled = !(idTextField.text ?? "").isEmpty
        let isPWFilled = !(pwTextField.text ?? "").isEmpty
        let loginBtnEnable = isIDFilled && isPWFilled
        
        loginButton.isEnabled = loginBtnEnable
        loginButton.backgroundColor = loginBtnEnable ? .red : .clear
        loginButton.setTitleColor(loginBtnEnable ? .white : .gray2, for: .normal)
    }
    
    @objc
    private func togglePWSecurity() {
        pwTextField.isSecureTextEntry.toggle()
                
        let image = pwTextField.isSecureTextEntry ? UIImage.eyeSlash : UIImage.eye.withTintColor(UIColor.gray1)
        securityToggleButton.setImage(image, for: .normal)
    }
    
    @objc
    private func clearTextField(_ sender: UIButton) {
        if idTextField.isFirstResponder {
            idTextField.text = ""
            idTextField.sendActions(for: .editingChanged)
        } else if pwTextField.isFirstResponder {
            pwTextField.text = ""
            pwTextField.sendActions(for: .editingChanged)
        }
    }
    
    @objc
    private func loginButtonTapped() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.id = idTextField.text
        navigationController?.pushViewController(welcomeVC, animated: true)
        navigationController?.navigationBar.isHidden = true
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
