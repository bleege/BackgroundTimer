//
//  ContentView.swift
//  BackgroundTimer
//
//  Created by Brad Leege on 2/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(viewModel.textToDisplay)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
