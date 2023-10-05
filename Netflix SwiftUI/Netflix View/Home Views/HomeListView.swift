//
//  HomeListView.swift
//  Netflix SwiftUI
//
//  Created by Cherif, Fedy on 12/24/20.
//

import SwiftUI

struct HomeListView: View {
    // This is the section that displays all the different categories for the different titles in the home screen application.
    
    var homeData: JSON?
    var definitionsData: JSON?
    
    var body: some View {
        VStack {
            ForEach((0...(self.homeData!["lists"].array!.count) - 1), id: \.self) { index in
                VStack {
                    HStack {
                        Text("\(self.homeData!["lists"][index]["type"].stringValue)")
                            .foregroundColor(.white)
                            .bold()
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0...((self.homeData!["lists"][index]["data"].array ?? [0])!.count - 1), id: \.self) { index2 in
                                NavigationLink(destination: ItemDataView(title: self.definitionsData!["\(self.homeData!["lists"][index]["data"][index2].stringValue)"].stringValue)) {
                                    Image(uiImage: NetflixHelper.getImageFromBundle(source: "\(self.definitionsData!["\(self.homeData!["lists"][index]["data"][index2].stringValue)"].stringValue)", type: "cover"))
                                        .resizable()
                                        .frame(width: 124, height: 186, alignment: .center)
                                        .padding(2)
                                        .cornerRadius(10)
                                }
                                
                            }
                            Spacer()
                        }
                    }
                }.padding()
            }
        }

    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView()
    }
}
