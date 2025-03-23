//
//  RegisterView.swift
//  NoteWorthy
//
//  Created by Ezgi Saygı on 19.03.2025.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, background: .gray)
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .textInputAutocapitalization(.never)
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                TextField("Password", text: $viewModel.password)
                    .keyboardType(.default)
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(title: "Create An Account", background: .green){
                    viewModel.register()
                    
                }
                .padding()
            }
            .offset(y: -50)
            Spacer()
        }
    }
    
}
#Preview {
    RegisterView()
}
