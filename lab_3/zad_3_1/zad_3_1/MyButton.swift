//
//  PanelView.swift
//  zad_3_1
//
//  Created by Rafał Kuźmiczuk on 13/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct MyButton: View {
    @Binding var clicks: Int
    
    init(clicks: Binding<Int>) {
        self._clicks = clicks
    }
    
    var body: some View {
        Button(action: {
            self.clicks += 1
        }) {
            Text("Wciśnij")
            .padding()
            .background(Color.gray)
            .foregroundColor(.green)
            .cornerRadius(30)
        }.padding()
    }
}
