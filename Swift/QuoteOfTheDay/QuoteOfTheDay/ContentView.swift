//
//  ContentView.swift
//  QuoteOfTheDay
//
//  Created by Samuel Rojas on 10/25/24.
//

import SwiftUI


struct Quote: Codable {
    let quote: String
    let author: String
    
    enum CodingKeys: String, CodingKey {
        case quote = "q"
        case author = "a"
    }
}

struct ContentView: View {
    
    @State private var isHovered = false
    @State private var quoteText: String = ""
    @State private var authorText: String = ""
    
    var body: some View {
        
        Button(action: {
            
                requestQuote()
            
        }) {
            Text("Quote Of the Day")
        }
        .buttonStyle(PlainButtonStyle())
        .padding(10)
        .foregroundStyle(.white)
        .background(Color.teal)
        .border(Color.black, width: 2.5)
        .cornerRadius(5)
        .scaleEffect(isHovered ? 1.5 : 1.0)
        .onHover{ hovered in
            withAnimation(.easeInOut(duration: 0.2)){
                isHovered = hovered
            }
        }
        
        Text(quoteText)
        if !quoteText.isEmpty {
            Text("-\(authorText)")
        }
        
    }
    
    func requestQuote() {
        //Stores the endpoint into variable
        if let url = URL(string: "https://zenquotes.io/api/random"){
            //Makes a request for a URL Session in correlation with the API
            URLSession.shared.dataTask(with: url) { data, response, error in
                //Handles any error during the request
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                //Stores the raw response of the API request
                if let data = data {
                    let decoder = JSONDecoder()
                    var quoter: [Quote]? = nil
                    
                    if let jsonString = String(data: data, encoding: .utf8){
                        print("Raw JSON Response: \(jsonString)")
                    }
                    do {
                        quoter = try decoder.decode([Quote].self, from: data)
                    } catch {
                        print("Error while decoding to JSON: \(error.localizedDescription)")
                    }
                    if let firstQuote = quoter?.first {
                        print("Quote: \(firstQuote.quote)")
                        print("Author: \(firstQuote.author)")
                        
                        DispatchQueue.main.async {
                            quoteText = firstQuote.quote
                            authorText = firstQuote.author
                        }
                    }
                    print("Data received: \(data)")
                    
                }
            }.resume() // starts the request
        }
    }
}

#Preview {
    ContentView()
}
