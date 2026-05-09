//
//  ViewController.swift
//  Bibliotecalds
//
//  Created by José Alberto Rocha Munguía on 25/02/26.
//

import SwiftUI

struct Book {
    let title: String
    let author: String
    let year: String
    let imageName: String
}

struct ContentView: View {
    
    @Environment(\.verticalSizeClass) var sizeClass
    
    let books = [
        Book(title: "The Art of Computer Programming", author: "Donald Knuth", year: "1968", imageName: "libro1"),
        Book(title: "Structure and Interpretation of Computer Programs", author: "Harold Abelson & Gerald Jay Sussman", year: "1985", imageName: "libro2"),
        Book(title: "Algorithms", author: "Robert Sedgewick & Kevin Wayne", year: "2011", imageName: "libro3"),
        Book(title: "Artificial Intelligence: A Modern Approach", author: "Stuart Russell & Peter Norvig", year: "1995", imageName: "libro4"),
        Book(title: "Deep Learning", author: "Ian Goodfellow, Yoshua Bengio & Aaron Courville", year: "2016", imageName: "libro5"),
        Book(title: "Programming Pearls", author: "Jon Bentley", year: "1986", imageName: "libro6"),
        Book(title: "Operating Systems: Three Easy Pieces", author: "Remzi & Andrea Arpaci-Dusseau", year: "2014", imageName: "libro7"),
        Book(title: "Computer Networks", author: "Andrew S. Tanenbaum", year: "1981", imageName: "libro8"),
        Book(title: "Compilers: Principles, Techniques, and Tools", author: "Aho, Lam, Sethi & Ullman", year: "1986", imageName: "libro9"),
        Book(title: "Introduction to Machine Learning", author: "Ethem Alpaydin", year: "2004", imageName: "libro10")
    ]

    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // TÍTULO PRINCIPAL
                Text(" Biblioteca de Software")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(sizeClass == .compact ? .white : .black)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 10)
                
                ForEach(books.indices, id: \.self) { index in
                    
                    HStack {
                        Image(books[index].imageName)
                            .resizable()
                            .frame(width: 100, height: 130)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text(books[index].title)
                                .font(.headline)
                                .foregroundColor(sizeClass == .compact ? .white : .black)
                            
                            Text("Autor: \(books[index].author)")
                                .bold()
                                .foregroundColor(sizeClass == .compact ? .white : .black)
                            
                            Text("Año: \(books[index].year)")
                                .italic()
                                .foregroundColor(sizeClass == .compact ? .white : .black)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
        .background(Color.red.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    ContentView()
}
