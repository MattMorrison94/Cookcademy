//
//  ContentView.swift
//  Cookcademy
//
//  Created by Matthew Morrison on 8/4/24.
//

import SwiftUI

struct RecipesListView: View {
    @StateObject var recipeData = RecipeData()
    var body: some View {
        List {
            ForEach(recipeData.recipes) { recipe in
                NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
            }
        }
        .navigationTitle(navigationTitle)
    }
}

extension RecipesListView {
    var recipes: [Recipe] {
        recipeData.recipes
    }
    
    var navigationTitle: String {
        "All Recipes"
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RecipesListView()
        }
    }
}
