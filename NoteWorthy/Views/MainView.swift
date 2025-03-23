//
//  ContentView.swift
//  NoteWorthy
//
//  Created by Ezgi Saygı on 14.03.2025.
//

import SwiftUI
import SwiftData
import FirebaseAuth
import FirebaseFirestore

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty{
            accountView
        }else{
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View {
        TabView{
            ToDoListView(userID: viewModel.currentUserID)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
        .modelContainer(for: Item.self, inMemory: true)
}


