//
//  MealDataService.swift
//  FetchDessertCodingChallenge
//
//  Created by David Kooistra on 6/7/24.
//

import Foundation

class MealDataService {
    func fetchDesserts() async throws -> [Meal] {
        let dessertsUrlString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        guard let url = URL(string: dessertsUrlString) else { return [] }
        
        do {
            let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
            let mealsResponse = try JSONDecoder().decode(MealsResponse.self, from: data)
            return mealsResponse.meals
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
            return []
        }
    }
    
    func fetchMealDetails(mealId: Int) async throws -> MealDetails? {
        let mealDetailsUrlString = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)"
        guard let url = URL(string: mealDetailsUrlString) else { return nil }
        do {
            let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
            let mealDetailsResponse = try JSONDecoder().decode(MealDetailsResponse.self, from: data)
            return mealDetailsResponse.meals[0]
        } catch {
            print("DEBUG: Error \(error.localizedDescription)")
            return nil
        }
    }
}
