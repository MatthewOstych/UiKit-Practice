//
//  PhotoCollectionViewCollectionViewCell.swift
//  Instagram Main Page
//
//  Created by Mathew Lantsov on 26.03.2024.
//

import UIKit

class PhotoCollectionViewCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCollectionViewCell"
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
        override func layoutSubviews() {
            super.layoutSubviews()
            photoImageView.frame = contentView.bounds
        }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(photoImageView)
        contentView.clipsToBounds = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: UserPost) {
        // Load image from the model
        photoImageView.image = UIImage(named: model.image)
    }

    
    public func configure(debug imageName: String) {
        photoImageView.image = UIImage(named: imageName)
    }
    
    
}
