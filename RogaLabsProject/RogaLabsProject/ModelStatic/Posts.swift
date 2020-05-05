//
//  Posts.swift
//  RogaLabsProject
//
//  Created by Kacio Batista on 29/04/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
struct Post: Codable {
    let userId:Int
    let id:Int
    let title, body: String
}
typealias Posts = [Post]
