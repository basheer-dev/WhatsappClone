//
//  SMSCodeVC.swift
//  WhatsappClone
//
//  Created by Basheer Abdulmalik on 15/07/2023.
//

import UIKit

final class SMSCodeVC: UIViewController {
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Enter a 6-digit PIN which you'll be asked for when you register your phone number with WhatsAppClone:"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray
        
        return label
    }()
    
    private let SMSCodeTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        
        field.placeholder = "- - -   - - -"
        field.textColor = .systemGreen
        field.font = .systemFont(ofSize: 25)
        field.keyboardType = .numberPad
        field.textAlignment = .center
        
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        
        field.rightViewMode = .always
        field.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        
        return field
    }()
    
    private let SMSCodeUnderLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .systemGreen
        
        return view
    }()
    
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
        title = "SMS verification"
    }
    
    override func viewDidLayoutSubviews() {
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        view.addSubview(descriptionLabel)
        view.addSubview(SMSCodeTextField)
        view.addSubview(SMSCodeUnderLine)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            SMSCodeTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50),
            SMSCodeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 125),
            SMSCodeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -125),
            SMSCodeTextField.heightAnchor.constraint(equalToConstant: 35),
            
            SMSCodeUnderLine.leadingAnchor.constraint(equalTo: SMSCodeTextField.leadingAnchor),
            SMSCodeUnderLine.topAnchor.constraint(equalTo: SMSCodeTextField.bottomAnchor),
            SMSCodeUnderLine.trailingAnchor.constraint(equalTo: SMSCodeTextField.trailingAnchor),
            SMSCodeUnderLine.heightAnchor.constraint(equalToConstant: 2),
            
            nextButton.topAnchor.constraint(equalTo: SMSCodeUnderLine.bottomAnchor, constant: 150),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 120),
            nextButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    // MARK: - ACTIONS
    @objc private func nextButtonTapped() {
        guard let SMSCode = SMSCodeTextField.text,
              !SMSCode.isEmpty else { return }
        AuthManager.shared.verifySMSCode(SMSCode: SMSCode) {
            success in
            guard success else { return }
            print("verified")
        }
    }
}
