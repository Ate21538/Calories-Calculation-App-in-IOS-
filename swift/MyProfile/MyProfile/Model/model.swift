//
//  model.swift
//  MyProfile
//
//  Created by admin on 15/6/2567 BE.
//
import Foundation
import SwiftUI


class CakeItem: Identifiable, ObservableObject {
    
    let id = UUID()
    @Published var isCheck: Bool = false
    @Published var cakeImage: String
    @Published var cakeName: String
    @Published var price: Int
    @Published var calories: Int
    
    init(isCheck: Bool, cakeImage: String, cakeName: String, price: Int, calories: Int) {
        self.isCheck = isCheck
        self.cakeImage = cakeImage
        self.cakeName = cakeName
        self.price = price
        self.calories = calories
    }
    
}

