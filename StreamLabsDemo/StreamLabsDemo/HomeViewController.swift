//
//  ViewController.swift
//  StreamLabsDemo
//
//  Created by gagan on 11/5/19.
//  Copyright © 2019 Gaganpreet Singh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTabbar: UITabBar!
    @IBOutlet weak var carouselContainer: UIView!
    
    // MARK:- AppLifecyle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupHomeUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    // MARK: - Private Methods
    func setupHomeUI() {
        guard let childVC = self.storyboard?.instantiateViewController(withIdentifier: "UsersViewController") as? UsersViewController else {
            return
        }
        addChild(childVC)
        childVC.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        childVC.view.frame = carouselContainer.bounds
        carouselContainer.addSubview(childVC.view)
        childVC.didMove(toParent: self)
    }
    
    
}

