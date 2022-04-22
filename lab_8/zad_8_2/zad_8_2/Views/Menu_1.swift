//
//  Menu_1.swift
//  zad_8_2
//
//  Created by Rafał Kuźmiczuk on 23/04/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct Menu_1: View {
    @Binding var option: String
    
    var body: some View {
        VStack {
            Text("First option")
            .contextMenu {
                Button(action: {
                    self.option = "Option 1"
                }, label: {
                    Text("Option 1")
                })
                Button(action: {
                    self.option = "Option 2"
                }, label: {
                    Text("Option 2")
                })
                Button(action: {
                    self.option = "Option 3"
                }, label: {
                    Text("Option 3")
                })
            }
            .padding()
            Text("Chosen option: \(option)")
        }
    }
}

struct Menu_1_Previews: PreviewProvider {
    static var previews: some View {
        Menu_1(option: .constant("Option 1"))
    }
}
