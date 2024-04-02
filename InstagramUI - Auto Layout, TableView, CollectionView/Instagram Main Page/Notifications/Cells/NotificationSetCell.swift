import UIKit

class NotificationCell: UITableViewCell {

//MARK: - Public
    func configure(with info: NotificationItemCellInfo) {
        userImage.image = info.userImage
        username.text = info.username
        likedImage.image = info.photo
        configureLikedLabel(with: username)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        initalize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Private constants
    private enum UIConstants {
        static let contentIstert: CGFloat = 10
        static let contentLikedImgIstert: CGFloat = 20
        static let userImageTopInsert: CGFloat = 15
        static let userImageSize: CGFloat = 50
        static let likedImageSize: CGFloat = 50
        static let commentLabelFontSize: CGFloat = 14
        static let commentLabelFromImage: CGFloat = 15
    }
    
    //MARK: - Private properties
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
    
    private let likedImage: UIImageView = {
        let view = UIImageView()

        return view
    }()
    
    private let notificationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.commentLabelFontSize)
        return label
    }()
    
    
    
}

//MARK: - Private Methods
private extension NotificationCell {
    private func initalize() {
        selectionStyle = .none
        

        
        //Adding Subviews
        contentView.addSubview(userImage)
        contentView.addSubview(notificationLabel)
        contentView.addSubview(likedImage)

        //translatesAutoresizingMaskIntoConstraints
        userImage.translatesAutoresizingMaskIntoConstraints = false
        notificationLabel.translatesAutoresizingMaskIntoConstraints = false
        likedImage.translatesAutoresizingMaskIntoConstraints = false
        
        //NSLayoutConstraints
        NSLayoutConstraint.activate([
            userImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UIConstants.contentIstert),
            userImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: UIConstants.userImageTopInsert),
            userImage.widthAnchor.constraint(equalToConstant: UIConstants.userImageSize),
            userImage.heightAnchor.constraint(equalToConstant: UIConstants.userImageSize),
            userImage.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -UIConstants.userImageTopInsert),

            notificationLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: UIConstants.commentLabelFromImage),
            notificationLabel.topAnchor.constraint(equalTo: userImage.topAnchor),
            notificationLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -UIConstants.contentIstert),
            notificationLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
            notificationLabel.heightAnchor.constraint(equalTo: userImage.heightAnchor, multiplier: 1),
            
            likedImage.widthAnchor.constraint(equalToConstant: UIConstants.likedImageSize),
            likedImage.heightAnchor.constraint(equalToConstant: UIConstants.likedImageSize),
            likedImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UIConstants.contentLikedImgIstert),
            likedImage.centerYAnchor.constraint(equalTo: userImage.centerYAnchor)
        ])
    }
    
    func configureLikedLabel(with login: UILabel) {
        let usernameUnwraped = login.text ?? "No Username"
        let string = (usernameUnwraped) + " Liked your photo"
        let attributedString = NSMutableAttributedString(string: string)
        let range = NSRange(location: .zero, length: usernameUnwraped.count)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: UIConstants.commentLabelFontSize), range: range)
        notificationLabel.attributedText = attributedString
        notificationLabel.numberOfLines = 0
    }
}
