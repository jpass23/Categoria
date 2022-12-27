//
//  ContentView.swift
//  Catagoria
//
//  Created by Jaden Passero on 11/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            MainScreenView()
        }.onAppear {
            let defaults = UserDefaults.standard
            if defaults.object(forKey: "ScoreArray") == nil {
                defaults.set([Int](repeating: 0, count: 24), forKey: "ScoreArray")
                defaults.set([Int](repeating: 0, count: 24), forKey: "TotalsArray")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
