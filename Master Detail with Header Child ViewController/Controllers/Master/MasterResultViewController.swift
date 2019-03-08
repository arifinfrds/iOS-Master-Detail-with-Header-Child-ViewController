//
//  MasterResultViewController.swift
//
//  Created by Arifin Firdaus on 2/25/19.
//  Copyright © 2019 Arifin Firdaus. All rights reserved.
//

import UIKit
import SnapKit

class MasterResultViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        return tableView
    }()
    
    fileprivate let cellId = "MasterResultViewControllerCellId"
    
    var items = [String]()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    init(withItems items: [String]) {
        super.init(nibName: nil, bundle: nil)
        self.items = items
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    fileprivate func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    fileprivate func setupCell() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
}

// MARK: - UITableViewDataSource

extension MasterResultViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension MasterResultViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension MasterResultViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let text = searchController.searchBar.text
        print(text)
    }
    
}
