//
//  JuiceFlavourView.swift
//  zad_6_2
//
//  Created by Rafał Kuźmiczuk on 03/04/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

enum JuiceFlavour: String, CaseIterable {
    case Malinowy, Pomarańczowy, Grejpfrutowy
}

struct JuiceFlavourView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var juiceFlavour: JuiceFlavour
    
    var body: some View {
        VStack {
            ForEach(JuiceFlavour.allCases, id: \.self) { juice in
                Button(action: {
                    self.juiceFlavour = juice
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(juice.rawValue)
                    .resizable()
                    .frame(width: 150, height: 150)
                })
                
            }
        }.navigationBarTitle(Text("Wybór smaku soku"))
    }
}

struct JuiceFlavourView_Previews: PreviewProvider {
    static var previews: some View {
        JuiceFlavourView(juiceFlavour: .constant(JuiceFlavour.allCases[0]))
    }
}
