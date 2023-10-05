//
//  HomeHeaderView.swift
//  Netflix SwiftUI
//
//  Created by Cherif, Fedy on 12/24/20.
//

import SwiftUI

struct HomeHeaderView: View {
    // This view is first main title that is presented on the home screen (the input is a number to see which title is being first presented based on the `definitionsKeys` property).
    
    var homeData: JSON?
    var definitionsData: JSON?
    var definitionsKeys: JSON?
    var geo: GeometryProxy?
    
    var headerDataId: Int?
    
    @State private var isPresented = false
    @State private var isInList = false
    
    var body: some View {
        VStack {
            VStack {
                Image(uiImage: NetflixHelper.getImageFromBundle(source: "\(self.definitionsData!["\(definitionsKeys!.arrayValue[headerDataId!].stringValue)"].stringValue)", type: "title"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }.frame(height: 100)
            .offset(x: 0, y: 50)
            HStack {
                Spacer()
                VStack {
                    Image(systemName: isInList ? "checkmark" : "plus")
                        .resizable()
                        .frame(width: 24, height: 24, alignment: .center)
                    Text("My List")
                    
                }
                .onTapGesture {
                    
                    NetflixHelper.toggleItemMyList(self.definitionsData!["\(definitionsKeys!.arrayValue[headerDataId!].stringValue)"].stringValue)
                    // either adds or remove the element in the array
                    
                    self.isInList.toggle()
                    // toggles if it's in a list or not to update the ui
                    
                }
                Spacer()
                
                Button(action: {
                    isPresented = true
                }) {
                    HStack {
                        Image(systemName: "play.fill")
                        Text("Play")
                    }.padding(.top, 6)
                    .padding(.bottom, 6)
                    .padding(.leading)
                    .padding(.trailing)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .cornerRadius(4)
                }
                .fullScreenCover(isPresented: $isPresented) {
                    VideoPlayView(onClose: {
                        isPresented = false
                    })
                }
                
                Spacer()
                NavigationLink(destination: ItemDataView(title: self.definitionsData!["\(definitionsKeys!.arrayValue[headerDataId!].stringValue)"].stringValue)) {
                    VStack {
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 24, height: 24, alignment: .center)
                        Text("info")
                    }
                }
                Spacer()
            }.offset(x: 0, y: 50)
        }.frame(height: 300)
        .background(Image(uiImage: NetflixHelper.getImageFromBundle(source: "\(self.definitionsData!["\(definitionsKeys!.arrayValue[headerDataId!].stringValue)"].stringValue)", type: "background"))
                        .resizable()
                        .scaledToFill()
             
        )
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView()
    }
}
