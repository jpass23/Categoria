//
//  MainScreenViewModel.swift
//  Catagoria
//
//  Created by Jaden Passero on 11/12/22.
//

import Foundation
import SwiftUI


class MainScreenViewModel: ObservableObject {
    @ObservedObject var model = Model()
    let mainColor: UIColor
    let textColor: CGColor
    let titleColor: CGColor
    let image: Image
    let width: Double
    let height: Double
    var numQuestions: Int
    @Published var category: String
    @Published var questions = [Result]()
    let categories = ["General Knowledge", "Books", "Film", "Music", "Musicals & Theater", "Television", "Video Games", "Board Games", "Science & Nature", "Computers", "Mathematics", "Mythology", "Sports", "Geography", "History", "Politics", "Art", "Celebrities", "Animals", "Vehicles", "Comics", "Gadgets", "Anime & Manga", "Cartoons & Animations"]

    init() {
        self.mainColor = UIColor(red: 0.383, green: 0.802, blue: 0.949, alpha: 1.0)
        self.textColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        self.titleColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        self.image = Image(systemName: "questionmark").resizable()
        self.width = UIScreen.main.bounds.size.width
        self.height = UIScreen.main.bounds.size.height
        self.category = "Choose a category..."
        self.numQuestions = 5
    }

    func formatText(text: String, size: CGFloat, color: CGColor) -> some View {
        return Text(text).font(.system(size: size, weight: .black, design: .monospaced))
            .foregroundColor(Color(color))
    }

    func apiRequest() {
        Task {
            let index = categories.firstIndex(of: category)
            await questions = model.loadData(amount: numQuestions, category: index! + 9)
        }
    }
}
