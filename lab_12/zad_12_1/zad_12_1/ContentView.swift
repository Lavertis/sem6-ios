//
//  ContentView.swift
//  zad_12_1
//
//  Created by Rafał Kuźmiczuk on 08/05/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var dbContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Book.title, ascending: true)], animation: .default)
    private var books: FetchedResults<Book>
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \BookGenre.name, ascending: true)], animation: .default)
    private var bookGenres: FetchedResults<BookGenre>
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var publishYear: String = ""
    @State private var publisher: String = ""
    @State private var stars: Int16 = 5
    @State private var bookGenre: BookGenre?
    
    @State private var pickerId: Int = 0
    
    var body: some View {
        VStack {
            Text("Books").padding(.top)
            Group {
                HStack {
                    Text("Title")
                    TextField("title", text: $title)
                }
                HStack {
                    Text("Author")
                    TextField("author", text: $author)
                }
                HStack {
                    Text("Publisher")
                    TextField("publisher", text: $publisher)
                }
                HStack {
                    Text("Publish year")
                    TextField("year", text: $publishYear)
                }
                HStack {
                    Text("Stars")
                    Picker(selection: $stars, label: Text("Stars")) {
                        ForEach(1...5, id: \.self) { (number: Int16) in
                            Text(String(number)).tag(number)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Picker(selection: $bookGenre, label: Text("Genre")) {
                    ForEach(bookGenres, id: \.self) { (bookGenre: BookGenre) in
                        Text(bookGenre.name!).tag(bookGenre as BookGenre?)
                    }
                }
                .id(pickerId)
                .onAppear {
                    self.bookGenre = self.bookGenres.first
                }
                Button(action: addBook) {
                    Text("Add book")
                }
                
                if (bookGenres.count == 0) {
                    Button(action: {
                        self.addBookGenres()
                        self.pickerId = self.pickerId + 1
                    }) {
                        Text("Add genres")
                    }.padding(.top)
                }
            }.padding(.horizontal)
            
            List {
                ForEach(bookGenres, id: \.self) { bookGenre in
                    Section(header: Text(bookGenre.name!)) {
                        ForEach(bookGenre.books, id: \.self) { book in
                            VStack(alignment: .leading) {
                                Text("Title: \(book.title!)")
                                Text("Author: \(book.author!)")
                                Text("Publish year: \(String(book.publishYear))")
                                Text("Publisher: \(book.publisher!)")
                                Text("Stars: \(book.stars)")
                            }
                        }.onDelete(perform: self.deleteBook)
                    }
                }
            }
        }
    }
    
    private func addBook() {
        let book = Book(context: dbContext)
        book.title = title
        book.author = author
        book.publishYear = Int16(publishYear) ?? 0
        book.publisher = publisher
        book.stars = stars
        book.genre = bookGenre
        
        do {
            try dbContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    private func deleteBook(offsets: IndexSet) {
        withAnimation {
            offsets.map { books[$0] }.forEach(dbContext.delete)
            do {
                try dbContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func addBookGenres() {
        let bookGenre1 = BookGenre(context: dbContext)
        bookGenre1.name = "Comedy"
        
        let bookGenre2 = BookGenre(context: dbContext)
        bookGenre2.name = "Crime fiction"
        
        let bookGenre3 = BookGenre(context: dbContext)
        bookGenre3.name = "Drama"
        
        let bookGenre4 = BookGenre(context: dbContext)
        bookGenre4.name = "Sensation"
        
        do {
            try dbContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
