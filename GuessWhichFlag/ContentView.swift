//
//  ContentView.swift
//  GuessWhichFlag
//
//  Created by shashant on 04/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var coutries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoretitle = ""
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                    Text(verbatim: coutries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                }.foregroundColor(.white)
                
                ForEach(0..<3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.coutries[number].lowercased())
                            .renderingMode(.original)
                            .cornerRadius(10)
                            .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 0.0)
                    }
                }
                Spacer()
            }
        }.alert(isPresented: $showingScore, content: {
            Alert(title: Text(scoretitle), message: Text("Your Score is ???"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        })
    
       
    }
    
    func flagTapped(_ number: Int) {
        if (number == correctAnswer) {
            scoretitle = "Correct"
        } else {
            scoretitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        coutries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
