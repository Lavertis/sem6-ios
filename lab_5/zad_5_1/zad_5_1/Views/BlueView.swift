//
//  BlueView.swift
//  zad_5_1
//
//  Created by Rafał Kuźmiczuk on 24/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct BlueView: View {
    var body: some View {
        VStack {
            SquareView(color: .blue, number: 2)
                .navigationBarTitle("Niebieski kwadrat")
                .offset(y: -40)
            NavigationLink(
                destination: GreenView(),
                label: {
                    Text("Następny ekran")
                        .frame(width: 200, height: 40)
                        .background(Color.yellow)
            })
        }
    }
}

struct BlueView_Previews: PreviewProvider {
    static var previews: some View {
        BlueView()
    }
}
