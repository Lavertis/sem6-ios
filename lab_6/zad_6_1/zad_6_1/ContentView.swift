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
    
    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                Text("Hello, World!")
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(chosenColor)
                
                NavigationLink(
                    destination: ColorChoiceView(chosenColor: $chosenColor),
                    label: {
                        Text("Przejdź do wyboru koloru")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(30)
                })
            }.navigationBarTitle(Text("Pierwszy widok"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
