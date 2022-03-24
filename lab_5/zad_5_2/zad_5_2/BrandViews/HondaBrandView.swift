//
//  FirstBrandView.swift
//  zad_5_2
//
//  Created by Rafał Kuźmiczuk on 25/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct HondaBrandView: View {
    var models = ["Accord", "Civic", "Odyssey", "Integra", "NSX"]
    
    var body: some View {
        VStack {
            ForEach(models, id: \.self) {
                Text($0).padding()
            }
        }
    }
}

struct FirstBrandView_Previews: PreviewProvider {
    static var previews: some View {
        HondaBrandView()
    }
}
