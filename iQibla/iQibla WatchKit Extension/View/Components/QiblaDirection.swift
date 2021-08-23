//
//  QiblaDirection.swift
//  iQibla WatchKit Extension
//
//  Created by Wildan Ghiffarie Budhi on 23/08/21.
//

import SwiftUI

struct QiblaDirection: View {
    
    var kabahSize: CGFloat
    var directionSize: CGFloat
    
    var body: some View {
        ZStack(alignment: .center){
            Direction()
                .frame(width: self.directionSize, height: self.directionSize)
            Image("kabah")
                .resizable()
                .frame(width: self.kabahSize, height: self.kabahSize)
        }
    }
}

struct QiblaDirection_Previews: PreviewProvider {
    static var previews: some View {
        QiblaDirection(kabahSize: 50.0, directionSize: 100.0)
    }
}
