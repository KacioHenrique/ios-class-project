//
//  ViewController.swift
//  RogaLabsProject
//
//  Created by Kacio Batista on 29/04/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    override func loadView() {
        super.loadView()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    fileprivate func setupUI(){
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.bottom.left.right.top.equalToSuperview()
        }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        return cell
    }
    
    
}
