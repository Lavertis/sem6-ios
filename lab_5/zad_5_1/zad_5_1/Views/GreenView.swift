//
//  GreenView.swift
//  zad_5_1
//
//  Created by Rafał Kuźmiczuk on 24/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct GreenView: View {
    var body: some View {
        TriangleView(color: .green, number: 3)
            .navigationBarTitle("Zielony trójkąt")
            .offset(y: -40)
    }
}

struct GreenView_Previews: PreviewProvider {
    static var previews: some View {
        GreenView()
    }
}
