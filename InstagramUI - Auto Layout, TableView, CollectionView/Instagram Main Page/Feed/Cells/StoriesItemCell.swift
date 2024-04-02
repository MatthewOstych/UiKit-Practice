
import UIKit

class StoriesItemCell: UICollectionViewCell {
    //MARK: - Public
    func configure(with info: FeedStoriesItemCellinfo) {
        imageView.image = info.image
        usernameLabel.text = info.username
        plusButton.isHidden = !info.isAddButtonVisible
        circleImage.isHidden = !info.isNewStories
    }
    
    //MARK: - iinit
    override init(frame: CGRect) {
        super.init(frame: frame)
        initalize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Constans
    private enum UIConstants {
        static let imageSizr: CGFloat = 60
        static let imageToCellinsert: CGFloat = 6
        static let labeltoCellInsert: CGFloat = 6
        static let imageToLabelOffset: CGFloat = 6
        static let usernamelabelFontSize: CGFloat = 12
        static let plusButtonSize: CGFloat = 20
        static let circleSize: CGFloat = 72
    }
    //MARK: - private propertie
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.imageSizr / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.usernamelabelFontSize)
        label.textAlignment = .center
        return label
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "addButton"), for: .normal)
        return button
    }()
    
    private let circleImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "sotriesRound")
        return view
    }()
}


//MARK: - Private methods
private extension StoriesItemCell {
    func initalize() {
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: UIConstants.imageSizr),
            imageView.heightAnchor.constraint(equalToConstant: UIConstants.imageSizr),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UIConstants.imageToCellinsert),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: UIConstants.imageToCellinsert),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UIConstants.imageToCellinsert)
        ])
        contentView.addSubview(usernameLabel)
        NSLayoutConstraint.activate([
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UIConstants.labeltoCellInsert),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UIConstants.labeltoCellInsert),
                    usernameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: UIConstants.imageToLabelOffset),
            usernameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -UIConstants.labeltoCellInsert)
                ])
        
        contentView.addSubview(plusButton)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plusButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            plusButton.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: UIConstants.plusButtonSize),
            plusButton.heightAnchor.constraint(equalToConstant: UIConstants.plusButtonSize)
        ])
        
        contentView.addSubview(circleImage)
        circleImage.translatesAutoresizingMaskIntoConstraints = false
        circleImage.center = imageView.center
        NSLayoutConstraint.activate([
            circleImage.heightAnchor.constraint(equalToConstant: UIConstants.circleSize),
            circleImage.widthAnchor.constraint(equalToConstant: UIConstants.circleSize)
        ])
        
    }
}


