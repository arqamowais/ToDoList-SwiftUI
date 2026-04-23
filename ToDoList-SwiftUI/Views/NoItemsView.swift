//
//  NoItemsView.swift
//  ToDoList-SwiftUI
//
//  Created by Arqam Owais on 24/04/2026.
//

import SwiftUI

struct NoItemsView: View {
    
    @State private var animate: Bool = false
    
    private let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Add items to To-Do List")
                    .padding(.bottom, 20)
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Something")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7), radius: animate ? 30 : 10, x: 0, y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation (
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
    
}

#Preview {
    NavigationView {
        NoItemsView()
    }
}
