//
//  Gameplay.swift
//  Edutainment
//
//  Created by Milosz Tabaka on 19/07/2022.
//

import Foundation
import SwiftUI

struct Gameplay: View {
    let table: Int
    let numOfQuestions: Int
    
    @State private var firstNum = 2
    
    @State private var secondNum = 2
    
    @State private var answer = 0
    
    @State private var started = false
    @State private var answered = false
    @State private var correct = false
    
    var body: some View {
        VStack {
            
            if started {
                Text("\(firstNum)*\(secondNum)")
                    .padding()
                
                if answered {
                    TextField("Enter your answer", value: $answer, format: .number)
                        .multilineTextAlignment(.center)
                        .foregroundColor(correct ? .green : .red)
                        .padding()
                } else {
                    TextField("Enter your answer", value: $answer, format: .number)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .padding()
                }
            }
            
            if !started {
                Button() {
                    started.toggle()
                    askQuestion()
                } label: {
                    Image(systemName: "play.fill")
                }
            } else if answered {
                Button() {
                    answered = false
                    askQuestion()
                } label: {
                    Text("Next")
                }
            } else {
                Button("Submit") {
                    validate()
                    answered = true
                }
            }
        }
        .font(.title)
        
        .navigationTitle("Gameplay")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func askQuestion() {
        firstNum = Int.random(in: 2...table)
        secondNum = Int.random(in: 2...12)
        answer = 0
    }
    
    func validate() {
        correct = firstNum * secondNum == answer
    }
}

struct Gameplay_Previews: PreviewProvider {
    static var previews: some View {
        Gameplay(table: 5, numOfQuestions: 10)
    }
}

