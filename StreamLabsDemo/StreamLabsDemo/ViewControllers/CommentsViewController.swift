//
//  CommentsViewController.swift
//  StreamLabsDemo
//
//  Created by gagan on 11/5/19.
//  Copyright © 2019 Gaganpreet Singh. All rights reserved.
//

import Foundation
import UIKit

class CommentsViewController: UIViewController, CAAnimationDelegate {
    
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var bottomUserDetailView: UIView!
    @IBOutlet weak var topVideoView: UIView!
    @IBOutlet weak var homeTableView: UITableView!
    
    var commentsData: [UserComments] = []
    
    var aniOneLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 20)
        return label
    }()
    
    var aniTwoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        return label
    }()
    
    // MARK:- AppLifecyle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupHomeUI()
        setupAnimation()
    }
    
    func setupAnimation() {
        self.view.addSubview(aniOneLabel)
        self.view.addSubview(aniTwoLabel)
        animateOne(value: "+1")
        animateOther(value: "+2")
        let rippleLayer = RippleLayer()
        rippleLayer.position = CGPoint(x: (UIScreen.main.bounds.width - self.starImageView.frame.size.width)+10, y: self.starImageView.frame.origin.y + 20);
        self.bottomUserDetailView.layer.addSublayer(rippleLayer)
        rippleLayer.startAnimation()
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

// MARK: - Animation
extension CommentsViewController {
    
    func getRandomColor() -> UIColor {
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    func animateOne(value : String) {
        aniOneLabel.isHidden = false
        aniOneLabel.text = value
        self.aniOneLabel.frame = CGRect(x: self.pointsLabel.frame.origin.x-20, y: UIScreen.main.bounds.height-250, width: 50, height: 50)

        UIView.animate(withDuration: 0.7, animations: {
            self.aniOneLabel.textColor = self.getRandomColor()
            self.aniOneLabel.frame = CGRect(x: self.pointsLabel.frame.origin.x-20, y: UIScreen.main.bounds.height-500, width: 50, height: 50)
        }) { (success) in
            if success {
                self.aniOneLabel.isHidden = true
                let randomInt = Int.random(in: 0..<60)
                let str = "+" + String(randomInt)
                self.animateOne(value: str)
            }
        }
    }
    
    func animateOther(value : String) {
        self.aniTwoLabel.text = value
        self.aniTwoLabel.isHidden = false
        self.aniTwoLabel.frame = CGRect(x: self.pointsLabel.frame.origin.x+10, y: UIScreen.main.bounds.height-250, width: 50, height: 50)
        
        UIView.animate(withDuration: 1.0, animations: {
            self.aniTwoLabel.textColor = self.getRandomColor()
            self.aniTwoLabel.frame = CGRect(x: self.pointsLabel.frame.origin.x+10, y: UIScreen.main.bounds.height-500, width: 50, height: 50)
        }) { (success) in
            self.aniTwoLabel.isHidden = true
            let randomInt = Int.random(in: 0..<20)
            let str = "+" + String(randomInt)
            self.animateOther(value: str)
        }
    } //end
}
