//
//  ProfileStoryesItemCell.swift
//  Instagram Main Page
//
//  Created by Mathew Lantsov on 01.04.2024.
//

import UIKit

class ProfileStoryesItemCell: UICollectionViewCell {
    //MARK: - Public
    func configure(with info: UserProfileStoriesCellInfo) {
        imageView.image = UIImage(named: info.image)
    }

    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initalise()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Private Constants
    private enum UIConstants {
        static let imageSize: CGFloat = 70
        static let imageToCellinsert: CGFloat = 5
    }
    
    //MARK: - Private Properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.imageSize / 2
        view.clipsToBounds = true
        return view
    }()
    
}

//MARK: - Private Methods
private extension ProfileStoryesItemCell {
    func initalise() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: UIConstants.imageSize),
            imageView.heightAnchor.constraint(equalToConstant: UIConstants.imageSize),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: UIConstants.imageToCellinsert),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
