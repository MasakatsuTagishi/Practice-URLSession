//
//  ViewController.swift
//  Practice-URLSession
//
//  Created by 田岸将勝 on 2022/05/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var nameLabel: UILabel!
    
    let fetchUserData = FetchUserData()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        fetchUserData.getUserDataFromGithubAPI { user in
            DispatchQueue.main.async {
                self.nameLabel.text = user.name
            }
        }
    }

}

