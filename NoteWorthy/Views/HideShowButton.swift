//
//  HideShowButton.swift
//  NoteWorthy
//
//  Created by Ezgi Saygı on 20.03.2025.
//

import SwiftUI
enum FieldToFocus {
    case secureField, textField
}
struct HideShowButton: View {
    @State var password = ""
    @State var isShowingPassword : Bool = false
    @FocusState var isFieldFocus : FieldToFocus?
    var body: some View {
        VStack{
            Group{
                if isShowingPassword{
                    TextField("Enter a password", text: $password)
                        .focused($isFieldFocus, equals: .textField)
                }else {
                    SecureField("Enter a password", text: $password)
                        .focused($isFieldFocus, equals: .secureField)
                }
            }
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.none)
                .padding()
            Button {
                isShowingPassword.toggle()
            }label:{
                Text(isShowingPassword ? "Hide" : "Show")
            }
        }
        .onChange(of: isShowingPassword) { oldValue, newValue  in
            isFieldFocus = isShowingPassword ? .textField : .secureField
        }
    }
}

#Preview {
    HideShowButton()
}
