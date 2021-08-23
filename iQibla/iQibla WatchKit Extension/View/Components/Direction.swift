//
//  Direction.swift
//  iQibla WatchKit Extension
//
//  Created by Wildan Ghiffarie Budhi on 23/08/21.
//

import SwiftUI

struct Direction: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY + (((rect.midY - rect.minY)/2))))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))

        return path
    }
}

struct Direction_Previews: PreviewProvider {
    static var previews: some View {
        Direction()
            .frame(width: 100.0, height: 100.0)
    }
}
