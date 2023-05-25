//
//  FavouriteViewController.swift
//  Food-Receipe-App
//
//  Created by Kajol   on 23/05/23.
//

import UIKit

class FavouriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var favoriteTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.favoriteTableView.delegate = self
        self.favoriteTableView.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
        
        self.title = "Favorites"
        
    }
    
    @objc func searchTapped() {
            // Handle the add button tap event
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
