//
//  StatsView.swift
//  Catagoria
//
//  Created by Jaden Passero on 11/28/22.
//

import SwiftUI

struct CategoryItem: View {
    let category: String
    let categories: [String]
    @State var percentage = ""

    var body: some View {
        HStack(spacing: 30) {
            Text(category)
                .font(.system(size: 20, weight: .heavy, design: .rounded))
            Spacer()
            Text("\(percentage)%").font(.system(size: 20, weight: .heavy, design: .rounded))
        }.onAppear {
            setPercent()
        }
    }

    func setPercent() {
        let defaults = UserDefaults.standard
        let index = categories.firstIndex(of: category)!
        let totals = defaults.object(forKey: "TotalsArray") as? [Int] ?? [Int]()
        let scores = defaults.object(forKey: "ScoreArray") as? [Int] ?? [Int]()
        if totals[index] != 0 {
            percentage = String(round((Double(scores[index]) / Double(totals[index])) * 10000)/100)
        } else {
            percentage = "---"
        }
    }
}

struct StatsView: View {
    @ObservedObject var vm: MainScreenViewModel
    @State private var showAlert = false

    var body: some View {
        List {
            ForEach(vm.categories, id: \.self) { category in
                CategoryItem(category: category, categories: vm.categories)
            }
            HStack {
                Spacer()
                Button {
                    showAlert = true
                } label: {
                    Text("Reset").foregroundColor(.red)
                }.alert("Reset percentages? All values will be deleted. This cannot be undone.", isPresented: $showAlert) {
                    Button("Cancel", role: .cancel) {}
                    Button("Reset") {
                        let defaults = UserDefaults.standard
                        defaults.set([Int](repeating: 0, count: 24), forKey: "ScoreArray")
                        defaults.set([Int](repeating: 0, count: 24), forKey: "TotalsArray")
                    }
                }
                Spacer()
            }
        }
    }
}

// struct StatsView_Previews: PreviewProvider {
//    static var previews: some View {
//        StatsView()
//    }
// }
