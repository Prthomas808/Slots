//
//  ContentView.swift
//  Slots
//
//  Created by Tico Thomas on 2/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var slot1 = "apple"
    @State var slot2 = "apple"
    @State var slot3 = "apple"
    @State var score = 1000
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.green]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
            .ignoresSafeArea()
            VStack{
                
                Text("SLOTS")
                    .font(.system(size: 40))
                    .foregroundColor(Color.white)
                    .padding(.top, 20.0)
                
                Spacer()
                
                Text("Credits: " + String(score))
                    .font(.title)
                
                Spacer()
                
                HStack{
                    Image(slot1)
                        .resizable()
                    Image(slot2)
                        .resizable()
                    Image(slot3)
                        .resizable()
                }
                .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                VStack {
                    
                    
                    Button("Spin", action: {
                        
                        let spot1 = ["apple", "cherry", "star"][Int.random(in: 0...2)]
                        let spot2 = ["apple", "cherry", "star"][Int.random(in: 0...2)]
                        let spot3 = ["apple", "cherry", "star"][Int.random(in: 0...2)]
                        
                        slot1 = spot1
                        slot2 = spot2
                        slot3 = spot3
                        
                        if slot1 == slot2 && slot1 == slot3 {
                            score += 50
                        } else if slot1 == slot2 || slot1 == slot3 || slot2 == slot3 {
                            score += 25
                        } else {
                            score -= 100
                        }
                        
                    })
                    .padding(/*@START_MENU_TOKEN@*/.all, 16.0/*@END_MENU_TOKEN@*/)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                                        
                    Button("Reset") {
                        score = 1000
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all, 16.0/*@END_MENU_TOKEN@*/)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                }
                
                Spacer()
                
                VStack{
                    Text("Match 3 and Score 50 Points")
                    Text("Match 2 and Score 25 Points")
                    Text("Match 0 and Lose 100 Points")
                }
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
