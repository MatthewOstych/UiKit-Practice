import UIKit

class ProfileBodyTableViewCell: UITableViewCell {

    // MARK: - Private Properties
    private var collectionView: UICollectionView?
    private var userPosts: [UserPost] = []
    private let someView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialise()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Func
    func configure(with userPosts: [UserPost]) {
        self.userPosts = userPosts
        layoutSubviews()
        collectionView?.reloadData()
    }
    
    // MARK: - Setup
    private func initialise() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        collectionView?.register(PhotoCollectionViewCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCollectionViewCell.identifier)
        
    
        collectionView?.translatesAutoresizingMaskIntoConstraints = false

        
        contentView.addSubview(collectionView!)
        collectionView?.isScrollEnabled = false
        
        NSLayoutConstraint.activate([
            collectionView!.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

        ])
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Adjust the layout here
        let insets = CGFloat(1)
        let size = (bounds.width - (3 * insets)) / 3
        
        (collectionView?.collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize = CGSize(width: size, height: size)
        (collectionView?.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumLineSpacing = insets
        (collectionView?.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing = insets
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension ProfileBodyTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userPosts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: userPosts[indexPath.row])
        return cell
    }
}
