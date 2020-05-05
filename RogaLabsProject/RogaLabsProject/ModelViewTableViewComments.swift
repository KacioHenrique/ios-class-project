//
//  ModelViewTableViewComments.swift
//  RogaLabsProject
//
//  Created by Kacio Batista on 30/04/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
import UIKit
final class ModelViewTableViewComments: ModelViewTableView {
    private let path:String = "comments"
    private let id:Int
    var model:Comments = [] {
        didSet {
            self.callback?()
        }
    }

    init(viewControler: UIViewController,id:Int, callback: (() -> ())?) {
        self.id  = id
        super.init(viewControler: viewControler, handeler: callback)
        getInitData()
    }
    func getInitData() {
        
        ApiManeger.shared.makeRequest(operation: .post(self.id, path)) { (data, reponse, erro) in
            self.spinnerViewController.removeSpinnerView()
            if let erro = erro {
                print("erro localizado \(erro.localizedDescription)")
            } else {
                guard let data = data else {return}
                let decoder = JSONDecoder()
                do {
                    self.model = try decoder.decode(Comments.self, from: data)
                } catch {
                   print(error.localizedDescription)
               }
            }
        }
    }
    func tableViewCommentIndex(index: Int) -> Comment? {
        if model.isEmpty || index > model.count - 1{
            return nil
        }
        else {
            return model[index]
        }
    }
}
