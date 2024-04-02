import UIKit

final class ProfilePhotoViewController: UIViewController {
    
    //MARK: - Private Properties
    private var collectionView: UICollectionView?
    private let layout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalise()
    }
    
    private var userPosts: [UserPost] = []
    

    
    private func initalise() {
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        let size = (view.frame.size.width - 4)/3
        layout.itemSize = CGSize(width: size, height: size)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        //CEll
        collectionView?.register(PhotoCollectionViewCollectionViewCell.self,
                                 forCellWithReuseIdentifier: PhotoCollectionViewCollectionViewCell.identifier)

      
        guard let collectionView = collectionView else {
            return
        }
        
        view.addSubview(collectionView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
}

extension ProfilePhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

            return userPosts.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCollectionViewCell.identifier,
                                                      for: indexPath) as! PhotoCollectionViewCollectionViewCell
        let userPost = userPosts[indexPath.row]
        cell.configure(with: userPost)
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    

    
}

