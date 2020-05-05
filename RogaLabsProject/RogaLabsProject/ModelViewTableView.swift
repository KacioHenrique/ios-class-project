//
//  ModelViewTableView.swift
//  RogaLabsProject
//
//  Created by Kacio Batista on 29/04/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
class ModelViewTableView {
    fileprivate var model:Posts = [] {
        didSet {
            self.callback?()
        }
    }
    let spinnerViewController = SpinnerViewController()
    var callback:(() ->())?
    
    init(viewControler:UIViewController, callback:(() -> ())?) {
        self.createSpinnerView(viewController: viewControler)
        self.callback = callback
        getInitData()
    }
     init(viewControler:UIViewController , handeler:(() -> ())?) {
        self.createSpinnerView(viewController: viewControler)
        self.callback = handeler
    }
    
    fileprivate func getInitData() {
        ApiManeger.shared.makeRequest(operation: .get) { (data, response, erro) in
            self.spinnerViewController.removeSpinnerView()
            if let erro = erro {
                print("erro localizado \(erro.localizedDescription)")
            } else {
                guard let data = data else {return}
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970

                do {
                    self.model = try decoder.decode(Posts.self, from: data)
                } catch {
                   print(error.localizedDescription)
               }
            }
        }
    }
    
    func tableViewNumbersOfRows() -> Int {
        return model.count
    }
    
    func tableViewPostIndex(index:Int) -> Post? {
        if model.isEmpty || index > model.count - 1{
            return nil
        }
        else {
            return model[index]
        }
    }
    func createSpinnerView(viewController:UIViewController) {
        viewController.addChild(spinnerViewController)
        viewController.view.addSubview(spinnerViewController.view)
        spinnerViewController.view.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
        }
        spinnerViewController.didMove(toParent: viewController)
    }

}
