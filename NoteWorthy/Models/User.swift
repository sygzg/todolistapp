//
//  User.swift
//  NoteWorthy
//
//  Created by Ezgi Saygı on 19.03.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
