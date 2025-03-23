//
//  LoginView.swift
//  NoteWorthy
//
//  Created by Ezgi Saygı on 19.03.2025.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationStack{ //bunu daha sonra NavigationSpiltView mu yapacağız araşırmalısın
            VStack {
                //header
                HeaderView(title: "To Do List", subtitle: "Get things done!", angle: 15, background: .brown)
                
                Form {
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundStyle(Color.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .keyboardType(.default)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .keyboardType(.default)
                    TLButton(title: "Log in", background: .blue){
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
            }
            
            //create account
            VStack{
                Text("New around here?")
                NavigationLink("Create An Account", destination: RegisterView())
            }
            .padding(.bottom, 50)
            Spacer()
        }
        
    }
    
}


#Preview {
    LoginView()
}
