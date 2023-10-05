//
//  HomeItemDataView.swift
//  Netflix SwiftUI
//
//  Created by Cherif, Fedy on 12/24/20.
//

import SwiftUI

struct ItemDataView: View {
    // This is the view that shows the different little details about the title
    
    var title: String?
    @State private var isPresented = false
    @State private var isInList = false
    
    /*init(title: String) {
        // when the item is initialzied
        
        self.title = title
        // it stores the title
        
    }*/
    
    var body: some View {
        GeometryReader() { geo in
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    ScrollView(.vertical) {
                        VStack {
                            HStack {
                                Spacer()
                                Image(uiImage: NetflixHelper.getImageFromBundle(source: "\(title!)", type: "background"))
                                    .resizable()
                                    .scaledToFill()
                                Spacer()
                            }.frame(height: 200)
                            HStack {
                                Text("\(NetflixHelper.improvedTitle("\(title!)"))")
                                    .fontWeight(.bold)
                                    .font(.title)
                                Spacer()
                            }.padding()
                            Button(action: {
                                
                            }, label: {
                                Button(action: {
                                    isPresented = true
                                }) {
                                    HStack {
                                        Image(systemName: "play.fill")
                                        Text("Play")
                                    }.frame(width: geo.size.width - 50, height: 40, alignment: .center)
                                    .foregroundColor(Color.black)
                                    .background(Color.white)
                                }.fullScreenCover(isPresented: $isPresented) {
                                    VideoPlayView(onClose: {
                                        isPresented = false
                                    })
                                }
                            })
                            Button(action: {
                                
                            }, label: {
                                HStack {
                                    Image("download-tab")
                                        .resizable()
                                        .frame(width: 16, height: 16, alignment: .center)
                                    Text("Download")
                                }.frame(width: geo.size.width - 50, height: 40, alignment: .center)
                                .background(Color.gray)
                            })
                            Text("Movie information: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.")
                                .lineLimit(nil)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding()
                            Text("Cast: when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                                .lineLimit(nil)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .foregroundColor(Color.gray)
                                .font(.system(size: 12))
                                .padding([.leading, .trailing, .bottom])
                                .padding(.top, 2)
                            HStack {
                                VStack {
                                    Image(systemName: isInList ? "checkmark" : "plus")
                                        .resizable()
                                        .frame(width: 20, height: 20, alignment: .center)
                                        .foregroundColor(Color.white)
                                        .padding(4)
                                        
                                    Text("My List")
                                        .foregroundColor(Color.gray)
                                        .font(.system(size: 12))
                                }.padding()
                                .onTapGesture {
                                    
                                    NetflixHelper.toggleItemMyList(title!)
                                    // either adds or remove the element in the array
                                    
                                    self.isInList.toggle()
                                    // toggles if it's in a list or not to update the ui
                                    
                                }
                                
                                VStack {
                                    Image(systemName: "hand.thumbsup")
                                        .resizable()
                                        .frame(width: 20, height: 20, alignment: .center)
                                        .foregroundColor(Color.white)
                                        .padding(4)
                                    
                                    Text("Rate")
                                        .foregroundColor(Color.gray)
                                        .font(.system(size: 12))
                                }.padding()
                                VStack {
                                    Image(systemName: "paperplane")
                                        .resizable()
                                        .frame(width: 20, height: 20, alignment: .center)
                                        .foregroundColor(Color.white)
                                        .padding(4)
                                    Text("Share")
                                        .foregroundColor(Color.gray)
                                        .font(.system(size: 12))
                                }.padding()
                                Spacer()
                            }.padding([.leading, .trailing, .bottom])
                            .padding(.top, 2)
                        }
                    }
                }
            }
        }.navigationBarItems(trailing:
            HStack {
                Image("Chrome Cast")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding(4)
                NavigationLink(destination: SettingsView()) {
                    Image("icon-1")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
            }
        )
        .onAppear {
            
            self.isInList = NetflixHelper.myList.contains(self.title!)
            // stores whether or not it is in the list
            
        }
    }
}

struct HomeItemDataView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDataView(title: "3below")
    }
}
