//
//  SearchView.swift
//  Netflix SwiftUI
//
//  Created by Cherif, Fedy on 12/18/20.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchString: String = ""
    
    var searchData: JSON?
    var definitionsData: JSON?
    var definitionKeys: JSON?
    
    
    init() {
        
        let json = NetflixHelper.getData()
        // gets the json data
        
        searchData = json["top_searches"]
        // takes the home data
        
        definitionsData = json["definitions"]
        definitionKeys = json["definitions_key"]
        // then the definitions data
        
        
    }
    
    func createResults() -> [String] {
        // this is a function to generate the search results based on the user's search
        
        var namesCollected: [String] = []
        // creates an output array for the results
        
        let search = searchString.lowercased()
        // makes the text lowercase
        
        for i in 0..<definitionKeys!.array!.count {
            // loops through all the possible searches by their ID's
            
            var currentName = definitionsData!["\(definitionKeys![i].stringValue)"].stringValue
            // gets the name of a result based on the id
            
            if (currentName.contains("_")) {
                // checks if there are underscores in the potential result
                
                currentName = currentName.components(separatedBy: "_").joined(separator: " ")
                // replaces them with spaces instead
                
            }
            if currentName.contains(search) {
                // checks if the search contains part of the name
                
                if (currentName.contains(" ")) {
                    // checks if the result has spaces
                    
                    currentName = currentName.components(separatedBy: " ").joined(separator: "_")
                    // puts back the underscores to have the proper data format
                    
                }
                
                namesCollected.append(currentName)
                // adds it to the output
                
            }
        }
        return namesCollected
        // returns the outputs
    }
    
    var body: some View {
        
        GeometryReader { geo in
            VStack {
                VStack {
                    TextField("Search", text: $searchString)
                    .accentColor(.gray)
                    .padding(10)
                }.background(Color(red: 0.2, green: 0.2, blue: 0.2))
                .padding(10)
                .cornerRadius(15)
                .offset(x: 0, y: -10)
                
                ScrollView(.vertical) {
                    
                    if searchString.count == 0 {
                        
                        ForEach(0...((searchData?.array?.count)! - 1), id: \.self) { index in
                            HStack {
                                NavigationLink(destination: ItemDataView(title: self.definitionsData!["\(searchData![index].stringValue)"].stringValue)) {
                                    Image(uiImage: NetflixHelper.getImageFromBundle(source: definitionsData!["\(searchData![index].stringValue)"].stringValue, type: "background"))
                                        .resizable()
                                        .frame(width: 64 * 1.5, height: 36 * 1.5, alignment: .leading)
                                    Text("\(NetflixHelper.improvedTitle(definitionsData!["\(searchData![index].stringValue)"].stringValue))")
                                    Spacer()
                                    Image(systemName: "play.circle")
                                        .resizable()
                                        .frame(width: 20, height: 20, alignment: .trailing)
                                }
                            }.padding()
                        }
                        
                    } else if createResults().count > 0 {
                        
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 124))], spacing: 20) {
                            ForEach(0..<(createResults().count), id: \.self) { index in
                                // I am incredibly disapointed by the id: \.self
                                VStack {
                                    NavigationLink(destination: ItemDataView(title: createResults()[index])) {
                                        Image(uiImage: NetflixHelper.getImageFromBundle(source: createResults()[index], type: "cover"))
                                            .resizable()
                                            .frame(width: 124, height: 186, alignment: .center)
                                            .padding(2)
                                            .cornerRadius(10)
                                    }
                                }
                                //Text("\()")
                            }
                        }
                        
                    } else {
                        Text("")
                    }
                    
                }.navigationBarTitle("")
                .navigationBarHidden(true)
                .offset(x: 0, y: -20)
                .frame(width: geo.size.width, height: geo.size.height - 40, alignment: .center)
                
                Spacer()
            }
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
