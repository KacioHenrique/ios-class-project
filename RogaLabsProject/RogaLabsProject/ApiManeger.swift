//
//  ApiManeger.swift
//  RogaLabsProject
//
//  Created by Kacio Batista on 29/04/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
public enum MetodoRequest {
    case post(Int,String)
    case get
}
class ApiManeger {
    private let baseUrl = URL(string: "https://jsonplaceholder.typicode.com/posts")
    static let shared = ApiManeger()
    func makeRequest(operation:MetodoRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        switch operation {
        case let .post(id, path):
            if let url = baseUrl?.appendingPathComponent("/\(id)/\(path)") {
                let request = URLRequest(url: url)
                makeTaskRequest(request: request, completionHandler:completionHandler)
            }
        default:
            if let url = baseUrl {
                let request = URLRequest(url: url)
                makeTaskRequest(request: request, completionHandler:completionHandler)
            }
        }
    }
    private func makeTaskRequest(request:URLRequest , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(nil, response, error)
            } else {
                completionHandler(data,response,nil)
            }
        }
        task.resume()
    }

}
