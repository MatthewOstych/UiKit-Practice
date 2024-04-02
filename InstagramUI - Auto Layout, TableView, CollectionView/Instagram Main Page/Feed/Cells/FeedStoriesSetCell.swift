//
//  FeedStoriesSetCell.swift
//  Instagram Main Page
//
//  Created by Mathew Lantsov on 17.03.2024.
//

import UIKit

class FeedStoriesSetCell: UITableViewCell {
    //MARK: - Public
    func configure(with info: FeedStoriesCellinfo) {
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
    
    //MARK: - Private Properties
    private var collectionView: UICollectionView!
    private var items: FeedStoriesCellinfo = []
    

}

//MARK: - Private constant
private enum UIConstantsStories {
    static let collectionViewHeight: CGFloat = 106
    static let cellWidth: CGFloat = 72
    static let cellHeight: CGFloat = 98
}

//MARK: - Pribate methonds
private extension FeedStoriesSetCell {
    func initalise() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(StoriesItemCell.self, forCellWithReuseIdentifier: String(describing: StoriesItemCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(collectionView)
            //MARK: - sotires anchors
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: UIConstantsStories.collectionViewHeight).isActive = true

    }
}

//MARK: - UICollectionViewDataSource
extension FeedStoriesSetCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: StoriesItemCell.self), for: indexPath) as! StoriesItemCell
        cell.configure(with: items[indexPath.item])
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension FeedStoriesSetCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstantsStories.cellWidth, height: UIConstantsStories.cellHeight)
    }
}
