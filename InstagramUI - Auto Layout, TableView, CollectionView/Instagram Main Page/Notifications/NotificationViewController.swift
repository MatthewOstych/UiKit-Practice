import UIKit

class NotificationViewController: UIViewController {

    
    //MARK: - Private Properties
    private let tableView = UITableView()
    private let refresh = UIRefreshControl()
    
    private var items: [NotificationTypeEnum] = [
        .like(NotificationItemCellInfo(userImage: UIImage(named: "tree")!, username: "user", photo: UIImage(named: "tree")!)),
        .like(NotificationItemCellInfo(userImage: UIImage(named: "tree")!, username: "user", photo: UIImage(named: "tree")!)),
        .newSubscription(NotificationSubscriptionCellInfo(userImage: UIImage(named: "tree")!, username: "test")),
        .like(NotificationItemCellInfo(userImage: UIImage(named: "tree")!, username: "user", photo: UIImage(named: "tree")!)),
        .like(NotificationItemCellInfo(userImage: UIImage(named: "tree")!, username: "user", photo: UIImage(named: "tree")!)),
        .newSubscription(NotificationSubscriptionCellInfo(userImage: UIImage(named: "tree")!, username: "test2"))
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "rectangle.inset.filled.badge.record"), tag: 0)
        
        initalise()
    }


}

//MARK: - Init
private extension NotificationViewController {
    func initalise() {
        self.view.backgroundColor = .white
        
        
        tableView.estimatedRowHeight = 500
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .clear
        tableView.register(NotificationCell.self, forCellReuseIdentifier: String(describing: NotificationCell.self))
        tableView.register(NewSubscriptionCell.self, forCellReuseIdentifier: String(describing: NewSubscriptionCell.self))
        view.addSubview(tableView)
        
        self.refresh.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        tableView.addSubview(refresh)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    @objc func handleRefresh() {
        let newitem : NotificationTypeEnum = .like(NotificationItemCellInfo(userImage: UIImage(named: "tree")!, username: "Refreshed", photo: UIImage(named: "tree")!))
        items.insert(newitem, at: 0)
        
        tableView.reloadData()
        
        refresh.endRefreshing()
    }
    
}

//MARK: - TableViewDelegare

extension NotificationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items[indexPath.row]
        switch item {
        case .like(let like):
            
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NotificationCell.self), for: indexPath) as! NotificationCell
            cell.configure(with: like)
            return cell
            
        case .newSubscription(let newSubscription):
            
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NewSubscriptionCell.self), for: indexPath) as! NewSubscriptionCell
            cell.configure(with: newSubscription)
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
    

