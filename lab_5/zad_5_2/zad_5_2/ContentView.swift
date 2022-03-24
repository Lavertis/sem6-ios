//
//  ContentView.swift
//  zad_5_2
//
//  Created by Rafał Kuźmiczuk on 25/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: HondaBrandView(), label: {
                    Text("Honda")
                })
                    .frame(width: 200, height: 40)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .padding()
                
                NavigationLink(destination: ToyotaBrandView(), label: {
                    Text("Toyota")
                })
                    .frame(width: 200, height: 40)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .padding()
                
                NavigationLink(destination: NissanBrandView(), label: {
                    Text("Nissan")
                })
                    .frame(width: 200, height: 40)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
