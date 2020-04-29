//
//  ViewController.swift
//  RogaLabsProject
//
//  Created by Kacio Batista on 29/04/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    fileprivate func setupUI(){
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .green
        self.view = view
    }
}

