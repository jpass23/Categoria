//
//  QuestionViewModel.swift
//  Catagoria
//
//  Created by Jaden Passero on 11/25/22.
//

import Foundation
import SwiftUI

class QuestionViewModel: ObservableObject {
    let mainColor: UIColor
    let answerText: CGColor
    let questionText: CGColor
    let width: Double
    let height: Double
    @Published var numCorrect = 0
    @Published var numTotal = 0
    private var set = false
    let categories = ["General Knowledge", "Books", "Film", "Music", "Musicals & Theater", "Television", "Video Games", "Board Games", "Science & Nature", "Computers", "Mathematics", "Mythology", "Sports", "Geography", "History", "Politics", "Art", "Celebrities", "Animals", "Vehicles", "Comics", "Gadgets", "Anime & Manga", "Cartoons & Animations"]

    init() {
        self.mainColor = UIColor(red: 0.383, green: 0.802, blue: 0.949, alpha: 1.0)
        self.answerText = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        self.questionText = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        self.width = UIScreen.main.bounds.size.width
        self.height = UIScreen.main.bounds.size.height
    }

    func noUnicode(string: String) -> String {
        let goodString = string.replacingOccurrences(of: "&quot;", with: "\"")
                                .replacingOccurrences(of: "&#039;", with: "\'")
                                .replacingOccurrences(of: "&ouml;", with: "ö")
                                .replacingOccurrences(of: "&ldquo;", with: "\"")
                                .replacingOccurrences(of: "&aacute;", with: "á")
                                .replacingOccurrences(of: "&iacute;", with: "í")
                                .replacingOccurrences(of: "&lrm;", with: "")
                                .replacingOccurrences(of: "&rdquo;", with: "\"")
                                .replacingOccurrences(of: "&pi;", with: "π")
                                .replacingOccurrences(of: "&deg;", with: "°")
                                .replacingOccurrences(of: "&Delta;", with: "∆")
                                .replacingOccurrences(of: "&ocirc;", with: "ô")
                                .replacingOccurrences(of: "&rsquo;", with: "\'")
                                .replacingOccurrences(of: "&amp;", with: "&")
                                .replacingOccurrences(of: "&lt;", with: "<")
                                .replacingOccurrences(of: "&gt;", with: ">")
                                .replacingOccurrences(of: "&uuml;", with: "ü")
                                .replacingOccurrences(of: "&eacute;", with: "é")
        return goodString
    }
    
    func formatText(text: String, size: CGFloat, color: CGColor) -> some View {
        return Text(text).font(.system(size: size, weight: .black, design: .monospaced))
            .foregroundColor(Color(color))
            .multilineTextAlignment(.center)
    }
    
    func buttonWidth(answer: String) -> Double{
        let width = (self.width/3) + 10*Double(answer.count)
        if width < self.width {
            return width
        }else{
            return width-60
        }
    }
    
    func addToDefaults(category: String){
        if !set{
            let defaults = UserDefaults.standard
            let index = categories.firstIndex(of: category)!
            var totals = defaults.object(forKey: "TotalsArray") as? [Int] ?? [Int]()
            var scores = defaults.object(forKey: "ScoreArray") as? [Int] ?? [Int]()
            totals[index] += self.numTotal
            scores[index] += self.numCorrect
            print(totals)
            print(scores)
            defaults.set(totals, forKey: "TotalsArray")
            defaults.set(scores, forKey: "ScoreArray")
            self.set = true
        }
    }
}
