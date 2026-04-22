//
//  AddView.swift
//  ToDoList-SwiftUI
//
//  Created by Arqam Owais on 21/04/2026.
//

import SwiftUI

struct AddView: View {

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var textFieldText: String = ""
    @State private var alertTitle: String = ""
    @State private var alertIsVisible: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.lightGray))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed,
                       label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
            
        }
        .navigationBarTitle("Add an Item")
        .alert(isPresented: $alertIsVisible) {
            getAlert()
        }
    }
    
    private func saveButtonPressed() {
        if textIsAppropriateLength() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        } else {
            alertTitle = "Your new item must be at least 3 characters long."
            alertIsVisible.toggle()
        }
    }
    
    private func textIsAppropriateLength() -> Bool {
        textFieldText.count > 3
    }
    
    private func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
    
}
