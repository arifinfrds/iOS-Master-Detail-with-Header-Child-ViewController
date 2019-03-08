//
//  BaseViewController.swift
//
//  Created by Arifin Firdaus on 2/25/19.
//  Copyright © 2019 Arifin Firdaus. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    internal func add(asChildViewController viewController: UIViewController, to containerView: UIView) {
        addChild(viewController)
        containerView.addSubview(viewController.view)
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }
    
    internal func getTopInsetHeight() -> CGFloat {
        guard let navBarHeight = getNavBarHeight() else { return 0 }
        return getStatusBarHeight() + navBarHeight
    }
    
    private func getStatusBarHeight() -> CGFloat {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        return Swift.min(statusBarSize.width, statusBarSize.height)
    }
    
    private func getNavBarHeight() -> CGFloat? {
        return navigationController?.navigationBar.frame.size.height
    }
    
    
}
