//
//  ContentView.swift
//  zad_6_2
//
//  Created by Rafał Kuźmiczuk on 03/04/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var juiceFlavour: JuiceFlavour = JuiceFlavour.Pomarańczowy
    @State var coffeeType: CoffeeType = CoffeeType.Cappuccino
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Smak soku: \(juiceFlavour.rawValue)")
                    .padding(.top)
                Text("Rodzaj kawy: \(coffeeType.rawValue)")
                
                List {
                    NavigationLink(
                        destination: JuiceFlavourView(juiceFlavour: $juiceFlavour),
                        label: {
                            Text("Wybór smaku soku")
                                .padding()
                    })
                        .foregroundColor(.white)
                        .listRowBackground(Color.purple)
                    
                    NavigationLink(
                        destination: CoffeTypeView(coffeType: $coffeeType),
                        label: {
                            Text("Wybór rodzaju kawy")
                                .padding()
                    })
                        .foregroundColor(.white)
                        .listRowBackground(Color.orange)
                }
                .padding(.vertical)
            }.navigationBarTitle(Text("Restauracja"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
