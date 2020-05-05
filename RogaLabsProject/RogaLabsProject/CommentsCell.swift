//
//  CommentsCellTableViewCell.swift
//  RogaLabsProject
//
//  Created by Kacio Batista on 05/05/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import UIKit

class CommentsCell: UITableViewCell {
    static let identifier = "CommentsCell"
    lazy var perfilImage:UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "midia-social"))
        return imageView
    }()
    lazy var name:UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.gray
        label.text = "name"
        return label
    }()
    lazy var email:UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.gray
        label.text = "email"
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
    fileprivate func setupUI() {
        self.addSubview(name)
        self.addSubview(email)
        self.addSubview(body)
        self.addSubview(line)
        self.addSubview(perfilImage)
        
        perfilImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(10)
            make.width.height.equalTo(50)
        }
        name.snp.makeConstraints { (make) in
            make.left.equalTo(perfilImage.snp.right).offset(10)
            make.top.equalTo(perfilImage.snp.top).offset(5)
            make.right.equalToSuperview()
        }
        email.snp.makeConstraints { (make) in
            make.left.equalTo(name.snp.left)
            make.top.equalTo(name.snp.bottom).offset(5)
            make.right.equalToSuperview()
        }
        body.snp.makeConstraints { (make) in
            make.top.equalTo(perfilImage.snp.bottom).offset(15)
            make.left.equalTo(30)
            make.right.bottom.equalToSuperview().inset(2)
        }
        line.snp.makeConstraints { (make) in
            make.top.equalTo(body.snp.bottom).offset(2)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    func setupUIData(data:Comment) {
        self.name.text = data.name
        self.email.text = data.email
        self.body.text = data.body
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        name.text = nil
        body.text = nil
        email.text = nil
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: CommentsCell.identifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
