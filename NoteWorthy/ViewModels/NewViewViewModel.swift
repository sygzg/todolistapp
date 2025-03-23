//
//  NewViewViewModel.swift
//  NoteWorthy
//
//  Created by Ezgi Saygı on 19.03.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class NewViewViewModel: ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    init(){}
    func save() {
        guard canSave else {
            return
        }
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        let newID = UUID().uuidString
        let newItem = ToDoListItem(id: newID, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        let database = Firestore.firestore()
        database.collection("users")
            .document(uId)
            .collection("todos")
            .document(newID)
            .setData(newItem.asDictionary())
        
    }
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard dueDate >=  Date().addingTimeInterval(-86400) else{
            return false
        }
        return true
    }
}

