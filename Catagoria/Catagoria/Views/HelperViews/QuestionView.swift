//
//  QuestionView.swift
//  Catagoria
//
//  Created by Jaden Passero on 11/12/22.
//

import SwiftUI

struct QuestionView: View {
    @ObservedObject var vm: QuestionViewModel
    let question: Result
    @State var correct: String?
    @State var answered = false
    @State var answerList = [String]()

    var body: some View {
        ZStack {
            Color(vm.mainColor).ignoresSafeArea()

            VStack(alignment: .center, spacing: 50) {
                vm.formatText(text: vm.noUnicode(string: question.question), size: 20, color: vm.questionText)
                    .padding(20)
                ForEach(answerList, id: \.self) { answer in
                    Button { // Answers
                        if !answered {
                            vm.numTotal += 1
                            answered = true
                            if answer == question.correct_answer {
                                correct = "Well Done!"
                                vm.numCorrect += 1
                            } else {
                                correct = "Sorry, Incorrect"
                            }
                        }
                    } label: {
                        ZStack {
                            Rectangle().foregroundColor(.black)
                                .frame(width: vm.buttonWidth(answer: answer), height: vm.height/12)
                                .cornerRadius(20)
                            if answered && answer == question.correct_answer {
                                Rectangle().foregroundColor(.green)
                                    .frame(width: vm.buttonWidth(answer: answer), height: vm.height/12)
                                    .cornerRadius(20)
                            }
                            vm.formatText(text: vm.noUnicode(string: answer), size: 25, color: vm.answerText)
                        }
                    }
                }
                vm.formatText(text: correct ?? "", size: 15, color: vm.questionText)
            }
        }.onAppear {
            answerList = question.answerList()
        }
    }
}

// struct QuestionView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionView()
//    }
// }
