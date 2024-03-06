//
//  ViewController.swift
//  UIDynamicAnimator
//
//  Created by Mathew Lantsov on 06.03.2024.
//

import UIKit

class ViewController: UIViewController {

    var animator = UIDynamicAnimator()
    var snapBehavior: UISnapBehavior?
    var collision = UICollisionBehavior()
    var currentNumberOfViews = 6
    var arrayOfViewTags : [Int] = []
    
    var moveCirqle = UIView()
    var newGameSquare = UILabel()
    var nextSquare = UILabel()
    var settingsSquare = UILabel()
    var aboutSquare = UILabel()
    
    
    override func viewDidLoad() {
        createViews()
        super.viewDidLoad()
        collision.collisionDelegate = self
        arrayOfViewTags.append(contentsOf: [1, 2, 3, 4, 5])
    }

    override func viewDidAppear(_ animated: Bool) {
        view.addSubview(moveCirqle)
        view.addSubview(newGameSquare)
        view.addSubview(nextSquare)
        view.addSubview(settingsSquare)
        view.addSubview(aboutSquare)
        
        moveCirqle.center = view.center
        createGestureRecogniser()
        createanimatorAndBehavior()
        addCollision(array: [moveCirqle, newGameSquare, nextSquare, settingsSquare, aboutSquare])
    }

    
    func createViews() {
        moveCirqle = UIView(frame: CGRect(x: 0,
                                          y: 0,
                                          width: 30,
                                          height: 30))
        moveCirqle.backgroundColor = .blue
        moveCirqle.alpha = 0.5
        moveCirqle.layer.cornerRadius = 30
        moveCirqle.layer.masksToBounds = true
        moveCirqle.clipsToBounds = true
        moveCirqle.tag = 1
        
        newGameSquare = UILabel(frame: CGRect(x: 215,
                                              y: 201,
                                              width: 100,
                                              height: 100))
        newGameSquare.backgroundColor = .brown
        newGameSquare.layer.cornerRadius = 30
        newGameSquare.layer.maskedCorners = .layerMaxXMaxYCorner
        newGameSquare.text = "New Game"
        newGameSquare.textAlignment = .center
        newGameSquare.numberOfLines = 0
        newGameSquare.clipsToBounds = true
        newGameSquare.tag = 2
        
        nextSquare = UILabel(frame: CGRect(x: 216,
                                           y: 100,
                                           width: 100,
                                           height: 100))
        nextSquare.backgroundColor = .systemTeal
        nextSquare.layer.cornerRadius = 30
        nextSquare.layer.maskedCorners = .layerMaxXMaxYCorner
        nextSquare.text = "Next Game"
        nextSquare.textAlignment = .center
        nextSquare.numberOfLines = 0
        nextSquare.clipsToBounds = true
        nextSquare.tag = 3
        
        settingsSquare = UILabel(frame: CGRect(x: 114,
                                               y: 201,
                                               width: 100,
                                               height: 100))
        settingsSquare.backgroundColor = .green
        settingsSquare.layer.cornerRadius = 30
        settingsSquare.layer.maskedCorners = .layerMaxXMaxYCorner
        settingsSquare.text = "Settings"
        settingsSquare.textAlignment = .center
        settingsSquare.numberOfLines = 0
        settingsSquare.clipsToBounds = true
        settingsSquare.tag = 4
        
        aboutSquare = UILabel(frame: CGRect(
            x: 114,
            y: 100,
            width: 100,
            height: 100))
        aboutSquare.backgroundColor = .cyan
        aboutSquare.layer.cornerRadius = 30
        aboutSquare.layer.maskedCorners = .layerMinXMinYCorner
        aboutSquare.text = "About"
        aboutSquare.textAlignment = .center
        aboutSquare.numberOfLines = 0
        aboutSquare.clipsToBounds = true
        aboutSquare.tag = 5
        }
    
