//
//  CategoryRow.swift
//  ExpenseTracker
//
//  Created by Sem Cruiming on 01/08/2024.
//

import SwiftUI
import SwiftUIFontIcon

struct CategoryRow: View {
    var category: Category
    var isSelected: Bool = false
    
    var isMain: Bool {
        category.mainCategoryId == nil
    }
    
    var body: some View {
        HStack {
            //MARK: - Category Icon
            VStack {
                RoundedRectangle(cornerRadius: 20,style: .continuous)
                    .fill(Color.icon.opacity(0.3))
                    .frame(width: isMain ? 44 : 32, height: isMain ? 44 : 32)
                    .overlay {
                        FontIcon.text(.awesome5Solid(code: category.icon), fontsize: isMain ? 24 : 16, color: Color.icon)
                }
            }
            .frame(width: 50)
            
            //MARK: - Category Name
            if isMain {
                Text(category.name)
                    .foregroundColor(.primary)
            } else {
                Text(category.name)
                    .font(.subheadline)
            }
            
            Spacer()
            
            //MARK: - Checkmark {
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 16))
                    .foregroundColor(.icon)
            }
            
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    CategoryRow(category: .billsAndUtilities, isSelected: true)
}
