//
//  DownloadView.swift
//  Netflix SwiftUI
//
//  Created by C, Fedy on 12/18/20.
//

import SwiftUI

struct DownloadView: View {
    
    var downloadData: JSON?
    var definitionsData: JSON?
    var definitionKeys: JSON?
    
    init() {
        
        let json = NetflixHelper.getData()
        // gets the json data
        
        downloadData = json["downloads"]
        // gets the data for coming soon
        
        definitionsData = json["definitions"]
        definitionKeys = json["definitions_key"]
        // then the definitions data
            
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Text("My Downloads")
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
                    VStack {
                        VStack {
                            HStack {
                                Image(systemName: "info.circle")
                                Text("Smart Downloads")
                                Button("OFF", action: {})
                                        .foregroundColor(.blue)
                                Spacer()
                            }.padding(10)
                        }
                        .background(Color.gray)
                        .offset(x: 0, y: -20)
                        .frame(width: geo.size.width, height: 100, alignment: .center)
                        ForEach(0...((downloadData?.array?.count)! - 1), id: \.self) { index in
                            HStack {
                                NavigationLink(destination: ItemDataView(title: self.definitionsData!["\(downloadData![index]["id"].stringValue)"].stringValue)) {
                                    Image(uiImage: NetflixHelper.getImageFromBundle(source: definitionsData!["\(downloadData![index]["id"].stringValue)"].stringValue, type: "background"))
                                        .resizable()
                                        .frame(width: 64 * 1.5, height: 36 * 1.5, alignment: .leading)
                                    Text("\(NetflixHelper.improvedTitle(definitionsData!["\(downloadData![index]["id"].stringValue)"].stringValue))")
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                            }.padding()
                        }
                        VStack {
                            VStack {
                                Text("FIND MORE TO DOWNLOAD")
                            }.padding(8)
                            .border(Color.white, width: 1)
                        }.padding(20)
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

struct DownloadView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadView()
    }
}
