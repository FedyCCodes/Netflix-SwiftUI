//
//  HomeView.swift
//  Netflix SwiftUI
//
//  Created by Cherif, Fedy on 12/18/20.
//

import SwiftUI

struct HomeView: View {
    
    var homeData: JSON?
    var definitionsData: JSON?
    var definitionKeys: JSON?
    
    init() {
        
        let json = NetflixHelper.getData()
        // gets the json data
        
        homeData = json["home"]
        // takes the home data
        
        definitionsData = json["definitions"]
        definitionKeys = json["definitions_key"]
        // then the definitions data
        
        print(homeData!["lists"][0])
        // prints the home data
        
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Image("Netflix Logo Empty")
                        .frame(width: 40, height: 40)
                    Spacer()
                    Image("Chrome Cast")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .padding(4)
                    NavigationLink(destination: SettingsView()) {
                        Image("icon-1")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                }.padding(10)
                
                .offset(x: 0, y: -20)
                ScrollView(.vertical) {
                    VStack {
                        HomeHeaderView(homeData: self.homeData, definitionsData: self.definitionsData, definitionsKeys: self.definitionKeys, geo: geo, headerDataId: Int.random(in: 0..<definitionKeys!.arrayValue.count))
                        HomeCircleListView(homeData: self.homeData, definitionsData: self.definitionsData)
                        // HOME CONTINUE WATCHING VIEW
                        HomeContinueWatchingView(homeData: self.homeData, definitionsData: self.definitionsData)
                        // HOME LIST VIEW
                        HomeListView(homeData: self.homeData, definitionsData: self.definitionsData)                        //
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
