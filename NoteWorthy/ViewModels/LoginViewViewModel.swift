//
//  LoginViewViewModel.swift
//  NoteWorthy
//
//  Created by Ezgi Saygı on 19.03.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init() {}
    func login(){
        guard validate() else {
            return
        }
        //try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    private func validate()  -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "*Please fill in all fields"
            return false
        }
        // email@foo.com
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email"
            return false
        }
        return true
    }
}
