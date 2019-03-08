//
//  DetailHeaderChildViewController.swift
//
//  Created by Arifin Firdaus on 2/24/19.
//  Copyright © 2019 Arifin Firdaus. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class DetailHeaderChildViewController: UIViewController {
    
    fileprivate let headerImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .blue
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeaderImageView()
    }
    
    fileprivate func setupHeaderImageView() {
        view.addSubview(headerImageView)
        headerImageView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        let url = URL(string: "https://images.unsplash.com/photo-1516085616067-d2027825a309?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1868&q=80")
        headerImageView.sd_setImage(with: url, completed: nil)
    }

}
