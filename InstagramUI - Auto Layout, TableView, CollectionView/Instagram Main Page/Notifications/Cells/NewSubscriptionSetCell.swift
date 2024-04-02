import UIKit

class NewSubscriptionCell: UITableViewCell {


    //MARK: - Public
        func configure(with info: NotificationSubscriptionCellInfo) {
            userImage.image = info.userImage
            username.text = info.username
            configureSubscriptionLabel(with: username)
            
            let isSubscribed = UserDefaults.standard.bool(forKey: info.username) // Use the username as the key
            updateSubscriptionButton(isSubscribed: isSubscribed)
        }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        initalise()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    
    //MARK: - Private constants
    private enum UIConstants {
        static let userImageSize: CGFloat = 50
        static let subscriptionButtonInsert: CGFloat = 20
        static let contentInsert: CGFloat = 10
        static let contentTopInsert: CGFloat = 15
        static let subscriptionLabelFontSize: CGFloat = 14
        static let subscriptionLabelFromImage: CGFloat = 15
        static let subscriptionButtonCornerRadius: CGFloat = 5
        static let subscriptionButtonWidth: CGFloat = 150
    }

    //MARK: - Private Properties

    private let userImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.userImageSize / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let username: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    
    private let subscriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.subscriptionLabelFontSize)
        return label
    }()
    
    private let subscriptiptionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Subscribe", for: .normal)
        button.layer.cornerRadius = UIConstants.subscriptionButtonCornerRadius
        return button
    }()
    
}


//MARK: - Private Methods
private extension NewSubscriptionCell {
    private func initalise() {
        selectionStyle = .none
        
        //adding Subscription Button Func
        subscriptiptionButton.addTarget(self, action: #selector(subscriptionTapped), for: .touchUpInside)
        
        //Adding Subviews
        
        contentView.addSubview(userImage)
        contentView.addSubview(subscriptionLabel)
        contentView.addSubview(subscriptiptionButton)
        
        //translatesAutoresizingMaskIntoConstraints
        userImage.translatesAutoresizingMaskIntoConstraints = false
        subscriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        subscriptiptionButton.translatesAutoresizingMaskIntoConstraints = false
        
        //NSLayoutConstraints
        NSLayoutConstraint.activate([
            userImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UIConstants.contentInsert),
            userImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: UIConstants.contentInsert),
            userImage.widthAnchor.constraint(equalToConstant: UIConstants.userImageSize),
            userImage.heightAnchor.constraint(equalToConstant: UIConstants.userImageSize),
            userImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -UIConstants.contentTopInsert),
            
            subscriptionLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: UIConstants.subscriptionLabelFromImage),
            subscriptionLabel.topAnchor.constraint(equalTo: userImage.topAnchor),
            subscriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -UIConstants.contentInsert),
            subscriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
            subscriptionLabel.heightAnchor.constraint(equalTo: userImage.heightAnchor, multiplier: 1),
            
            subscriptiptionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UIConstants.subscriptionButtonInsert),
            subscriptiptionButton.centerYAnchor.constraint(equalTo: userImage.centerYAnchor),
            subscriptiptionButton.widthAnchor.constraint(equalToConstant: UIConstants.subscriptionButtonWidth)
        ])
        
    }
        //MARK: - Private Mathods
    private func updateSubscriptionButton(isSubscribed: Bool) {
        if isSubscribed {
            subscriptiptionButton.backgroundColor = .systemGray4
            subscriptiptionButton.setTitle("Unsubscribe", for: .normal)
            subscriptiptionButton.setTitleColor(UIColor.black, for: .normal)
        } else {
            subscriptiptionButton.backgroundColor = .systemBlue
            subscriptiptionButton.setTitle("Subscribe", for: .normal)
            subscriptiptionButton.setTitleColor(UIColor.white, for: .normal)
        }
    }
    
    //MARK: - Configure Subscription Txt
    func configureSubscriptionLabel(with login: UILabel) {

        let usernameUnwraped = login.text ?? "No Username"
        let string = usernameUnwraped + " Subscribed"
        let attributedString = NSMutableAttributedString(string: string)
        let range = NSRange(location: .zero, length: usernameUnwraped.count)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: UIConstants.subscriptionLabelFontSize), range: range)
        subscriptionLabel.attributedText = attributedString
        subscriptionLabel.numberOfLines = 0
    }
    
    //MARK: - Subscription Button func
    @objc func subscriptionTapped() {
        let isCurrentlySubscribed = UserDefaults.standard.bool(forKey: username.text ?? "")
        let newSubscriptionState = !isCurrentlySubscribed
        UserDefaults.standard.set(newSubscriptionState, forKey: username.text ?? "")
        
        updateSubscriptionButton(isSubscribed: newSubscriptionState)
    }

    
}
