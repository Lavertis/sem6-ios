//
//  ContentView.swift
//  zad_2_2
//
//  Created by Rafał Kuźmiczuk on 04/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("dog")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack() {
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Piesek")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.blue)
                        Text("Nieznany autor")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                    .padding()
                    Spacer()
                }
                .background(Color.white).opacity(0.5)
            }
        }
        .frame(maxHeight: 410)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
