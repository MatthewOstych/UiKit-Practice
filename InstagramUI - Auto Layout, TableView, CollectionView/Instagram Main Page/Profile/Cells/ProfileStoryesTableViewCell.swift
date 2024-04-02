//
//  ProfileStoryesTableViewCell.swift
//  Instagram Main Page
//
//  Created by Mathew Lantsov on 28.03.2024.
//

import UIKit

class ProfileStoryesTableViewCell: UITableViewCell {
    //MARK: - Public
    func configure(with info: [UserProfileStoriesCellInfo]) {
        self.items = info
        collectionView.reloadData()
    }
    
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initalise()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private properties
    private var collectionView: UICollectionView!
    private var items: [UserProfileStoriesCellInfo] = []

}

//MARK: - Private constant
 private enum UIConstantsStories {
     static let collectionViewHeight: CGFloat = 115
     static let cellWidth: CGFloat = 70
     static let cellHeight: CGFloat = 70
}

//MARK: - Private methods
private extension ProfileStoryesTableViewCell {
    func initalise() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProfileStoryesItemCell.self, forCellWithReuseIdentifier: String(describing: ProfileStoryesItemCell.self))
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(collectionView)
        
        
        //Anchors
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: UIConstantsStories.collectionViewHeight).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
}

//MARK: - UICollectionViewDataSource
extension ProfileStoryesTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProfileStoryesItemCell.self), for: indexPath) as! ProfileStoryesItemCell
        cell.configure(with: items[indexPath.item])
        return cell
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            CGSize(width: UIConstantsStories.cellWidth, height: UIConstantsStories.cellHeight)
        }
}



