//
//  Comments.swift
//  RogaLabsProject
//
//  Created by Kacio Batista on 30/04/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
struct Comment: Codable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
typealias Comments = [Comment]
