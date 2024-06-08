//
//  DessertsView.swift
//  FetchDessertCodingChallenge
//
//  Created by David Kooistra on 6/7/24.
//

import SwiftUI

// Displays a list of meals alphabetically for the 'category'
// and shows the 'title' at the top of the list. List items
// are tappable to navigate to the recipe for that meal.
struct MealsView: View {
    let category: String
    let title: String
    @StateObject var viewModel = MealsViewModel()
    let imageDimension: CGFloat = 60
    
    var body: some View {
        Group {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
            }
            else if let meals = viewModel.meals {
                NavigationStack {
                    List {
                        ForEach(meals) { meal in
                            NavigationLink(value: meal) {
                                MealCell(meal: meal)
                            }
                        }
                    }
                    .navigationTitle(title)
                    .navigationDestination(for: Meal.self) { meal in
                        MealDetailsView(mealId: meal.id)
                            .navigationTitle("Recipe")
                            .toolbarTitleDisplayMode(.inline)
                    }
                }
            } else {
                ProgressView()
                    .onAppear {
                        Task {
                            try await viewModel.fetchMeals(category: category)
                        }
                    }
            }
        }
    }
}

#Preview {
    MealsView(category: "Dessert", title: "Desserts")
}
