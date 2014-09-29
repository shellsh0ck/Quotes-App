//  ViewController.swift
//  Quotes App
//
//  Created by Vitaly Sulimov on 2014-09-29.
//  Copyright (c) 2014 Vitaly Sulimov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var showQuoteButton: UIButton!
  
    
    let quotesLibrary = QuotesLibrary()
    let colors = Colors()


// Struct Colors contain array of colors for UI
    struct Colors {
        let colorsArray = [
            UIColor(red: 90/255.0, green: 187/255.0, blue: 181/255.0, alpha: 1.0), //teal color
            UIColor(red: 222/255.0, green: 171/255.0, blue: 66/255.0, alpha: 1.0), //yellow color
            UIColor(red: 223/255.0, green: 86/255.0, blue: 94/255.0, alpha: 1.0), //red color
            UIColor(red: 239/255.0, green: 130/255.0, blue: 100/255.0, alpha: 1.0), //orange color
            UIColor(red: 77/255.0, green: 75/255.0, blue: 82/255.0, alpha: 1.0), //dark color
            UIColor(red: 105/255.0, green: 94/255.0, blue: 133/255.0, alpha: 1.0), //purple color
            UIColor(red: 85/255.0, green: 176/255.0, blue: 112/255.0, alpha: 1.0), //green color
        ]
        
        // Function to get random color from array
        func randomColor() -> UIColor {
            var unsignedArrayCount = UInt32(colorsArray.count)
            var unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
            var randomNumber = Int(unsignedRandomNumber)
            
            return colorsArray[randomNumber]
        }
    }
    

// Function updateView - Call function getQuote and change label's text
    func updateView() {
        let recievedQuote = quotesLibrary.getQuote()
        var recievedColors = colors.randomColor()
        view.backgroundColor = recievedColors
        self.showQuoteButton.tintColor = recievedColors
        self.authorLabel.text = ("\(recievedQuote.author) said:")
        self.quoteLabel.text = recievedQuote.quoteText
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func showQuoteButtonAction() {
        updateView()
    }

}

