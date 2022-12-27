//
//  MainScreenView.swift
//  Catagoria
//
//  Created by Jaden Passero on 11/12/22.
//

import SwiftUI

struct MainScreenView: View {
    @StateObject var vm = MainScreenViewModel()
    @State private var showPopover = false

    var body: some View {
        ZStack {
            Color(vm.mainColor).ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    NavigationLink {
                        StatsView(vm: vm)
                    } label: {
                        Image(systemName: "chart.xyaxis.line")
                            .resizable()
                            .frame(width: vm.width/12, height: vm.width/12)
                            .foregroundColor(.black)
                            .padding(.trailing)
                    }
                }
                Spacer()
                Text("CATEGORIA")
                    .font(.system(size: 61, weight: .heavy, design: .rounded))
                    .bold()
                    .font(.largeTitle)
                    .font(.headline)
                    .foregroundColor(.black)
                // vm.formatText(text: "CATEGORIA", size: 60,color: vm.titleColor)
                vm.image.frame(width: vm.width/2.5, height: vm.height/3).foregroundColor(.black)
                Spacer()
                Button {
                    showPopover = true
                } label: {
                    ZStack {
                        Rectangle().foregroundColor(.black)
                            .frame(width: vm.width/1.1, height: vm.height/9)
                            .cornerRadius(20)
                        vm.formatText(text: vm.category, size: 25, color: vm.textColor)
                    }
                }.popover(isPresented: $showPopover) {
                    CategoryView(vm: vm, showPopover: $showPopover)
                }
                Spacer()
                if !vm.questions.isEmpty {
                    NavigationLink {
                        QuestionListView(questionList: vm.questions, category: vm.category)
                    } label: {
                        ZStack {
                            Rectangle().foregroundColor(.black)
                                .frame(width: vm.width/2, height: vm.height/9)
                                .cornerRadius(20)
                            vm.formatText(text: "Play", size: 40, color: vm.textColor)
                        }
                    }
                } else {
                    EmptyView()
                }

                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
