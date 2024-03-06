//
//  PresentationViewController.swift
//  UIImage
//
//  Created by Mathew Lantsov on 04.03.2024.
//

import UIKit

class PresentationViewController: UIPageViewController {
    
    private lazy var pagesVC = getViewControllers()
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation)
        self.setViewControllers([pagesVC[0]], direction: .forward, animated: true)
        self.dataSource = self
        self.view.backgroundColor = .white
        setupPageControl()
    }
    
    
    private func setupPageControl() {
        let proxy = UIPageControl.appearance()
        proxy.pageIndicatorTintColor = .darkGray
        proxy.currentPageIndicatorTintColor = UIColor.black
    }
    
    private func getViewControllers() -> [PresentCreatorViewController] {
        var viewControllers = [PresentCreatorViewController]()
        
        viewControllers.append(PresentCreatorViewController(text: "Welcome to out Shop", image: UIImage(named: "welcome")!))
        viewControllers.append(PresentCreatorViewController(text: "You can buy Apple Products with us" , image: UIImage(named: "mac")!))
        viewControllers.append(PresentCreatorViewController(text: "Delivery Everywhere" , image: UIImage(named: "delivery")!))
        
        return viewControllers
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension PresentationViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? PresentCreatorViewController, let index = pagesVC.firstIndex(of: vc), index > 0 else {
            return nil
        }
        
        
        let before = index - 1
        return pagesVC[before]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? PresentCreatorViewController, let index = pagesVC.firstIndex(of: vc), index < pagesVC.count - 1 else {
            return nil
        }
        let after = index + 1
        return pagesVC[after]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        3
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
}
