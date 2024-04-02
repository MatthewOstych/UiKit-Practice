import UIKit

class FeedPostCell: UITableViewCell {
    //MARK: - Public
    func configure(with info: FeedPostItemInfo) {
        userImageView.image = info.userImage
        usernameLabel.text = info.username
        subtitleLabel.text = info.postSubtitle
        postImageView.image = info.postImage
        likeLabel.text = "\(info.numberOfLikes) Likes"
        if let comment = info.comment {
            configureCommentLabel(with: comment)
        }
    }
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private constants
    private enum UIConstants {
        static let userImageSize: CGFloat = 30
        static let contentInset: CGFloat = 10
        static let userImageTopInset: CGFloat = 6
        static let usernameLabelFontSize: CGFloat = 14
        static let subtitleFontSize: CGFloat = 10
        static let usernameStackToProfileImageOffset: CGFloat = 12
        static let postImageToUserImageOffset: CGFloat = 6
        static let actionsStackHeight: CGFloat = 24
        static let actionsStackToPostImageOffset: CGFloat = 12
        static let actionsStackSpacing: CGFloat = 12
        static let actionsStackToLikesLabelOffset: CGFloat = 12
        static let likesLabelFontSize: CGFloat = 14
        static let commentLabelFontSize: CGFloat = 14
        static let commentToLikesOffset: CGFloat = 2
    }
    

    //MARK: - Private properties
    private let userImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.userImageSize / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.usernameLabelFontSize, weight: .bold)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.usernameLabelFontSize)
        return label
    }()
    
    private let optionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let postImageView: UIImageView = {
        let view = UIImageView()

        return view
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()   
    
    private let commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "bubble.right"), for: .normal)
        return button
    }()   
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        return button
    }()
    
    private let likeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.likesLabelFontSize, weight: .bold)
        return label
    }()
    
    private var commentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.commentLabelFontSize)

        return label
    }()
    
}



    //MARK: - Private methods
    private extension FeedPostCell {
        private func initialize() {
            selectionStyle = .none
            contentView.addSubview(userImageView)
            userImageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UIConstants.contentInset),
                userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: UIConstants.userImageTopInset),
                userImageView.widthAnchor.constraint(equalToConstant: UIConstants.userImageSize),
                userImageView.heightAnchor.constraint(equalToConstant: UIConstants.userImageSize)
            ])
            
            let usernameStack = UIStackView()
            usernameStack.axis = .vertical
            usernameStack.addArrangedSubview(usernameLabel)
            usernameStack.addArrangedSubview(subtitleLabel)
            contentView.addSubview(usernameStack)
            usernameStack.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                usernameStack.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: UIConstants.usernameStackToProfileImageOffset),
                usernameStack.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
                usernameStack.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -UIConstants.contentInset)
            ])
            
            contentView.addSubview(optionsButton)
            optionsButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                optionsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                optionsButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12)
            ])
            
            
            contentView.addSubview(postImageView)
            postImageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                postImageView.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: UIConstants.postImageToUserImageOffset),
                postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1)
            ])
            
            let actionsStack = UIStackView()
            actionsStack.axis = .horizontal
            actionsStack.addArrangedSubview(likeButton)
            actionsStack.addArrangedSubview(commentButton)
            actionsStack.addArrangedSubview(shareButton)
            contentView.addSubview(actionsStack)
            actionsStack.spacing = UIConstants.actionsStackSpacing
            
            actionsStack.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                actionsStack.heightAnchor.constraint(equalToConstant: UIConstants.actionsStackHeight),
                actionsStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UIConstants.contentInset),
                actionsStack.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: UIConstants.actionsStackToPostImageOffset),
                actionsStack.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -UIConstants.contentInset)
            ])
            
            contentView.addSubview(likeLabel)
            likeLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                likeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UIConstants.contentInset),
                likeLabel.topAnchor.constraint(equalTo: actionsStack.bottomAnchor, constant: UIConstants.actionsStackToLikesLabelOffset)
                
            ])
            contentView.addSubview(commentLabel)
            commentLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                commentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UIConstants.contentInset),
                commentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: UIConstants.contentInset),
                commentLabel.topAnchor.constraint(equalTo: likeLabel.bottomAnchor, constant: UIConstants.commentToLikesOffset),
                commentLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -UIConstants.userImageTopInset)
            ])
        }
        
        func configureCommentLabel(with comment: CommentShortInfo) {
            let string = comment.username + " " + comment.commenttext
            let attributedString = NSMutableAttributedString(string: string)
            let range = NSRange(location: .zero, length: comment.username.count)
            attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: UIConstants.commentLabelFontSize), range: range)
            commentLabel.attributedText = attributedString
            commentLabel.numberOfLines = 0
        
        }
        

}
    


