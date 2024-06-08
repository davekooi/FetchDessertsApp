//
//  DessertsViewModel.swift
//  FetchDessertCodingChallenge
//
//  Created by David Kooistra on 6/7/24.
//

import Foundation

class MealsViewModel: ObservableObject {
    @Published var meals = [Meal]()
    @Published var errorMessage: String?
    
    private let service = MealDataService()
    
    init() {
        Task {
            try await fetchMeals(category: "Dessert")
        }
    }
    
    func fetchMeals(category: String) async throws {
        self.desserts = try await service.fetchMeals(category: category)
    }
}
