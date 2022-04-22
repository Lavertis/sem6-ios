//
//  Menu_2.swift
//  zad_8_2
//
//  Created by Rafał Kuźmiczuk on 23/04/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct Menu_2: View {
    @Binding var color: Color
    
    var body: some View {
        Text("Background color")
        .padding()
        .contextMenu {
            Button(action: {
                self.color = Color.red
            }, label: {
                Text("Red")
            })
            Button(action: {
                self.color = Color.green
            }, label: {
                Text("Green")
            })
            Button(action: {
                self.color = Color.blue
            }, label: {
                Text("Blue")
            })
        }
    }
}

struct Menu_2_Previews: PreviewProvider {
    static var previews: some View {
        Menu_2(color: .constant(Color.white))
    }
}
