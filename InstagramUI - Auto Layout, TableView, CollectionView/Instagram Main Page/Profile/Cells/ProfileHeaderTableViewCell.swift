//
//  ProfileHeaderTableViewCell.swift
//  Instagram Main Page
//
//  Created by Mathew Lantsov on 28.03.2024.
//

import UIKit

class ProfileHeaderTableViewCell: UITableViewCell {
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initalise()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Private constants
    private enum UIConstants {
        static let userImageSize: CGFloat = 70
        static let contentInsertForUserImg: CGFloat = 20
        static let contentInsert: CGFloat = 8
        static let contentInsertForSub: CGFloat = 20
        static let contentInsertForUserImgTop: CGFloat = 50
        static let subTextSize: CGFloat = 18
        static let textSize: CGFloat = 19
        static let subSecTextSize: CGFloat = 14
        static let heightForButtons: CGFloat = 35
        static let menuButtonHeight: CGFloat = 30
        static let buttonsBorderWidth: CGFloat = 1.5
    }
    
    //MARK: - Private Properties
    private var userImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.userImageSize / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let userNameLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 17)
        return view
    }()
    
    private let subscribersLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.subTextSize, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let subscribedLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.subTextSize, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let postsCountLabel: UILabel = {
        let label = UILabel()
        //TODO: - Change
        label.font = .systemFont(ofSize: UIConstants.subTextSize, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let subscribersTextLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.subSecTextSize)
        label.text = "Subscribers"
        label.textAlignment = .center
        return label
    }()
    
    private let subscribedTextLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.subSecTextSize)
        label.text = "Subscribed"
        label.textAlignment = .center
        return label
    }()
    
    private let postsTextLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.subSecTextSize)
        label.textAlignment = .center
        label.text = "posts"
        return label
    }()
    
    private let nameDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.textSize, weight: .semibold)
        return label
    }()
    
    private let jobLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 19)
        return label
    }()
    
    private let subscribeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Subscribe", for: .normal)
        button.layer.cornerRadius = 6
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let writeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Write", for: .normal)
        button.layer.cornerRadius = 6
        button.backgroundColor = .clear
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = UIConstants.buttonsBorderWidth
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    private let menuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.layer.cornerRadius = 6
        button.backgroundColor = .clear
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = UIConstants.buttonsBorderWidth
        return button
    }()
    
    //MARK: - Public Func
    func configure(with userData: ProfileInfo, postsInfo: Int) {
        userImage.image = UIImage(named: userData.profileImage)
        userNameLabel.text = userData.username
        subscribersLabel.text = String(userData.subscribers)
        subscribedLabel.text = String(userData.subscribed)
        nameDescriptionLabel.text = String(userData.name)
        switch userData.job {
        case .enterprenur:
            jobLabel.text = "enterprenur"
        case .blogger:
            jobLabel.text = "blogger"
        }
        descriptionLabel.text = userData.description
        postsCountLabel.text = "\(postsInfo)"
        
    }
    
    private func initalise() {
        selectionStyle = .none
        
        
        let buttonsStack = UIStackView()
        buttonsStack.axis = .horizontal
        buttonsStack.addArrangedSubview(subscribeButton)
        buttonsStack.addArrangedSubview(writeButton)
        buttonsStack.distribution = .fillEqually
        buttonsStack.spacing = 10
        
        let postStack = UIStackView()
        postStack.axis = .vertical
        postStack.addArrangedSubview(postsCountLabel)
        postStack.addArrangedSubview(postsTextLabel)
        
        let subscribersStack = UIStackView()
        subscribersStack.axis = .vertical
        subscribersStack.addArrangedSubview(subscribersLabel)
        subscribersStack.addArrangedSubview(subscribersTextLabel)
        
        let subscribedStack = UIStackView()
        subscribedStack.axis = .vertical
        subscribedStack.addArrangedSubview(subscribedLabel)
        subscribedStack.addArrangedSubview(subscribedTextLabel)
        
        let allSubscriptStack = UIStackView()
        allSubscriptStack.axis = .horizontal
        allSubscriptStack.distribution = .fillEqually
        allSubscriptStack.spacing = 13
        allSubscriptStack.addArrangedSubview(subscribersStack)
        allSubscriptStack.addArrangedSubview(subscribedStack)
        allSubscriptStack.addArrangedSubview(postStack)
     
        let descriptionStack = UIStackView()
        descriptionStack.axis = .vertical
        descriptionStack.addArrangedSubview(nameDescriptionLabel)
        descriptionStack.addArrangedSubview(jobLabel)
        descriptionStack.addArrangedSubview(descriptionLabel)
        
        contentView.addSubview(descriptionStack)
        contentView.addSubview(userImage)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(buttonsStack)
        contentView.addSubview(menuButton)
        contentView.addSubview(allSubscriptStack)
        
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
//        subscribersStack.translatesAutoresizingMaskIntoConstraints = false
//        subscribedStack.translatesAutoresizingMaskIntoConstraints = false
        descriptionStack.translatesAutoresizingMaskIntoConstraints = false
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        menuButton.translatesAutoresizingMaskIntoConstraints = false
//        postStack.translatesAutoresizingMaskIntoConstraints = false
        allSubscriptStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: UIConstants.contentInsertForUserImgTop),
            userImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UIConstants.contentInsertForUserImg),
            userImage.widthAnchor.constraint(equalToConstant: UIConstants.userImageSize),
            userImage.heightAnchor.constraint(equalToConstant: UIConstants.userImageSize),

            
            userNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: UIConstants.contentInsert),
            userNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            
            allSubscriptStack.topAnchor.constraint(equalTo: userImage.topAnchor),
            allSubscriptStack.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: UIConstants.contentInsertForSub),
            allSubscriptStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UIConstants.contentInsert),
            
            descriptionStack.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: UIConstants.contentInsert),
            descriptionStack.leadingAnchor.constraint(equalTo: userImage.leadingAnchor),
            descriptionStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UIConstants.contentInsert),


            
            buttonsStack.topAnchor.constraint(equalTo: descriptionStack.bottomAnchor, constant: UIConstants.contentInsert),
            buttonsStack.leadingAnchor.constraint(equalTo: descriptionStack.leadingAnchor),
            buttonsStack.trailingAnchor.constraint(equalTo: menuButton.leadingAnchor, constant: -UIConstants.contentInsert),
            buttonsStack.heightAnchor.constraint(equalToConstant: UIConstants.heightForButtons),
            contentView.bottomAnchor.constraint(equalTo: buttonsStack.bottomAnchor, constant: 20),
            
            menuButton.heightAnchor.constraint(equalTo: buttonsStack.heightAnchor, multiplier: 1),
            menuButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UIConstants.contentInsert),
            menuButton.topAnchor.constraint(equalTo: buttonsStack.topAnchor),
            menuButton.widthAnchor.constraint(equalToConstant: UIConstants.menuButtonHeight)
        ])

    }

}
