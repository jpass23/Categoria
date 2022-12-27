//
//  Model.swift
//  Catagoria
//
//  Created by Jaden Passero on 11/12/22.
//

import Foundation

struct Response: Codable {
    let response_code: Int
    let results: [Result]
}

struct Result: Codable, Hashable{
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
    
    func answerList() -> [String]{
        var answerList = self.incorrect_answers
        answerList.append(self.correct_answer)
        return answerList.shuffled()
    }
    
}

class Model: ObservableObject {
    var questionQuantity: Int = 5
    @Published var results = [Result]()


    func loadData(amount: Int, category: Int) async -> [Result] {
        results = [Result]()
        guard let url = URL(string: "https://opentdb.com/api.php?amount=\(amount)&category=\(category)") else { return self.results}

        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let tasks = try decoder.decode(Response.self, from: data)
            tasks.results.forEach { i in
                self.results.append(i)
            }
        } catch {
            print(error)
        }

        
        //print(self.results)
        return self.results
    }
}
