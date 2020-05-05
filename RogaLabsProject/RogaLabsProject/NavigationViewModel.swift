//
//  MainViewModel.swift
//  RogaLabsProject
//
//  Created by Kacio Batista on 30/04/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
import UIKit
final class NavigationViewModel {
    private var title:String
    var barStyle: UIBarStyle = .black
    var isTranslucent = false
    var titleTextAttributes: [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 22),]
    var tinteColor = UIColor.white
    var done:(() -> Void)?
    init(title:String) {
        self.title = title
    }
    func getTitle() -> String {
        return self.title
    }
    private func setTitle(text:String) -> UILabel {
      return {
            let label = UILabel(frame: .zero)
            label.font = UIFont.boldSystemFont(ofSize: 17)
            label.textColor = UIColor.white
            label.numberOfLines = 2
            label.text = text
            label.textAlignment = .center
            return label
        }()
    }
    func makeNavigationBarViewCloseButton() -> UIView {
        let navBarview:UIView = {
            let view = UIView(frame: .zero)
            view.backgroundColor = . black
            view.tintColor = .white
            return view
        }()
        let button:UIButton = {
            let button = UIButton(frame: .zero)
            button.setTitle("close", for: .normal)
            button.addTarget(self, action: #selector(self.makeAcion), for: .touchDown)
            button.isUserInteractionEnabled = true
            return button
        }()
        let title = setTitle(text: self.title)
        navBarview.addSubview(title)
        navBarview.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.width.equalToSuperview().multipliedBy(0.15)
            make.centerY.equalToSuperview()
        }
        title.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.left.equalTo(button.snp.right)
            make.right.equalToSuperview().inset(5)
            make.bottom.equalToSuperview().inset(5)
        }
        return navBarview
    }
    func makeNavigationBarView() -> UIView {
        let navBarview:UIView = {
            let view = UIView(frame: .zero)
            view.backgroundColor = . black
            view.tintColor = .white
            return view
        }()
        let title = setTitle(text: self.title)
        navBarview.addSubview(title)
        title.font = UIFont.boldSystemFont(ofSize: 22)
        title.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
        return navBarview
    }
    
    @objc private func makeAcion() {
        done?()
    }
    
    
}
