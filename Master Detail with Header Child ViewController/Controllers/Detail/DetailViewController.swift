//
//  ViewController.swift
//
//  Created by Arifin Firdaus on 2/24/19.
//  Copyright © 2019 Arifin Firdaus. All rights reserved.
//

import UIKit
import SnapKit

class DetailViewController: BaseViewController {
    
    fileprivate let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: UITableView.Style.plain)
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    fileprivate var headerContainerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .yellow
        return view
    }()
    
    fileprivate let cellId = "UITableViewCell"
    
    fileprivate var item: String?
    
    init(withItem item: String) {
        super.init(nibName: nil, bundle: nil)
        self.item = item
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCell()
        setupTableView()
        setupNavBar()
        navigationController?.transparentNavBar(tintColor: .white)
        title = item
    }
   
    fileprivate func setupCell() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    fileprivate func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        tableView.dataSource = self
        tableView.delegate = self
        addHeaderViewToTableView()
        tableView.contentInset = UIEdgeInsets(top: -getTopInsetHeight(), left: 0, bottom: 0, right: 0)
    }
    
    fileprivate func addHeaderViewToTableView() {
        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        headerContainerView = UIView(frame: frame)
        tableView.tableHeaderView = headerContainerView
        let viewController = DetailHeaderChildViewController()
        add(asChildViewController: viewController, to: headerContainerView)
    }
    
    fileprivate func setupNavBar() {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
        navigationItem.rightBarButtonItem = barButtonItem
        
        title = "Rotbak22, Lowokwaru"
        
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.tintColor = UIColor.white
        navigationBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

// MARK: - UITableViewDataSource

extension DetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = "Cell \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
}

// MARK: - UITableViewDelegate

extension DetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        if offset.y >= 112.0 {
            setTableViewContentInsetToDefault()
            navigationController?.unTransparentNavBar(tintColor: .blue, barTintColor: .white)
            setupNavigationBarAppereanceWhenHeaderViewIsCollapsing()
        } else {
            setTableViewContentInsetToCustom()
            navigationController?.transparentNavBar(tintColor: .white)
            setupNavigationBarAppereanceWhenHeaderViewIsNotCollapsing()
        }
    }
    
    fileprivate func getNavigationBarBackgroundColor(withOffset offset: CGPoint) -> UIColor {
        let alpha = (offset.y / 100)
        let color = UIColor(red: 1, green: 1, blue: 1, alpha: alpha)
        return color
    }
    
    fileprivate func getNavigationItemTintColor(withOffset offset: CGPoint) -> UIColor {
        let alpha = (offset.y / 100)
        let color = UIColor(red: 0, green: 0, blue: 0, alpha: alpha)
        return color
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        setTableViewContentInsetToDefault()
        let offset = scrollView.contentOffset
        if offset.y >= 112.0 {
            navigationController?.unTransparentNavBar(tintColor: .blue, barTintColor: .white)
            setupNavigationBarAppereanceWhenHeaderViewIsCollapsing()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setTableViewContentInsetToDefault()
        let offset = scrollView.contentOffset
        if offset.y >= 112.0 {
            navigationController?.unTransparentNavBar(tintColor: .blue, barTintColor: .white)
            setupNavigationBarAppereanceWhenHeaderViewIsCollapsing()
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        setTableViewContentInsetToDefault()
        let offset = scrollView.contentOffset
        if offset.y >= 112.0 {
            navigationController?.unTransparentNavBar(tintColor: .blue, barTintColor: .white)
            setupNavigationBarAppereanceWhenHeaderViewIsCollapsing()
        }
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        setTableViewContentInsetToDefault()
        let offset = scrollView.contentOffset
        if offset.y >= 112.0 {
            navigationController?.unTransparentNavBar(tintColor: .blue, barTintColor: .white)
            setupNavigationBarAppereanceWhenHeaderViewIsCollapsing()
        }
    }
    
    fileprivate func setTableViewContentInsetToDefault() {
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    fileprivate func setTableViewContentInsetToCustom() {
        tableView.contentInset = UIEdgeInsets(top: -getTopInsetHeight(), left: 0, bottom: 0, right: 0)
    }
    
    fileprivate func setupNavigationBarAppereanceWhenHeaderViewIsCollapsing() {
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.tintColor = .blue
        navigationBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
    
    fileprivate func setupNavigationBarAppereanceWhenHeaderViewIsNotCollapsing() {
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.tintColor = .white
        navigationBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
}

