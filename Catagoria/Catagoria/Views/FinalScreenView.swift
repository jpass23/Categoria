//
//  FinalScreenView.swift
//  Catagoria
//
//  Created by Jaden Passero on 11/25/22.
//

import SwiftUI

struct FinalScreenView: View {
    @ObservedObject var vm: QuestionViewModel
    @Binding var category: String
    
    var body: some View {
        
        ZStack {
            Color(vm.mainColor)
            if vm.numTotal != 5{
                vm.formatText(text: "Round Unfinished...", size: 30, color: vm.questionText)
                    .multilineTextAlignment(.center)
            }else{
                VStack{
                    Spacer()
                    vm.formatText(text: "Round Complete!", size: 60, color: vm.questionText)
                    Spacer()
                    vm.formatText(text: "You got \(vm.numCorrect) out of \(vm.numTotal) for a score of: ", size: 25, color: vm.questionText)
                    Spacer()
                    vm.formatText(text: "\(Int(Double(vm.numCorrect)/Double(vm.numTotal)*100))%", size: 45, color: vm.questionText)
                    Spacer()
                    NavigationLink{
                        
                        MainScreenView()
                    }label: {
                        ZStack {
                            Rectangle().foregroundColor(.black)
                                .frame(width: vm.width/2+15, height: vm.height/12)
                                .cornerRadius(20)
                            HStack{
                                vm.formatText(text: "Play Again", size: 25, color: vm.answerText)
                                Image(systemName: "arrow.counterclockwise").foregroundColor(.white)
                            }
                        }
                    }
                    Spacer()
                }.onAppear {
                    vm.addToDefaults(category: category)
                }
            }
        }
    }
}

//struct FinalScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        FinalScreenView()
//    }
//}
