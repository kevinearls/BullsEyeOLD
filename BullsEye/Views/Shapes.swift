//
//  Shapes.swift
//  BullsEye
//
//  Created by Kevin Earls on 05/02/2022.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        VStack {
            Circle()
                //.fill(Color.blue)
                //.inset(by: 10.0)
                .strokeBorder(Color.blue, lineWidth: 20)
                .frame(width: 200, height: 100, alignment: .center)
            RoundedRectangle(cornerRadius: 20.0)
            Capsule()
            Ellipse()
        }
        .background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
