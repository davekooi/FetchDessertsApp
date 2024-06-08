//
//  MealDetailsViewModel.swift
//  FetchDessertCodingChallenge
//
//  Created by David Kooistra on 6/7/24.
//

import Foundation

class MealDetailsViewModel: ObservableObject {
    @Published var mealDetails: MealDetails? = nil
    @Published var errorMessage: String?
    
    private let service = MealDataService()
    
    // Fetch the meal details (e.g. ingredients, instructions, etc.)
    @MainActor
    func fetchMealDetails(mealId: String) async throws {
        let result = try await service.fetchMealDetails(mealId: mealId)
        
        switch result {
        case .success(let mealDetailsData):
            self.mealDetails = mealDetailsData
        case .failure(let error):
            print("DEBUG error fetching meal details: \(error.localizedDescription)")
            self.errorMessage = "Error fetching meal details"
        }
    }
}
