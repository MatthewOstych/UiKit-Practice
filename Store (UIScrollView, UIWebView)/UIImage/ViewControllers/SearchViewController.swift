//
//  ViewController.swift
//  UIImage
//
//  Created by Mathew Lantsov on 25.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: - Var, let

    var searchField = UITextField()
    
    
    private let firstGoodImage = UIImage(named: "mac")
    private let secondGoodImage = UIImage(named: "watch")

    private var goodImageView = UIImageView()
    private var secondGoodImageView = UIImageView()
    private var thirdGoodImageView = UIImageView()
    
    private var goodfieldPlaskOne = UIImageView()
    private var goodfieldPlaskTwo = UIImageView()
    private var goodfieldPlaskThree = UIImageView()
    
    private let goodsFieldPlaskImage = UIImage(named: "plask")

    private var goodsScrollView = UIScrollView()
    
    private let goodfieldFirstText = UILabel()
    private let goodfieldSecondText = UILabel()
    private let goodfieldThirdText = UILabel()
    private var serchTextLabel = UILabel()
    private var wasViewedTExtLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Search"
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search"), tag: 0)
        self.tabBarItem = tabBarItem

        addSearchTextFunc()
        addSearchField()
        addGoodsFields()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if addGoods.presentationWasVIewed == false {
            let viewControl = PresentationViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
            self.present(viewControl, animated: true)
            
        
            
        }
    }
    //MARK: - Add Funcs

    
    func addGoodsFields() {
        
        goodsScrollView.frame = CGRect(x: 0, y: 240, width: self.view.bounds.width - 20, height: 190)
        goodsScrollView.contentSize = CGSize(width: 500, height: 190)
        self.view.addSubview(goodsScrollView)
        
        goodfieldFirstText.text = "MacBook m1 14"
        goodfieldFirstText.textColor = .white
        goodfieldFirstText.font = UIFont.systemFont(ofSize: 16)
        goodfieldFirstText.textAlignment = .center
        goodfieldFirstText.adjustsFontForContentSizeCategory = true
        goodfieldFirstText.frame = CGRect(x: 15, y: 100, width: 120, height: 80)

        
        goodfieldSecondText.text = "Watch"
        goodfieldSecondText.textColor = .white
        goodfieldSecondText.font = UIFont.systemFont(ofSize: 16)
        goodfieldSecondText.textAlignment = .center
        goodfieldSecondText.adjustsFontForContentSizeCategory = true
        goodfieldSecondText.frame = CGRect(x: 170, y: 100, width: 120, height: 80)
        
        goodfieldThirdText.text = "Watch 42mm"
        goodfieldThirdText.textColor = .white
        goodfieldThirdText.font = UIFont.systemFont(ofSize: 16)
        goodfieldThirdText.textAlignment = .center
        goodfieldThirdText.adjustsFontForContentSizeCategory = true
        goodfieldThirdText.frame = CGRect(x: 340, y: 100, width: 120, height: 80)
        
        goodImageView = UIImageView(image: firstGoodImage)
        secondGoodImageView = UIImageView(image: secondGoodImage)
        thirdGoodImageView = UIImageView(image: secondGoodImage)
        
        goodImageView.frame = CGRect(x: 15, y: 20, width: 120, height: 80)
        secondGoodImageView.frame = CGRect(x: 170, y: 20, width: 120, height: 80)
        thirdGoodImageView.frame = CGRect(x: 330, y: 20, width: 120, height: 80)
        
        goodImageView.contentMode = .scaleAspectFit
        secondGoodImageView.contentMode = .scaleAspectFill
        thirdGoodImageView.contentMode = .scaleAspectFill
        
        goodImageView.isUserInteractionEnabled = true
        secondGoodImageView.isUserInteractionEnabled = true
        thirdGoodImageView.isUserInteractionEnabled = true
        
        let tapGestureSecond = UITapGestureRecognizer(target: self, action: #selector(goodImageViewTapped))
        let tapGestureFirst = UITapGestureRecognizer(target: self, action: #selector(goodImageViewTapped))
        let tapGestureThird = UITapGestureRecognizer(target: self, action: #selector(goodImageViewTapped))
        
        goodImageView.addGestureRecognizer(tapGestureFirst)
        secondGoodImageView.addGestureRecognizer(tapGestureSecond)
        thirdGoodImageView.addGestureRecognizer(tapGestureThird)
        
        goodImageView.tag = 0
        secondGoodImageView.tag = 1
        thirdGoodImageView.tag = 2
        
        goodfieldPlaskOne = UIImageView(image: goodsFieldPlaskImage)
        goodfieldPlaskTwo = UIImageView(image: goodsFieldPlaskImage)
        goodfieldPlaskThree = UIImageView(image: goodsFieldPlaskImage)
        
        goodfieldPlaskOne.frame = CGRect(x: 0, y: 0, width: 150, height: 190)
        goodfieldPlaskTwo.frame = CGRect(x: 160, y: 0, width: 150, height: 190)
        goodfieldPlaskThree.frame = CGRect(x: 320, y: 0, width: 150, height: 190)
        
        
        goodsScrollView.addSubview(goodfieldPlaskOne)
        goodsScrollView.addSubview(goodfieldPlaskTwo)
        goodsScrollView.addSubview(goodfieldPlaskThree)
        
        goodsScrollView.addSubview(goodImageView)
        goodsScrollView.addSubview(secondGoodImageView)
        goodsScrollView.addSubview(thirdGoodImageView)
        
        goodsScrollView.addSubview(goodfieldFirstText)
        goodsScrollView.addSubview(goodfieldSecondText)
        goodsScrollView.addSubview(goodfieldThirdText)
        
    }

    func addSearchTextFunc() {
        serchTextLabel.text = "Search"
        serchTextLabel.textColor = .white
        serchTextLabel.font = UIFont.boldSystemFont(ofSize: 30)
        serchTextLabel.frame = CGRect(x: 30, y: 50, width: 100, height: 100)
        
        wasViewedTExtLabel.text = "Recently Viewed"
        wasViewedTExtLabel.textColor = .white
        wasViewedTExtLabel.font = UIFont.boldSystemFont(ofSize: 23)
        wasViewedTExtLabel.frame = CGRect(x: 30, y: 170, width: 400, height: 100)
        
        self.view.addSubview(serchTextLabel)
        self.view.addSubview(wasViewedTExtLabel)
    }

    
    func addSearchField() {
        searchField.borderStyle = .roundedRect
        searchField.backgroundColor = .darkGray
        searchField.textColor = .white
        searchField.frame = CGRect(
            x: 10,
            y: 140,
            width: self.view.bounds.width - 50,
            height: 30)
        searchField.center.x = self.view.center.x
        
        let placeholderText = "Search by Products"
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.lightGray, // Change this to whatever color you prefer
            .font: UIFont.systemFont(ofSize: 17) // You can adjust the font size as well if needed
        ]
        searchField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        
        self.view.addSubview(searchField)
    }
    
    //MARK: - Other funcs
    
    @objc func goodImageViewTapped(sender: UITapGestureRecognizer) {
        var tag = 0
        
        if let imageView = sender.view as? UIImageView {
            tag = imageView.tag
        }
        
        switch tag {
        case 0:
            addGoods.tag = 0
            addGoods.name = goodfieldFirstText.text ?? "error"
        case 1:
            addGoods.tag = 1
            addGoods.name = goodfieldSecondText.text ?? "error"
        case 2:
            addGoods.tag = 1
            addGoods.name = goodfieldSecondText.text ?? "error"
            
        default: ()
        }

        let nextVC = GoodsViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

