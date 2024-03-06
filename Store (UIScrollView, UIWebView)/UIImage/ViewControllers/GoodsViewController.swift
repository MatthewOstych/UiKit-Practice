//
//  GoodsViewController.swift
//  UIImage
//
//  Created by Mathew Lantsov on 25.02.2024.
//

import UIKit

final class GoodsViewController: UIViewController {
    
    private var goodsImageArray = [String]()
    
    //MARK: - Vars, Lets
    private var goodImageView = UIImageView()
    private var likeImageName = "likeButton"
    private var (likeButton, addToCardButton) = (UIButton(), UIButton())
    private var goodText = UILabel()
    private var imageScrollView = UIScrollView()
    private var mainNavigationBar = UINavigationBar()
    
    //MARK: - AppRun
    override func viewDidLoad() {
        super.viewDidLoad()

        // Check what photos to use
        switch addGoods.tag {
        case 0:
            goodsImageArray = addGoods.macPhotosArray
        case 1:
            goodsImageArray = addGoods.watchPhotosArray
        default: ()
        }
        
        addGoodName()
        addGoodImages()
        addNavigationBar()
        addToCartButton()
    }
    
    
    //MARK: - Adding Funcs
    
    private func addToCartButton() {
        addToCardButton.setTitle("Add To Cart", for: .normal)
        addToCardButton.backgroundColor = .systemBlue
        addToCardButton.layer.cornerRadius = 14
        addToCardButton.addTarget(self, action: #selector(netViewLoad), for: .touchUpInside)
        addToCardButton.frame = CGRect(
            x: 5,
            y: self.view.center.y + 220,
            width: self.view.bounds.width - 10,
            height: 50)
    
        self.view.addSubview(addToCardButton)
    }
    
    private func addNavigationBar() {
        var sharebutton = UIBarButtonItem()
        sharebutton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareFunc))
        likeButton = UIButton(type: .system)
        
        let smallerlikeButton = UIImage(named: likeImageName)?.resized(to: CGSize(width: 24, height: 25))
        let likeButtonItem = UIBarButtonItem(image: smallerlikeButton, style: .plain, target: self, action: #selector(likePressed))
        
        // Use rightBarButtonItems to set multiple bar button items
        self.navigationItem.rightBarButtonItems = [likeButtonItem, sharebutton]
    }

    private func addGoodName() {
        goodText.text = addGoods.name
        goodText.textColor = .white
        goodText.numberOfLines = 0
        goodText.font = UIFont.systemFont(ofSize: 24)
        goodText.frame = CGRect(
            x: 0,
            y: self.view.center.y + 90,
            width: self.view.bounds.width, height: 90)
        goodText.textAlignment = .center
        self.view.addSubview(goodText)
    }
    
    private func addGoodImages() {
        let scrolViewRect = view.bounds
        let howMuchImages : Int = goodsImageArray.count
        
        //adding ScrollView
    
        imageScrollView.isPagingEnabled = true
        imageScrollView.tintColor = .white
        imageScrollView.frame = CGRect(
            x: 0,
            y: 100,
            width: self.view.bounds.width,
            height: 400)
        imageScrollView.contentSize = CGSize(width: Int(scrolViewRect.size.width) *  howMuchImages, height: 400)
        
        
        // Custom indicator style
        let lineView = UIView(frame: CGRect(
            x: 0,
            y: imageScrollView.bounds.height - 6,
            width: imageScrollView.contentSize.width,
            height: 3))
        
        lineView.backgroundColor = .white
        lineView.layer.cornerRadius = lineView.frame.height / 2
        imageScrollView.addSubview(lineView)
        
        //Adding Photos
        
        //adding first photo
        var imageViewRect = self.view.bounds
        imageViewRect.origin.y -= 230
        let addingImage = newImageViewWithImage(paramImage: goodsImageArray[0], paramFrame: imageViewRect)
        imageScrollView.addSubview(addingImage)
        
        // adding other photos
        for i in 1..<goodsImageArray.count {
            imageViewRect.origin.x += imageViewRect.size.width
            let addNewImage = newImageViewWithImage(paramImage: goodsImageArray[i], paramFrame: imageViewRect)
            self.imageScrollView.addSubview(addNewImage)
            
        }
        
        self.view.addSubview(imageScrollView)
    }
    

    //MARK: - Add Photo size Func
    private func newImageViewWithImage(paramImage: String, paramFrame: CGRect) -> UIImageView {
        let result = UIImageView(frame: paramFrame)
        result.contentMode = .scaleAspectFit
        result.image = UIImage(named: paramImage)
        return result
        
    }
    
    //MARK: - Func of Sharing
    @objc private func shareFunc() {

        guard let textToShare = goodText.text else {
            print("error")
            return
            }
            
            let activityViewController = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
            // This line is for iPad to show the activity controller popover properly
            activityViewController.popoverPresentationController?.sourceView = self.view
            present(activityViewController, animated: true, completion: nil)
    }

    @objc private func likePressed() {
        switch likeImageName {
        case "likeButton":
            likeImageName = "pressedLikeButton"
            addNavigationBar()
        case "pressedLikeButton":
            likeImageName = "likeButton"
            addNavigationBar()
        default:
            ()
        }
    }
    
    
    @objc private func netViewLoad() {
        let nextVC = NetViewController()
        self.present(nextVC, animated: true)
    }

}

//MARK: - Extensions

extension UIImage {
    func resized(to newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: newSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
