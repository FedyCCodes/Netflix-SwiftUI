//
//  ComingSoonView.swift
//  Netflix SwiftUI
//
//  Created by C, Fedy on 12/18/20.
//

import SwiftUI

struct ComingSoonView: View {
    
    var comingSoonData: JSON?
    var definitionsData: JSON?
    var definitionKeys: JSON?
    
    init() {
        
        let json = NetflixHelper.getData()
        // gets the json data
        
        comingSoonData = json["comming_soon"]
        // gets the data for coming soon
        
        definitionsData = json["definitions"]
        definitionKeys = json["definitions_key"]
        // then the definitions data
            
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Coming Soon")
                    .bold()
                    .font(.system(size: 30))
                    .frame(height: 40)
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
            .offset(x: 0, y: -10)
            ScrollView(.vertical) {
                ForEach(0..<(comingSoonData?.array!.count)!, id: \.self) { index in
                    VStack {
                        VStack {
                            Image(uiImage: NetflixHelper.getImageFromBundle(source: definitionsData!["\(comingSoonData![index].stringValue)"].stringValue, type: "background"))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }.frame(height: 300)
                        VStack {
                            HStack {
                                Image(uiImage: NetflixHelper.getImageFromBundle(source: definitionsData!["\(comingSoonData![index].stringValue)"].stringValue, type: "title"))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Spacer()
                                VStack {
                                    Image(systemName: "bell")
                                        .resizable()
                                        .frame(width: 20, height: 20, alignment: .center)
                                    Text("Remind Me")
                                        .font(.system(size: 10))
                                }.padding()
                                NavigationLink(destination: ItemDataView(title: self.definitionsData!["\(comingSoonData![index].stringValue)"].stringValue)) {
                                    
                                    VStack {
                                        Image(systemName: "info.circle")
                                            .resizable()
                                            .frame(width: 20, height: 20, alignment: .center)
                                        Text("Info")
                                            .font(.system(size: 10))
                                    }.padding()
                                }
                            }.frame(height: 60)
                            VStack {
                                HStack {
                                    Text("\(NetflixHelper.improvedTitle("\(definitionsData!["0017"].stringValue)"))")
                                        .fontWeight(.bold)
                                        .font(.title)
                                    Spacer()
                                }
                                Text("Movie information: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.")
                                    .lineLimit(nil)
                                    .foregroundColor(Color.gray)
                                    .multilineTextAlignment(.leading)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }.padding()
                    }
                }
            }.navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct ComingSoonView_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonView()
    }
}
