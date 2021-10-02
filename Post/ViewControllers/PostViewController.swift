//
//  PostViewController.swift
//  Post
//
//  Created by Игорь Чумиков on 02.10.2021.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var postPodyLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    
    var postPody: String!
    var postTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postPodyLabel.text = postPody
        postTitleLabel.text = postTitle
    }
    

}
