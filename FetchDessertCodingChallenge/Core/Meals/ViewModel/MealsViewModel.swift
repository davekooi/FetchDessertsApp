//
//  DessertsViewModel.swift
//  FetchDessertCodingChallenge
//
//  Created by David Kooistra on 6/7/24.
//

import Foundation

class MealsViewModel: ObservableObject {
    @Published var meals: [Meal]?
    @Published var errorMessage: String?
    
    private let service = MealDataService()
    
    // Fetch the list of meals associated with the 'category'.
    // Returns an error if request fetch fails.
    @MainActor
    func fetchMeals(category: String) async throws {
        let result = try await service.fetchMeals(category: category)
        
        switch result {
        case .success(let mealsData):
            self.meals = mealsData
        case .failure(let error):
            print("DEBUG \(error.localizedDescription)")
            self.errorMessage = "Error fetching meals"
        }
    }
}
