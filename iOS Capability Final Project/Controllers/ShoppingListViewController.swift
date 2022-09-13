//
//  ShoppingListViewController.swift
//  iOS Capability Final Project
//
//  Created by Jeofferson Dela Peña on 9/11/22.
//

import UIKit

class ShoppingListViewController: UIViewController {
    
    private var shoppingItems: [ShoppingItem] = []
    
    private let refreshControl = UIRefreshControl()

    @IBOutlet var tvShoppingItems: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpRefreshControl()
        setUpTableView()
        loadContent(isFirstTime: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case Constants.segueIDGoToShoppingItemDetailScreen:
            if let index = tvShoppingItems.indexPathForSelectedRow?.row {
                (segue.destination as! ShoppingItemDetailViewController).shoppingItem = shoppingItems[index]
            }
            
        default:
            super.prepare(for: segue, sender: sender)
        }
    }
    
    private func setUpRefreshControl() {
        refreshControl.addTarget(self, action: #selector(self.refreshTableView(_:)), for: .valueChanged)
        tvShoppingItems.addSubview(refreshControl)
    }
    
    @objc private func refreshTableView(_ sender: AnyObject) {
        loadContent()
    }
    
    private func setUpTableView() {
        tvShoppingItems.delegate = self
        tvShoppingItems.dataSource = self
    }
    
    private func loadContent(isFirstTime: Bool = false) {
        if isFirstTime {
            refreshControl.beginRefreshing()
        }
        ShoppingItemAPI.getShoppingItems { [weak self] shoppingItems, error in
            guard let self = self else {
                return
            }
            
            guard let shoppingItems = shoppingItems, error == nil else {
                return
            }
            
            self.shoppingItems = shoppingItems
            self.tvShoppingItems.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
}

extension ShoppingListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shoppingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvShoppingItems.dequeueReusableCell(withIdentifier: Constants.cellIDShoppingItem) as! ShoppingItemCell
        cell.bind(shoppingItems[indexPath.row], atIndex: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.segueIDGoToShoppingItemDetailScreen, sender: self)
    }
}
