//
//  CoffeTypeView.swift
//  zad_6_2
//
//  Created by Rafał Kuźmiczuk on 03/04/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

enum CoffeeType: String, CaseIterable {
    case Espresso, Macchiato, Cappuccino, Latte
}

struct CoffeTypeView: View {
    @Binding var coffeType: CoffeeType
    
    var body: some View {
        VStack {
            Picker("Kawa", selection: $coffeType) {
                ForEach(CoffeeType.allCases, id: \.self) { coffeType in
                    Text(coffeType.rawValue)
                }
            }.padding()
        }.navigationBarTitle(Text("Wybór kawy"))
    }
}

struct CoffeTypeView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeTypeView(coffeType: .constant(CoffeeType.allCases[0]))
    }
}
