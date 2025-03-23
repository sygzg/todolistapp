//
//  HeaderView.swift
//  NoteWorthy
//
//  Created by Ezgi Saygı on 20.03.2025.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    var body: some View {
        VStack {
            //header
            ZStack{
                RoundedRectangle(cornerRadius: 0)
                    .foregroundStyle(background)
                    .rotationEffect(Angle(degrees: angle))
                VStack {
                    Text(title)
                        .font(.system(size: 50))
                        .foregroundStyle(Color.white)
                        .bold()
                    Text(subtitle)
                        .font(.system(size: 30))
                        .foregroundStyle(Color.white)
                }
                .padding(.top, 40)
            }
            .frame(width: UIScreen.main.bounds.width * 3,
                   height: 350)
            .offset(y: -150)
            //login form
            //create account
            Spacer()
        }
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: .blue)
}

