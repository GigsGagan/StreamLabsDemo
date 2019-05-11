//
//  UsersViewController.swift
//  StreamLabsDemo
//
//  Created by gagan on 11/5/19.
//  Copyright © 2019 Gaganpreet Singh. All rights reserved.
//

import Foundation
import UIKit

struct User {
    var name: String
    var notification: Int
    var type: Int
}

class UsersViewController: UIViewController {
    
    @IBOutlet weak var userCollectionView: UICollectionView!
    var userData: [User] = []
    
    // MARK:- AppLifecyle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        dataAllocation()
        setupHomeUI()
        
    }
    
    func dataAllocation() {
        let userData1 = User(name: "Feed", notification: 0, type: 2)
        let userData2 = User(name: "$1k Contest", notification: 0, type: 1)
        let userData3 = User(name: "Ninja", notification: 3, type: 0)
        let userData4 = User(name: "pokimane", notification: 7, type: 0)
        let userData5 = User(name: "DrLupo", notification: 0, type: 0)
        let userData6 = User(name: "KingRidge", notification: 0, type: 0)
        userData = [userData1,userData2,userData3,userData4,userData5,userData6]
    }
    
    // MARK: - Private Methods
    func setupHomeUI() {
        let channelCollectionCellNib = UINib(nibName: UserCollectionCell.nibName, bundle: nil)
        userCollectionView.register(channelCollectionCellNib, forCellWithReuseIdentifier: UserCollectionCell.cellReuseID)
        userCollectionView.reloadData()
        
    }
    
}

// MARK:- Collection View
extension UsersViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionCell.cellReuseID, for: indexPath) as! UserCollectionCell
        cell.setupCell(userData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
}

