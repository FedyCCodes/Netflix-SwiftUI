//
//  HomeContinueWatchingView.swift
//  Netflix SwiftUI
//
//  Created by C, Fedy on 12/24/20.
//

import SwiftUI

struct HomeContinueWatchingView: View {
    // These are the titles that the user last watched based on what the data base has it stored as
    // NOTE: This doesn't update as the user clicks on play titles this is a dummy section that doesn't update.
    
    var homeData: JSON?
    var definitionsData: JSON?
    
    var body: some View {
        VStack {
            HStack {
                Text("Continue Watching:")
                    .foregroundColor(.white)
                    .bold()
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0...((self.homeData!["continue_watching"].array ?? [0])!.count - 1), id: \.self) { index in
                        VStack {
                            Image(uiImage: NetflixHelper.getImageFromBundle(source: "\(self.definitionsData!["\(self.homeData!["continue_watching"][index].stringValue.components(separatedBy: ",")[0])"].stringValue)", type: "cover"))
                                .resizable()
                                .frame(width: 124, height: 186, alignment: .center)
                            /*HStack {
                                Image(systemName: "info.fill")
                                    .resizable()
                                    .frame(width: 16, height: 16, alignment: .center)
                                    .padding(2)
                                    .foregroundColor(Color.white)
                            }.frame(width: 124, height: 30, alignment: .center)
                            .background(Color.gray)*/
                        }.frame(width: 124, height: 216, alignment: .center)
                        .padding(2)
                    }
                    Spacer()
                }
            }
        }.padding()
    }
}

struct HomeContinueWatchingView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContinueWatchingView()
    }
}
