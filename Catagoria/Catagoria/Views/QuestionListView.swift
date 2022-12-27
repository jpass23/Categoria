//
//  QuestionListView.swift
//  Catagoria
//
//  Created by Jaden Passero on 11/25/22.
//

import SwiftUI

struct QuestionListView: View {
    @StateObject var vm = QuestionViewModel()
    @State var questionList: [Result]
    @State var category: String

    var body: some View {
        TabView {
            ForEach(questionList, id: \.self) { question in
                QuestionView(vm: vm, question: question)
            }
            FinalScreenView(vm: vm, category: $category)
        }.tabViewStyle(.page(indexDisplayMode: .always))
            .navigationBarBackButtonHidden(true)
            .background(Color(vm.mainColor), ignoresSafeAreaEdges: .all)
    }
}

// struct QuestionListView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionListView()
//    }
// }
