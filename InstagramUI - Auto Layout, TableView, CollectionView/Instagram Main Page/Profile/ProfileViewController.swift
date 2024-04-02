//
//  ProfileViewController.swift
//  Instagram Main Page
//
//  Created by Mathew Lantsov on 28.03.2024.
//

import UIKit

class ProfileViewController: UIViewController {

    //MARK: - Vilew Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "person.circle"), tag: 0)
        initalise()
    }
    
    //MARK: - Private Properties
    private let tableView = UITableView()
    private var items : [profilePart] = [
        .header,
        .stories,
        .body
    ]
    
    private var userInfo: ProfileInfo = .init(username: "test",
                                              profileImage: "tree", subscribers: 100, subscribed: 80, name: "Elon Musk", job: .blogger, description: "This is a description")
    private var userPosts: [UserPost] = [
        .init(image: "tree"),
        .init(image: "tree"),
        .init(image: "tree"),
        .init(image: "tree"),
        .init(image: "tree"),
        .init(image: "tree"),
    ]
    
    private var userStories: [UserProfileStoriesCellInfo] = [
        .init(image: "tree"),
        .init(image: "tree"),
        .init(image: "tree"),
        .init(image: "tree"),
        .init(image: "tree"),
        .init(image: "tree"),
        .init(image: "tree"),
        .init(image: "tree")
    ]

}

//MARK: - Private methods

private extension ProfileViewController {
    func initalise() {
        view.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(ProfileHeaderTableViewCell.self, forCellReuseIdentifier: "ProfileHeaderTableViewCell")
        tableView.register(ProfileStoryesTableViewCell.self, forCellReuseIdentifier: "ProfileStoryesTableViewCell")
        tableView.register(ProfileBodyTableViewCell.self, forCellReuseIdentifier: "ProfileBodyTableViewCell")
    
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .header:
            let postsCount = userPosts.count
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileHeaderTableViewCell.self), for: indexPath) as! ProfileHeaderTableViewCell
            cell.configure(with: userInfo, postsInfo: postsCount)
            return cell
        case .body:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileBodyTableViewCell.self), for: indexPath) as! ProfileBodyTableViewCell
            cell.configure(with: userPosts)
            return cell
        case .stories:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileStoryesTableViewCell.self), for: indexPath) as! ProfileStoryesTableViewCell
            cell.configure(with: userStories)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = items[indexPath.row]
        switch item {
        case .header:
            return UITableView.automaticDimension
        case .stories:
            return UITableView.automaticDimension
        case .body:
            // Check the heigh of row
            let insets = CGFloat(1)
            let size = (view.bounds.width - (3 * insets)) / 3
            var height: CGFloat = size
            
            //Change height for tableView
            var count = 0
            for _ in 1...userPosts.count {
                count += 1
                if count == 3 {
                    height += size
                    count = 0
                }
            }
            return height
        }
        
    }
    
}
