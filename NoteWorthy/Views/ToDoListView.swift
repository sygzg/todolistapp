//
//  ToDoListView.swift
//  NoteWorthy
//
//  Created by Ezgi Saygı on 19.03.2025.
//

import SwiftUI
import FirebaseFirestore /// önceden firebasefirestore swift kullanılırdı şu an kalktığı için değiştirdim
struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    private let userID: String
    init(userID: String){
        self.userID = userID
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userID: userID))
    }
    var body: some View {
        NavigationStack{ // sadece iphonelarda kullanılacağı için navigationstack kullanıldı
            VStack{
                List(items){ item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    viewModel.showingNewItemView = true 
                    
                }label:{
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
                
            }
        }
    }
}

#Preview {
    ToDoListView(userID: "jUrn9p9dX6erwEBovTIqMI3BDBP2")
}
