//
//  ViewController.swift
//  Post
//
//  Created by Игорь Чумиков on 29.09.2021.
//

import UIKit

class PostsTableViewController: UITableViewController {
    
    //MARK: Private properties
    let url = "https://jsonplaceholder.typicode.com/posts"
    var dataSours = [Post]()
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData(from: url)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSours.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let post = dataSours[indexPath.row]
        
        cell.textLabel?.font = UIFont(name: "System", size: 20.0)
        cell.textLabel?.text = post.title
        cell.textLabel?.numberOfLines = 0
        
        cell.detailTextLabel?.font = UIFont(name: "System", size: 20.0)
        cell.detailTextLabel?.text = post.body
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let post = dataSours[indexPath.row]
        guard let postVC = segue.destination as? PostViewController else { return }
        postVC.postPody = post.title
        postVC.postTitle = post.body
        
    }
    
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { posts in
            self.dataSours = posts
            self.tableView.reloadData()
        }
    }
}

