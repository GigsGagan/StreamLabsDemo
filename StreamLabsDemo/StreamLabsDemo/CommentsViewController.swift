//
//  CommentsViewController.swift
//  StreamLabsDemo
//
//  Created by gagan on 11/5/19.
//  Copyright © 2019 Gaganpreet Singh. All rights reserved.
//

import Foundation
import UIKit

class CommentsViewController: UIViewController {
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var bottomUserDetailView: UIView!
    @IBOutlet weak var topVideoView: UIView!
    @IBOutlet weak var homeTableView: UITableView!
    
    var commentsData: [UserComments] = []
    
    // MARK:- AppLifecyle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupHomeUI()
    }
    
    // MARK: - Private Methods
    func setupHomeUI() {
        let instance = Profile()
        commentsData = instance.getComments()
        
        homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        homeTableView.reloadData()
        
        shadowView.layer.shadowColor = UIColor.darkGray.cgColor
        shadowView.layer.shadowOpacity = 1
        shadowView.layer.shadowRadius = 20.0
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 5)
        shadowView.layer.shadowPath = UIBezierPath(rect: shadowView.bounds).cgPath
        shadowView.layer.shouldRasterize = true
    }
    
}

// MARK: - UITableViewDataSource
extension CommentsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.commentsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! HomeTableViewCell
        cell.setup(commentsData[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
}
