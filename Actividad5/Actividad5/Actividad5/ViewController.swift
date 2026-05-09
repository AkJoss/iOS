//
//  ViewController.swift
//  Actividad5
//
//  Created by José Alberto Rocha Munguía on 25/02/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack (alignment: .top, spacing: 10) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        
        HStack (alignment: .center, spacing: 30) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        
        
        HStack (alignment: .bottom, spacing: 90) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        
        .padding()
    }
}

#Preview {
    ContentView()
}
