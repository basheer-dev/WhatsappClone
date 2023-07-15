//
//  PhoneNumberVC.swift
//  WhatsappClone
//
//  Created by Basheer Abdulmalik on 15/07/2023.
//

import UIKit

final class PhoneNumberVC: UIViewController {
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "WhatsAppClone will send an SMS message (carrier charges may apply) to verify your phone number. Enter you country code and phone number:"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray
        
        return label
    }()
    
    private let countryCodeTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        
        field.keyboardType = .numberPad
        field.textAlignment = .center
        
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        
        field.rightViewMode = .always
        field.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        
        return field
    }()
    
    private let phoneNumberTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        
        field.placeholder = "Phone Number"
        field.keyboardType = .numberPad
        field.returnKeyType = .continue
        field.textAlignment = .left
        
        field.rightViewMode = .always
        field.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        
        return field
    }()
    
    private let plusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "+"
        label.textColor = .systemGray
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var countryCodeUnderLine: UIView = getUnderLine()
    private lazy var phoneNumberUnderLine: UIView = getUnderLine()
    
    private func getUnderLine() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .systemGreen
        
        return view
    }
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.configuration = .filled()
        button.configuration?.title = "Next"
        button.configuration?.cornerStyle = .small
        button.configuration?.baseBackgroundColor = .systemGreen
        
        return button
    }()
    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.titleView?.tintColor = .systemGreen
        title = "Verify your phone number"
    }
    
    override func viewDidLayoutSubviews() {
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        view.addSubview(descriptionLabel)
        view.addSubview(countryCodeTextField)
        view.addSubview(phoneNumberTextField)
        view.addSubview(plusLabel)
        view.addSubview(countryCodeUnderLine)
        view.addSubview(phoneNumberUnderLine)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            countryCodeTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50),
            countryCodeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            countryCodeTextField.widthAnchor.constraint(equalToConstant: 65),
            countryCodeTextField.heightAnchor.constraint(equalToConstant: 35),
            
            phoneNumberTextField.leadingAnchor.constraint(equalTo: countryCodeTextField.trailingAnchor, constant: 25),
            phoneNumberTextField.topAnchor.constraint(equalTo: countryCodeTextField.topAnchor),
            phoneNumberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            phoneNumberTextField.heightAnchor.constraint(equalToConstant: 35),
            
            plusLabel.centerYAnchor.constraint(equalTo: countryCodeTextField.centerYAnchor),
            plusLabel.leadingAnchor.constraint(equalTo: countryCodeTextField.leadingAnchor),
            
            countryCodeUnderLine.leadingAnchor.constraint(equalTo: countryCodeTextField.leadingAnchor),
            countryCodeUnderLine.topAnchor.constraint(equalTo: countryCodeTextField.bottomAnchor),
            countryCodeUnderLine.trailingAnchor.constraint(equalTo: countryCodeTextField.trailingAnchor),
            countryCodeUnderLine.heightAnchor.constraint(equalToConstant: 2),
            
            phoneNumberUnderLine.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor),
            phoneNumberUnderLine.leadingAnchor.constraint(equalTo: phoneNumberTextField.leadingAnchor),
            phoneNumberUnderLine.trailingAnchor.constraint(equalTo: phoneNumberTextField.trailingAnchor),
            phoneNumberUnderLine.heightAnchor.constraint(equalToConstant: 2),
            
            nextButton.topAnchor.constraint(equalTo: phoneNumberUnderLine.bottomAnchor, constant: 150),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 120),
            nextButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    // MARK: - ACTIONS
    @objc private func nextButtonTapped() {
        guard let countryCode = countryCodeTextField.text,
              let phoneNumberText = phoneNumberTextField.text,
              !countryCode.isEmpty, !phoneNumberText.isEmpty else { return }
        AuthManager.shared.authenticateUser(phoneNumber: "+\(countryCode)\(phoneNumberText)") {
            [weak self] success in
            guard success else { return }
            let dest = SMSCodeVC()
            self?.navigationController?.pushViewController(dest, animated: true)
        }
    }
}
