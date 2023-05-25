//
//  HomeViewController.swift
//  Food-Receipe-App
//
//  Created by Kajol   on 23/05/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var homeTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self

        self.navigationController?.title = "Food Receipe"
        let receipeCell = UINib(nibName: "homwTableViewCell", bundle: nil)
        self.homeTableView.register(receipeCell, forCellReuseIdentifier: "homwTableViewCell")
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Notifications", style: .plain, target: self, action: #selector(notificationsTapped))
    }
    
    @objc func notificationsTapped() {
            // Handle the add button tap event
        }

    @objc func searchTapped() {
            // Handle the add button tap event
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}


