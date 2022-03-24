//
//  SecondBrandView.swift
//  zad_5_2
//
//  Created by Rafał Kuźmiczuk on 25/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ToyotaBrandView: View {
    var models = ["Supra", "Land Cruiser", "86", "Altezza", "Celica"]
    
    var body: some View {
        VStack {
            ForEach(models, id: \.self) {
                Text($0).padding()
            }
        }
    }
}

struct SecondBrandView_Previews: PreviewProvider {
    static var previews: some View {
        ToyotaBrandView()
    }
}
