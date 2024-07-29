//
//  AddMealModelView.swift
//  KosherMeals
//
//  Created by julie ryan on 29/07/2024.
//

import SwiftUI
import SwiftData

struct AddMealModelView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var meals: [Meal]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(meals) { meal in
                    NavigationLink {
                        Text("Item at \(meal.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(meal.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteMeal)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addMeal) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addMeal() {
        withAnimation {
            let newMeal = Meal(timestamp: Date())
            modelContext.insert(newMeal)
        }
    }

    private func deleteMeal(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(meals[index])
            }
        }
    }
}

#Preview {
    AddMealModelView()
}
