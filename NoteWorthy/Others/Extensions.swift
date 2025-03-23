//
//  Extensions.swift
//  NoteWorthy
//
//  Created by Ezgi Saygı on 22.03.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
extension Encodable{
    func asDictionary() -> [String: Any]{
        guard let data = try? JSONEncoder().encode(self) else {
            return[:]
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        }catch{
            return[:]
        }
    }
}
