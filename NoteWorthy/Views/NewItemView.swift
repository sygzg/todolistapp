//
//  NewItemView.swift
//  NoteWorthy
//
//  Created by Ezgi Saygı on 19.03.2025.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
struct NewItemView: View {
    @StateObject var viewModel = NewViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 21))
                .bold()
                .padding(.top, 100)
            Form{
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                DatePicker("Due date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                TLButton(title: "Save", background: .purple){
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            } // alert(isPresented) yakında kalkacak onun yerine gelen kod parçacığı ile yer değiştir
            .alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date that is today or newer."))
                
                
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
