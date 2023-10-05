//
//  NetflixHelper.myListView.swift
//  Netflix SwiftUI
//
//  Created by Cherif, Fedy on 6/24/23.
//

import SwiftUI

struct MyListView: View {
    // This is the view that shows all the different tiles that were selected to be in the list.
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    
                    ScrollView(.vertical) {
                        
                        if NetflixHelper.myList.count > 0 {
                            
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 124))], spacing: 20) {
                                ForEach(0..<(NetflixHelper.myList.count), id: \.self) { index in
                                    
                                    VStack {
                                        NavigationLink(destination: ItemDataView(title: NetflixHelper.myList[index])) {
                                            Image(uiImage: NetflixHelper.getImageFromBundle(source: NetflixHelper.myList[index], type: "cover"))
                                                .resizable()
                                                .frame(width: 124, height: 186, alignment: .center)
                                                .padding(2)
                                                .cornerRadius(10)
                                        }
                                    }
                                    
                                }
                            }
                            
                        } else {
                            Text("You have nothing in your list :(")
                        }
                        
                    }.navigationBarTitle("My List")
                    // sets the navigation title as "My List"
                    
                    .background(Color.black)
                    // gives a black background
                    
                    .offset(x: 0, y: -20)
                    .frame(width: geo.size.width, height: geo.size.height - 40, alignment: .center)
                }
            }
        }
    }
}

struct MyListView_Previews: PreviewProvider {
    static var previews: some View {
        MyListView()
    }
}
