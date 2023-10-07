//
//  PresentFunctions.swift
//  Netflix SwiftUI
//
//  Created by C, Fedy on 1/9/21.
//

import UIKit

class NetflixHelper {

    static var myList: [String] = []
    // this is a list for the user to choose their shows
    
    static func toggleItemMyList(_ name: String) {
        // this is a function to toggle an item in an array
        
        if myList.contains(name) {
            // checks that the item is in
            
            myList.remove(at: myList.firstIndex(of: name)!)
            // removes the item
            
        } else {
            // checks if the item is not in the list
            
            myList.append(name)
            // adds the item to the list
            
        }
        
    }
    
    static var appJSONData: JSON = JSON([:])
    // this is a cache for the json application data
    
    static func getData() -> JSON {
        // this is a function to extract the json data of the app
        
        let url = Bundle.main.url(forResource: "data", withExtension: "json")
        // gets the url of the json file
        
        do {
            let jsonData = try String(contentsOfFile: url!.path)
            // gets the string of the json data
            
            appJSONData = try JSON(data: jsonData.data(using: .utf8)!)
            // gets the json data
            
        } catch {
            
            print(error)
            // prints the error if it was unable to receive the data
            
        }
        
        return appJSONData
        // returns the app json data
        
    }

    static func getImageFromBundle(source: String, type: String) -> UIImage {
        // creates a function to get the image
        
        print(source)
        
        let url = Bundle.main.bundleURL
            // from the main app bundle
            
            .appendingPathComponent("data", isDirectory: true)
            // in the folder path
            
            .appendingPathComponent(source, isDirectory: true)
            // based on the name of the movie
            
            .appendingPathComponent(type)
            // and then the type of image (of exclusive type "cover", "title", or "background")
            .appendingPathExtension("png")
        
        return UIImage(contentsOfFile: url.path)!
        // returns the ui image
    }

    static func improvedTitle(_ str: String) -> String{
        // uses a function to convert the data name into a cleaner name
        
        var returnArray: [String] = []
        // creates an array to modify the title
        
        let stringArray = str.components(separatedBy: "_")
        // splits all the words with the underscore
        
        for string in stringArray {
            // loops through each word
            
            returnArray.append(string.prefix(1).capitalized + string.dropFirst())
            // adds the words but capitalizes the first letter
            
        }
        
        return returnArray.joined(separator: " ")
        // returns the text with spaces
    }

}
