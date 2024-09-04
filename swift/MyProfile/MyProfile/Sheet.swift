//
//  ContentView.swift
//  demo
//
//  Created by admin on 15/6/2567 BE.
//

import SwiftUI

struct TotalSheet: View {
    @State var cakeCollection : [CakeItem]
    @State var total = 0
    @State var totalcal = 0
    func getTotalPrice(){
        for i in 0..<3 {
            if(cakeCollection[i].isCheck == true){
                total += cakeCollection[i].price
            }
        }
    }
    
    func getTotalCal(){
        for i in 0..<3 {
            if(cakeCollection[i].isCheck == true){
                totalcal += cakeCollection[i].calories
            }
        }
    }
    
    
    
    
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
                    
                    
                    Spacer()

                }.padding()
                Spacer()
                ZStack{
                    Rectangle()
                        .foregroundStyle(.gray)
                        .opacity(0.1)
                        .cornerRadius(40)
                        .frame(width: 130,height: 80)
                    
                    
                    VStack {
                        Text("Total price: \(total)")
                        
                    }
                }.padding()
                
                    Divider()
                ZStack{
                    Rectangle()
                        .foregroundStyle(.gray)
                        .opacity(0.1)
                        .cornerRadius(40)
                        .frame(width: 200,height: 80)
                    VStack{
                        Text("Total calories: \(totalcal)")
                    }
                }.padding()
                Spacer()
                .onAppear{
                    getTotalPrice()
                    getTotalCal()
                }
            }
        }
    }
}
//#Preview {
//    ContentView()
//}
