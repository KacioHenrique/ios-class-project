//
//  MainPostViewController.swift
//  RogaLabsProject
//
//  Created by Kacio Batista on 29/04/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import UIKit
import SnapKit
class MainPostViewController: UIViewController {
    let tableView = UITableView(frame: .zero)
    lazy var tableViewModel = ModelViewTableView(viewControler: self, callback: {
        DispatchQueue.main.async {
              self.tableView.reloadData()
          }
    })
   lazy var blurEffect:UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = UIScreen.main.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.7
        return blurEffectView
    }()
    lazy var navigationViewModel = NavigationViewModel(title: "Postagens Recentes")
    override func loadView() {
        super.loadView()
        self.tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.identifier)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        makeNavigation()
    }
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    private func setupUI() {
        self.view.addSubview(tableView)
        let navigationBar = navigationViewModel.makeNavigationBarView()
        self.view.addSubview(navigationBar)
         navigationBar.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(47)
         }
         tableView.snp.makeConstraints { (make) in
             make.top.equalTo(navigationBar.snp.bottom)
             make.bottom.left.right.equalToSuperview()
         }
    }
    private func makeNavigation() {
        self.navigationController?.navigationBar.barStyle = navigationViewModel.barStyle
        self.navigationController?.navigationBar.isTranslucent = navigationViewModel.isTranslucent
        self.navigationController?.navigationBar.titleTextAttributes = navigationViewModel.titleTextAttributes
        self.navigationController?.navigationBar.tintColor = navigationViewModel.tinteColor
        self.title = navigationViewModel.getTitle()
    }
    
}
extension MainPostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.tableViewNumbersOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.identifier, for: indexPath) as? PostCell, let data = tableViewModel.tableViewPostIndex(index: indexPath.row) else {return UITableViewCell(frame: .zero)}
        cell.setupUIData(data: data)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.modalPresentationStyle = .formSheet
        guard let post = self.tableViewModel.tableViewPostIndex(index: indexPath.row) else {return }
        guard let popView = CommentsViewController(post: post ,delegate: self).view else {return}
        self.view.addSubview(popView)
        popView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(70)
            make.right.bottom.equalToSuperview().inset(10)
        }
        
    }
}
extension MainPostViewController:PopStatus {
    func open() {
        self.view.addSubview(blurEffect)
        self.tableView.isUserInteractionEnabled = false
    }
    func close() {
        blurEffect.removeFromSuperview()
         self.tableView.isUserInteractionEnabled = true
    }
}
