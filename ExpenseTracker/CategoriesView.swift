//
//  CategoriesView.swift
//  ExpenseTracker
//
//  Created by Sem Cruiming on 01/08/2024.
//

import SwiftUI

struct CategoriesView: View {
    var transaction: Transaction
    @EnvironmentObject var transactionListVM: TransactionListViewModel

    var body: some View {
        List {
            ForEach(Category.categories) { category in
                CategorySection(category: category, transaction: transaction)
                    .environmentObject(transactionListVM)
            
            }
        }
        .listStyle(.plain)
        .navigationTitle("Category")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CategorySection: View {
    var category: Category
    var transaction: Transaction
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        Section {
            // Subcategories
            ForEach(category.subcategories ?? []) { subcategory in
                let isSelected = transaction.categoryId == subcategory.id
                
                CategoryRow(category: subcategory, isSelected: isSelected)
                    .onTapGesture {
                        transactionListVM.updateCategory(transaction: transaction, category: subcategory)
                        dismiss()
                    }
            }
        } header: {
            // Categories
            let isSelected = transaction.categoryId == category.id
            
            CategoryRow(category: category, isSelected: isSelected)
                .onTapGesture {
                    transactionListVM.updateCategory(transaction: transaction, category: category)
                    dismiss()
                }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CategoriesView(transaction: transactionPreviewData)
                .environmentObject(TransactionListViewModel())
        }
    }
}
