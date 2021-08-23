//
//  ContentView.swift
//  iQibla WatchKit Extension
//
//  Created by Wildan Ghiffarie Budhi on 23/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var qiblaVM: QiblaViewModel = QiblaViewModel()
    
    var body: some View {
        NavigationView{
            QiblaDirection(kabahSize: 35.0, directionSize: 100.0)
                .rotationEffect(Angle.degrees(qiblaVM.qiblaDirection))
                .navigationTitle("iQibla")
                .foregroundColor(.green)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
