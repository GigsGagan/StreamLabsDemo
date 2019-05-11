//
//  UserCollectionCell.swift
//  StreamLabsDemo
//
//  Created by gagan on 11/5/19.
//  Copyright © 2019 Gaganpreet Singh. All rights reserved.
//

import Foundation
import UIKit

class UserCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var notificationNoLabel: UILabel!
    @IBOutlet weak var notificationImageView: UIImageView!
    @IBOutlet weak var userBorderImageView: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    struct Constants {
        static let CellReuseID = "kUserID"
        static let NibName     = "UserCollectionCell"
    }
    
    class var nibName : String {  return Constants.NibName }
    class var cellReuseID : String {  return Constants.CellReuseID }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        userLabel.text = nil
        userImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        notificationImageView.layer.cornerRadius = notificationImageView.frame.height / 2.0
        notificationImageView.layer.masksToBounds = true
        
        userImageView.layer.cornerRadius = userImageView.frame.height / 2.0
        userImageView.layer.masksToBounds = true
        userImageView.layer.borderWidth = 3
        userImageView.layer.borderColor = UIColor.black.cgColor
        
        userBorderImageView.layer.cornerRadius =  userBorderImageView.frame.height / 2.0
        userBorderImageView.layer.masksToBounds = true
    }
    
    func setupCell(_ value : String)  {
        userLabel.text = value
        let imgName:UIImage = UIImage(named: value)!
        userImageView.image = imgName
    }
}
