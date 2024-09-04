//
//  ContentView.swift
//  MyProfile
//
//  Created by admin on 14/6/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @State var showSheet:Bool = false
    
    @StateObject var cake1 = CakeItem(isCheck: false, cakeImage: "cake1", cakeName: "Straberry", price: 10, calories: 100)
    @StateObject var cake2 = CakeItem(isCheck: false, cakeImage: "cake2", cakeName: "Straberry", price: 20, calories: 200)
    @StateObject var cake3 = CakeItem(isCheck: false, cakeImage: "cake3", cakeName: "Straberry", price: 30, calories: 300)
    
    @State var cakeCollection: [CakeItem] = []
    

    
//    @StateObject var todoItem1 = TodoItem()
//    @StateObject var todoItem2 = TodoItem()
    var body: some View {
        ZStack {
            Color("Color22")
                .ignoresSafeArea()
            VStack{
                
                HStack{
                    Image("cake")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 70)
                    Spacer()
                    Text("HOME CAKE")
                        .fontDesign(.rounded)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    
                    
                }.padding()
                Divider()
                HStack{
                    Spacer()
                    Text("Next to summary price and calories. ")
                        .fontWeight(.bold)
                        .font(.caption)
                    Image("Cart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 30)
                        .onTapGesture {
                            showSheet.toggle()
                        }
                }.padding()
                Spacer()
                VStack {
                    ForEach(cakeCollection) { cake in
                        ZStack {
                            Rectangle()
                                .foregroundStyle(.gray)
                                .opacity(0.1)
                                .cornerRadius(40)
                            HStack {
//                                Button(action: {}, label: {
//                                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
//                                })
                                Image(systemName: cake.isCheck ?"checkmark.circle.fill" : "circle" )
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color.red)
                                    .onTapGesture {
                                        cake.isCheck.toggle()
                                        print(cake.isCheck)
                                        print("asas")
                                    }.padding()
                                Image(cake.cakeImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth:120)
                                Spacer()
                                VStack(alignment: .leading){
                                    Text("Name : \(cake.cakeName)")
                                    Text("Price : \(cake.price)")
                                    Text("Calories :\(cake.calories)")
                                }
                                Spacer()
                            }
                            .padding()
                        }.padding()
                        Spacer()
                    }
                }
            }
        }
        .sheet(isPresented: $showSheet, content: {
            TotalSheet(cakeCollection: cakeCollection)
        })
        .onAppear{
            cakeCollection.insert(cake1, at: 0)
            cakeCollection.insert(cake2, at: 1)
            cakeCollection.insert(cake3, at: 2)
        }
    }
    
}

//#Preview {
//    ContentView()
//}
