//
//  HomeCircleListView.swift
//  Netflix SwiftUI
//
//  Created by Cherif, Fedy on 1/3/21.
//

import SwiftUI

struct HomeCircleListView: View {
    // This view is the part where there are some suggestions that are circled in a horizontal scroll view.
    
    var homeData: JSON?
    var definitionsData: JSON?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach((0...(self.homeData!["circle_lists"].array!.count) - 1), id: \.self) { index in
                    NavigationLink(destination: ItemDataView(title: self.definitionsData!["\(self.homeData!["circle_lists"][index].stringValue)"].stringValue)) {
                        VStack {
                            VStack {
                                Image(uiImage: NetflixHelper.getImageFromBundle(source: "\(self.definitionsData!["\(self.homeData!["circle_lists"][index].stringValue)"].stringValue)", type: "background"))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            }.frame(width: 128, height: 128, alignment: .center)
                            .cornerRadius(64)
                            .shadow(color: Color.gray, radius: 4, x: 0, y: 0)
                            
                            VStack {
                                
                                Image(uiImage: NetflixHelper.getImageFromBundle(source: "\(self.definitionsData!["\(self.homeData!["circle_lists"][index].stringValue)"].stringValue)", type: "title"))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }.frame(width: 128, height: 64, alignment: .center)
                            .offset(x: 0, y: -32)
                            
                        }.padding()
                    }
                }
            }
        }
    }
}

struct HomeCircleListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCircleListView()
    }
}
