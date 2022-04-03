//
//  ColorChoiceView.swift
//  zad_6_1
//
//  Created by Rafał Kuźmiczuk on 03/04/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ColorChoiceView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var chosenColor: Color
    let colors: [Color] = [.orange, .red, .green, .blue]
    
    var body: some View {
        VStack {
            ForEach(colors, id: \.self) { color in
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    self.chosenColor = color
                }, label: {
                    Text(color.description.capitalized)
                    .padding()
                    .frame(width: 100)
                    .foregroundColor(.white)
                    .background(color)
                    .cornerRadius(30)
                }).padding(.bottom)
                
            }.navigationBarTitle(Text("Wybór koloru"))
        }
    }
}

struct ColorChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        ColorChoiceView(chosenColor: .constant(.orange))
    }
}
