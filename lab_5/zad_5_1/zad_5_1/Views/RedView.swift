//
//  RedView.swift
//  zad_5_1
//
//  Created by Rafał Kuźmiczuk on 24/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct RedView: View {
    var body: some View {
        NavigationView {
            VStack {
                CircleView(color: .red, number: 1)
                    .navigationBarTitle("Czerwone koło")
                    .offset(y: -40)
                NavigationLink(
                    destination: BlueView(),
                    label: {
                        Text("Następny ekran")
                            .frame(width: 200, height: 40)
                            .background(Color.yellow)
                })
            }
        }
    }
}

struct RedView_Previews: PreviewProvider {
    static var previews: some View {
        RedView()
    }
}
