//
//  MealDataService.swift
//  FetchDessertCodingChallenge
//
//  Created by David Kooistra on 6/7/24.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case requestFailed
}

class MealDataService {
    
    // Fetch the meals for a given 'category' and send back an error
    // if the request fails.
    func fetchMeals(category: String) async throws -> Result<[Meal], Error> {
        let mealsUrlString = "https://themealdb.com/api/json/v1/1/filter.php?c=\(category)"
        guard let url = URL(string: mealsUrlString) else { return .failure(NetworkError.badURL) }
        
        do {
            let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
            let mealsResponse = try JSONDecoder().decode(MealsResponse.self, from: data)
            return .success(mealsResponse.meals)
        } catch {
            print("DEBUG: Error in fetch Meals \(error.localizedDescription)")
            return .failure(NetworkError.requestFailed)
        }
    }
    
    // Fetch the meal details for a given 'mealId' and send back an error
    // if the request fails.
    func fetchMealDetails(mealId: String) async throws -> Result<MealDetails, Error> {
        let mealDetailsUrlString = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)"
        guard let url = URL(string: mealDetailsUrlString) else { return .failure(NetworkError.badURL) }
        do {
            let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
            let mealDetailsResponse = try JSONDecoder().decode(MealDetailsResponse.self, from: data)
            return .success(mealDetailsResponse.meals[0])
        } catch {
            print("DEBUG: Error in fetch meal details \(error.localizedDescription)")
            return .failure(NetworkError.requestFailed)
        }
    }
}
