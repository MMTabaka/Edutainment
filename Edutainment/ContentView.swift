//
//  ContentView.swift
//  Edutainment
//
//  Created by Milosz Tabaka on 19/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var table: Int = 5
    @State private var questionsSelection: Int = 5
    
    let questions = [5, 10, 15, 20]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Stepper("\(table)", value: $table, in: 2...12)
                } header: {
                    Text("Tables up to")
                }
                Section {
                    Picker("Number of Questions", selection: $questionsSelection) {
                        ForEach(questions, id: \.self) { num in
                            Text("\(num)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Number of Questions")
                }
            
            
                NavigationLink(destination: Gameplay(table: table, numOfQuestions: questionsSelection)) {
                    Image(systemName: "play.fill")
                        .font(.title)
                        .foregroundColor(.blue)
                        .padding()
                }
            }
            .navigationTitle("Multiplication")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