    func createGestureRecogniser() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(paramTap:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    func createanimatorAndBehavior() {
        animator = UIDynamicAnimator(referenceView: view)
        collision = UICollisionBehavior(items: [moveCirqle])
        animator.addBehavior(collision)
        snapBehavior = UISnapBehavior(item: moveCirqle, snapTo: moveCirqle.center)
        snapBehavior?.damping = 0.5
        animator.addBehavior(snapBehavior!)
        
    }
    
    @objc func handleTap(paramTap: UITapGestureRecognizer) {
        
        let tapPoint = paramTap.location(in: view)
        
        if snapBehavior != nil {
            animator.removeBehavior(snapBehavior!)
        }
        snapBehavior = UISnapBehavior(item: moveCirqle, snapTo: tapPoint)
        snapBehavior?.damping = 0.5
        animator.addBehavior(snapBehavior!)
    }
    
    func addCollision(array: [UIDynamicItem]) {
        collision = UICollisionBehavior(items: array)
        collision.translatesReferenceBoundsIntoBoundary = true
        collision.addBoundary(withIdentifier: "bottomBoundary" as NSCopying,
                              from: CGPoint(x: 0, y: 850),
                              to: CGPoint(x: view.bounds.size.width, y: 850))
        animator.addBehavior(collision)
        collision.collisionDelegate = self
    }
    
    func createLabelAfterCollision(text: String) {
        
        let newLabel = UILabel(frame: CGRect(x: view.center.x,
                                             y: 400,
                                             width: 200,
                                             height: 50))
        newLabel.backgroundColor = .systemYellow
        newLabel.alpha = 0.3
        newLabel.text = text
        newLabel.textAlignment = .center
        newLabel.layer.cornerRadius = 25
        newLabel.layer.masksToBounds = true
        let rndInt = Int.random(in: 100..<314)
        newLabel.center.x = CGFloat(rndInt)
        
        addCollision(array: [newLabel])
        let gravity = UIGravityBehavior(items: [newLabel])
        animator.addBehavior(gravity)
        view.addSubview(newLabel)
        arrayOfViewTags.append(currentNumberOfViews)
        newLabel.tag = currentNumberOfViews
        currentNumberOfViews += 1
    }
    
    func restartGameButton() {
        let restartButton = UIButton(frame: CGRect(x: 0, y: 0,
                                                   width: 300, height: 100))
        restartButton.backgroundColor = .systemYellow
        restartButton.setTitle("Restart Game", for: .normal)
        restartButton.layer.cornerRadius = 30
        restartButton.layer.masksToBounds = true
        restartButton.tintColor = .green
        restartButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        restartButton.center = view.center
        restartButton.addTarget(self, action: #selector(restartView(restart:)), for: .touchUpInside)
    }
    
    @objc func restartView(restart: UIButton) {
        createViews()
        animateView(restart)
        collision.collisionDelegate = self
        arrayOfViewTags.append(contentsOf: [1, 2, 3, 4, 5, 6])
        view.addSubview(moveCirqle)
        view.addSubview(newGameSquare)
        view.addSubview(nextSquare)
        view.addSubview(settingsSquare)
        view.addSubview(aboutSquare)
        moveCirqle.center = view.center
        createGestureRecogniser()
        createanimatorAndBehavior()
        addCollision(array: [moveCirqle, newGameSquare, nextSquare, settingsSquare, aboutSquare])
        restart.removeFromSuperview()
    }
    
    fileprivate func animateView(_ viewToAnimate: UIView) {
        UIView.animate(withDuration: 0.05, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { (_) in
            
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
            
        }
        
        }
    }

extension ViewController: UICollisionBehaviorDelegate {
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        
        let item2Label = item2 as? UILabel
        createLabelAfterCollision(text: (item2Label?.text)!)
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        let identifierOne = identifier as? String
        let kBottomBoundary = "bottomBoundary"
        
        if identifierOne == kBottomBoundary {
            UIView.animate(withDuration: 1) {
                let view = item as? UIView
                view?.backgroundColor = .red
                view?.alpha = 0
                view?.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
                self.collision.removeItem(item)
            } completion: { (finished) in
                let view = item as? UIView
                behavior.removeItem(item)
                view?.removeFromSuperview()
            }
        }
        
        if view.subviews.count == 1 {
            restartGameButton()
        }
    }
}


