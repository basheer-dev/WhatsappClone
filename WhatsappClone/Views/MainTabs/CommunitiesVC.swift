//
//  CommunitiesVC.swift
//  WhatsappClone
//
//  Created by Basheer Abdulmalik on 15/07/2023.
//

import UIKit

final class CommunitiesVC: UIViewController {
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.showsVerticalScrollIndicator = false
        
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Communities"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Introducing Communities"
        label.font = .systemFont(ofSize: 20)
        
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Easily organize your related groups and send announcements. Now, your communities, like neighborhoods or schools, can have their own space."
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textColor = .systemGray
        
        return label
    }()
    
    private let startButton: UILabel = {
        let button = UILabel()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.text = "Start a Community"
        button.textColor = .systemBlue
        button.textAlignment = .left
        button.font = .systemFont(ofSize: 20)
        
        return button
    }()
    
    private lazy var topSeparator: UIView = getLineSeparator()
    private lazy var bottomSeparator: UIView = getLineSeparator()
    
    private func getLineSeparator() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .systemGray3
        
        return view
    }
    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "Communities"
    }
    
    override func viewDidLayoutSubviews() {
        scrollView.addSubview(imageView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(subTitleLabel)
        scrollView.addSubview(startButton)
        scrollView.addSubview(topSeparator)
        scrollView.addSubview(bottomSeparator)
        
        view.addSubview(scrollView)
        
        configureLayouts()
    }
    
    // MARK: - LAYOUTS CONFIG
    private func configureLayouts() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 25),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 175),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subTitleLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            startButton.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 50),
            startButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            startButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50),
            
            topSeparator.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -20),
            topSeparator.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            topSeparator.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            topSeparator.heightAnchor.constraint(equalToConstant: 1),
            
            bottomSeparator.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 20),
            bottomSeparator.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            bottomSeparator.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            bottomSeparator.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
}
