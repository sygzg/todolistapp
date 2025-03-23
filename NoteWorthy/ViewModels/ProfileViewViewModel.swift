//
//  ProfileViewViewModel.swift
//  NoteWorthy
//
//  Created by Ezgi Saygı on 19.03.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class ProfileViewViewModel: ObservableObject{
    init(){}
    @Published var user: User? = nil
    func fetchUser(){
        guard let userID = Auth.auth().currentUser?.uid else{
            return
        }   
        let database = Firestore.firestore()
        database.collection("users").document(userID).getDocument{ snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.user = User( //self?.user yapmama izin vermedi
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0
                )
            }
        }
    }
    func logOut(){
        do{
            try Auth.auth().signOut() 
            
        }catch{
            print(error)
        }
        
    }
}
