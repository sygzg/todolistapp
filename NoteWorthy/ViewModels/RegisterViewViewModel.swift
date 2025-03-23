//
//  RegisterViewViewModel.swift
//  NoteWorthy
//
//  Created by Ezgi Saygı on 19.03.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class RegisterViewViewModel: ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    init() {}
    func register() {
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }
            self?.inserUserRecord(id: userID)
        }
    }
    private func inserUserRecord(id: String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let database = Firestore.firestore()
        database.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        guard password.count >= 6 else {
            return false
        }
        return true
    }
}
