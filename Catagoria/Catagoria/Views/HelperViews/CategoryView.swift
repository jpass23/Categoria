//
//  CategoryView.swift
//  Catagoria
//
//  Created by Jaden Passero on 11/12/22.
//

import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    let name: String
}

struct CategoryRow: View {
    @ObservedObject var vm: MainScreenViewModel
    var category: Category
    @Binding var showPopover: Bool

    var body: some View {
        Button {
            vm.category = category.name
            vm.apiRequest()
            showPopover = false
        } label: {
            Text(category.name)
                .font(.system(size: 20, weight: .heavy, design: .rounded))
            
        }
    }
}

struct CategoryView: View {
    @ObservedObject var vm: MainScreenViewModel
    @Binding var showPopover: Bool
    @State var selectedCategory = "General Knowledge"

    let categories = [
        Category(name: "General Knowledge"),
        Category(name: "Books"),
        Category(name: "Film"),
        Category(name: "Music"),
        Category(name: "Musicals & Theater"),
        Category(name: "Television"),
        Category(name: "Video Games"),
        Category(name: "Board Games"),
        Category(name: "Science & Nature"),
        Category(name: "Computers"),
        Category(name: "Mathematics"),
        Category(name: "Mythology"),
        Category(name: "Sports"),
        Category(name: "Geography"),
        Category(name: "History"),
        Category(name: "Politics"),
        Category(name: "Art"),
        Category(name: "Celebrities"),
        Category(name: "Animals"),
        Category(name: "Vehicles"),
        Category(name: "Comics"),
        Category(name: "Gadgets"),
        Category(name: "Anime & Manga"),
        Category(name: "Cartoons & Animations"),
    ]

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("Category List")
                    .font(.system(size: 40, weight: .heavy, design: .rounded))
                    .bold()
                    .font(.largeTitle)
                    .font(.headline)
            
                Spacer()

                List(categories) { category in
                    CategoryRow(vm: vm, category: category, showPopover: $showPopover)
                }
            }

            // Use vm.categories for the list of categories to display. Set vm.category to the category that the user chooses. Set vm.numQuestions to the number of questions. It should atomatically update the other view. Call vm.apiRequest() once they have made their selections.
            // vm.mainColor will be the same background color as the rest of the app

            // MARK: Tester button

            // Should be removed but it allows for testing
//            Button {
//                vm.category = "General Knowledge"
//                vm.numQuestions = 5
//                vm.apiRequest()
//                showPopover.toggle()
//            } label: {
//                Text("example")
//            }
        }
    }
}

// struct CategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryView()
//    }
// }
