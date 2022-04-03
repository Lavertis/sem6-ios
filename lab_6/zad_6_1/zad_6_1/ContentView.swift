//
//  ContentView.swift
//  zad_6_1
//
//  Created by Rafał Kuźmiczuk on 03/04/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var chosenColor: Color = Color.orange
    @State private var showColorChoice: Bool = false
    
    var body: some View {
        VStack(spacing: 25) {
        Text("Hello, World!")
        .fontWeight(.bold)
        .padding()
        .foregroundColor(chosenColor)
        
        Button(action: {
            self.showColorChoice.toggle()
        }, label: {
            Text("Przejdź do wyboru koloru")
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(5)
        })
        .sheet(isPresented: $showColorChoice) {
            ColorChoiceView(chosenColor: self.$chosenColor)
        }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
