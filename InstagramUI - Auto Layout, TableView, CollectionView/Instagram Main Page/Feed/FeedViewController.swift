//
//  FeedViewController.swift
//  Instagram
//
//

import UIKit

class FeedViewController: UIViewController {
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "note"), tag: 0)
        initialize()
    }

    // MARK: - Private properties
    private let tableView = UITableView()
    private var items: [FeedItemType] = [
        .stories([
            FeedStoriesItemCellinfo(image: UIImage(named: "tree")!, username: "user1213", isAddButtonVisible: true, isNewStories: false),
            FeedStoriesItemCellinfo(image: UIImage(named: "tree")!, username: "user123", isAddButtonVisible: false, isNewStories: true),
            FeedStoriesItemCellinfo(image: UIImage(named: "tree")!, username: "user123", isAddButtonVisible: false, isNewStories: true),
            FeedStoriesItemCellinfo(image: UIImage(named: "tree")!, username: "user123", isAddButtonVisible: false, isNewStories: true),
            FeedStoriesItemCellinfo(image: UIImage(named: "tree")!, username: "user123", isAddButtonVisible: false, isNewStories: true),
            FeedStoriesItemCellinfo(image: UIImage(named: "tree")!, username: "user123", isAddButtonVisible: false, isNewStories: true)
            
        ]),
    
        .post(FeedPostItemInfo(userImage: UIImage(named: "tree")!, username: "user", postSubtitle: "sponsired", postImage: UIImage(named: "tree")!, numberOfLikes: 100, comment: CommentShortInfo(username: "User", commenttext: "Comment Text"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "tree")!, username: "user", postSubtitle: "sponsired", postImage: UIImage(named: "tree")!, numberOfLikes: 100, comment: CommentShortInfo(username: "User", commenttext: "Comment Text"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "tree")!, username: "user", postSubtitle: "sponsired", postImage: UIImage(named: "tree")!, numberOfLikes: 100, comment: CommentShortInfo(username: "User", commenttext: "Comment Text"))),
    ]
 
}

// MARK: - Private methods
private extension FeedViewController {
    func initialize() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
        navigationItem.rightBarButtonItems = makeRightBarButtonItems()
        
        tableView.estimatedRowHeight = 560
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .clear
        tableView.register(FeedStoriesSetCell.self, forCellReuseIdentifier: String(describing: FeedStoriesSetCell.self))
        tableView.register(FeedPostCell.self, forCellReuseIdentifier: String(describing: FeedPostCell.self))
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        let logoBarButtonItem = UIBarButtonItem(customView: LogoView())
        let dropDownButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.down"), target: self, action: nil, menu: makeDropDownMenu())
        return [logoBarButtonItem, dropDownButtonItem]
    }

    func makeRightBarButtonItems() -> [UIBarButtonItem] {
        let addBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(didTapPlusButton))
        let directBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "paperplane"), style: .plain, target: self, action: #selector(didTapDirectButton))
        return [directBarButtonItem, addBarButtonItem]
    }

    @objc func didTapPlusButton() {
        print("Add")
    }

    @objc func didTapDirectButton() {
        print("Direct")
    }

    func makeDropDownMenu() -> UIMenu {
        let subsItem = UIAction(title: "Подписки", image: UIImage(systemName: "person.2")) { _ in
            print("Subs")
        }
        let favsItem = UIAction(title: "Избранное", image: UIImage(systemName: "star")) { _ in
            print("Favorites")
        }
        return UIMenu(title: "", children: [subsItem, favsItem])
    }
}

// MARK: - UITableViewDataSource
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .stories(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedStoriesSetCell.self), for: indexPath) as! FeedStoriesSetCell
            cell.configure(with: info)
            return cell
        case .post(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedPostCell.self), for: indexPath) as! FeedPostCell
            cell.configure(with: post)
            return cell
        }
    }
}

    //MARK: - UITableViewDelegate
extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = items[indexPath.row]
        switch item {
        case .stories(_):
            return 100
        case .post(_):
            return UITableView.automaticDimension
        }
    }

    
    
}


