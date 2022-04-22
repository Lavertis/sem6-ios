//
//  ContentView.swift
//  zad_8_2
//
//  Created by Rafał Kuźmiczuk on 23/04/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var firstOption: String = ""
    @State private var secondOption: String = ""
    @State private var color: Color = Color.white
    
    var body: some View {
        VStack {
            Menu_1(option: $firstOption)
            .padding()
            .padding(.bottom)
            
            Menu_2(color: $color)
            .padding()
            .padding(.bottom)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(self.color)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
