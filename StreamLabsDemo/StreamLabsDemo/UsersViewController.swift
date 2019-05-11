//
//  UsersViewController.swift
//  StreamLabsDemo
//
//  Created by gagan on 11/5/19.
//  Copyright © 2019 Gaganpreet Singh. All rights reserved.
//

import Foundation
import UIKit

class UsersViewController: UIViewController {
    
    @IBOutlet weak var userCollectionView: UICollectionView!
    var userData: [String] = []
    
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
        
        userData = ["Feed","$1k Contest","Ninja","pokimane",
                       "DrLupo", "KingRidge"]
        
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

