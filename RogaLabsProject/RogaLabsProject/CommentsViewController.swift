//
//  CommentsViewController.swift
//  RogaLabsProject
//
//  Created by Kacio Batista on 01/05/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import UIKit
protocol PopStatus {
    func open()
    func close()
}
class CommentsViewController: UIViewController {
    let tableView = UITableView(frame: .zero)
    let post:Post
    let delegate:PopStatus?
    lazy var tableViewModel = ModelViewTableViewComments(viewControler: self, id: self.post.id) {
         DispatchQueue.main.async {
            self.tableView.reloadData()
         }
    }
    
    lazy var navigationViewModel = NavigationViewModel(title: "O que a galera comentou sobre\n \(self.post.title)")


    private func setupUI() {
        self.view.addSubview(tableView)
        let navigationBar = navigationViewModel.makeNavigationBarViewCloseButton()
        self.view.addSubview(navigationBar)
        navigationBar.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
        }
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(navigationBar.snp.bottom)
            make.bottom.left.right.equalToSuperview()
        }
    }
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
    }

    init(post:Post , delegate:PopStatus) {
        self.post = post
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        delegate.open()
        navigationViewModel.done = {
            self.view.removeFromSuperview()
            self.delegate?.close()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        self.tableView.register(CommentsCell.self, forCellReuseIdentifier: CommentsCell.identifier)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension CommentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentsCell.identifier, for: indexPath) as? CommentsCell else {
            return UITableViewCell(frame: .zero)
        }
        guard let comment = tableViewModel.tableViewCommentIndex(index: indexPath.row) else {return UITableViewCell(frame: .zero)}
        cell.setupUIData(data: comment)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}
