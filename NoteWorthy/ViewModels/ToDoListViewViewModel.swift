//
//  ToDoListViewViewModel.swift
//  NoteWorthy
//
//  Created by Ezgi Saygı on 19.03.2025.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
/// ViewModel for list of items view
/// Primary tab
class ToDoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    private let userID: String
    init(userID: String){
        self.userID = userID
    }
    func delete(id: String){
        let database = Firestore.firestore()
        database.collection("users")
            .document(userID)
            .collection("todos")
            .document(id)
            .delete()
    }
}
