//
//  ColorChoiceView.swift
//  zad_6_1
//
//  Created by Rafał Kuźmiczuk on 03/04/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ColorChoiceView: View {
    @Binding var chosenColor: Color
    let colors: [Color] = [.orange, .red, .green, .blue]
    
    var body: some View {
        VStack {
            Picker("Kolory", selection: $chosenColor) {
                ForEach(colors, id: \.self) { color in
                    Text(color.description.capitalized)
                    .foregroundColor(color)
                    .padding()
                }
            }.labelsHidden()
        }.navigationBarTitle(Text("Wybór koloru"))
    }
}

struct ColorChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        ColorChoiceView(chosenColor: .constant(.orange))
    }
}
