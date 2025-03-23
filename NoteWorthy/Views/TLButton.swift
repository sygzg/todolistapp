//
//  TLButton.swift
//  NoteWorthy
//
//  Created by Ezgi Saygı on 20.03.2025.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    var body: some View {
        Button{
            //attempt log in
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(background)
                Text(title)
                    .foregroundStyle(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Value", background: .pink) {
        //action
    }
}
