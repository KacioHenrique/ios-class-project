//
//  PostCell.swift
//  RogaLabsProject
//
//  Created by Kacio Batista on 29/04/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    static let identifier = "PostCell"
    lazy var title:UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.gray
        label.text = "title"
        return label
    }()
    lazy var body:UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "body"
        return label
    }()
    lazy var line:UIView = {
        let line = UIView(frame: .zero)
        line.backgroundColor = .black
        return line
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUIData(data:Post) {
        self.title.text = data.title
        self.body.text = data.body
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    func setupUI() {
        self.addSubview(title)
        self.addSubview(body)
        self.addSubview(line)
        
        title.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().inset(5)
        }
        body.snp.makeConstraints { (make) in
            make.top.equalTo(title.snp.bottom)
            make.left.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(5)
        }
        line.snp.makeConstraints { (make) in
            make.top.equalTo(body.snp.bottom).offset(2)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
        body.text = nil
    }

}
