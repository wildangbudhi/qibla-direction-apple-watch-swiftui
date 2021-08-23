//
//  ReactReader.swift
//  iQibla WatchKit Extension
//
//  Created by Wildan Ghiffarie Budhi on 23/08/21.
//

import SwiftUI

extension View {
    func rectReader(_ binding: Binding<CGRect>, in space: CoordinateSpace) -> some View {
        self.background(GeometryReader { (geometry) -> AnyView in
            let rect = geometry.frame(in: space)
            DispatchQueue.main.async {
                binding.wrappedValue = rect
            }
            return AnyView(Rectangle().fill(Color.clear))
        })
    }
}
