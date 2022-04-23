//
//  ContentView.swift
//  FlagsGame
//
//  Created by Vitaly Gromov on 4/22/22.
//

import SwiftUI

struct ContentView: View {
    @State private var countriesArray = ["Argentina", "Bangladesh", "Brazil", "Canada", "Germany", "Greece", "Russia", "Sweden", "UK", "USA"].shuffled()
    @State private var randomPoint = Int.random(in: 0...2)
    @State private var alert = false
    @State private var alertTitle: String = ""
    @State private var counter: Int = 0
    func checkAnswer(answer: Int){
        if answer == randomPoint {
            alertTitle = "Correct!"
            counter += 1
        } else {
            alertTitle = "Incorrect!"
            counter -= 1
        }
    }
    func setRandom(){
        randomPoint = Int.random(in: 0...2)
    }
    var body: some View {
        NavigationView {
           ZStack {
            LinearGradient(colors: [.green, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text("Choose the flag of:").font(.headline)
                //Text("\(randomPoint)")
                Text("\(countriesArray[randomPoint])").font(.largeTitle).padding()
                VStack {
                    ForEach(0..<3) { i in
                            Image(countriesArray[i])
                            .resizable()
                            .frame(width: 250, height: 150)
                            .scaledToFill()
                            .onTapGesture {
                               checkAnswer(answer: i)
                                alert = true
                            }
                    }.padding()
                }.alert(alertTitle, isPresented: $alert, actions: {
                    Button("Next", action: {
                        countriesArray.shuffle()
                        setRandom()
                        
                    })
                }, message: {})
            }
           
           }.navigationTitle("Total Score: \(counter)")
           
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
