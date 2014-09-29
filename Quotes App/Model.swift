//
//  Model.swift
//  Quotes App
//
//  Created by Vitaly Sulimov on 2014-09-29.
//  Copyright (c) 2014 Vitaly Sulimov. All rights reserved.
//

import Foundation

// Struct for quote, contains fields author and quote text.
struct Quote {
    
    let author: String
    let quoteText: String
    
// Init function called every time when created inscance of Quote
    init(Author: String, Text: String) {
        self.author = Author
        self.quoteText = Text
    }
}


// Data collection - Array with instances of Quote
struct QuotesLibrary {
    let quotesArray = [Quote(Author: "Wilson Mizner", Text: "The only sure thing about luck is that it will change."),
                       Quote(Author: "Donald Trump", Text: "Everything in life is luck."),
                       Quote(Author: "Mark Twain", Text: "Name the greatest of all inventors.  Accident."),
                       Quote(Author: "Slovakian Proverb", Text: "Pure water is the world’s first and foremost medicine."),
                       Quote(Author: "John Florio", Text: "Praise the sea; on shore remain.")]
    
    // Function to get random quote from array
    func getQuote() -> Quote {
        var unsignedArrayCount = UInt32(quotesArray.count)
        var unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        var randomNumber = Int(unsignedRandomNumber)
        
        return quotesArray[randomNumber]
    }
}


