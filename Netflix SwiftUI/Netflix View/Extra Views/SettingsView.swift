//
//  SettingsView.swift
//  Netflix SwiftUI
//
//  Created by C, Fedy on 12/29/20.
//

import SwiftUI

struct SettingsView: View {
    // The settings page that is accessed once the user clicked on the profile picture
    
    var profileData: JSON?
    
    init() {
        
        let json = NetflixHelper.getData()
        // gets the json data
        
        profileData = json["profile"]
        // stores the profile data
    }
    
    var body: some View {
        GeometryReader() { geo in
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    ScrollView(.vertical) {
                        VStack {
                            HStack {
                                VStack {
                                    Image("icon-\(profileData!["icon"].stringValue)")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    Text("\(profileData!["name"].stringValue)")
                                }
                                VStack {
                                    VStack {
                                        Image(systemName: "plus")
                                            .frame(width: 30, height: 30)
                                            .padding(5)
                                    }.frame(width: 40, height: 40)
                                    .border(Color.white, width: 2)
                                    Text("Add P...")
                                }
                            }
                            VStack {
                                HStack {
                                    Image(systemName: "edit")
                                    Text("Manage Profiles")
                                }.padding()
                            }.padding()
                            VStack {
                                NavigationLink(destination: MyListView()) {
                                    HStack {
                                        Image(systemName: "checkmark")
                                        Text("My List")
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                    }.padding()
                                }
                            }
                            .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
                            .padding(.top, 4)
                            .background(Color(red: 0.1, green: 0.1, blue: 0.1))
                            VStack {
                                HStack {
                                    Image(systemName: "gear.fill")
                                    Text("App Settings")
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }.padding()
                            }
                            .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
                            .padding(.top, 4)
                            .background(Color(red: 0.1, green: 0.1, blue: 0.1))
                            VStack {
                                HStack {
                                    Image(systemName: "questionmark.circle")
                                    Text("Help")
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }.padding()
                            }
                            .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
                            .padding(.top, 4)
                            .background(Color(red: 0.1, green: 0.1, blue: 0.1))
                            VStack {
                                Text("Sign Out")
                                Text("Version 0.0.0 (0000) 0.0.0-00")
                                    .foregroundColor(Color(red: 0.5, green: 0.5, blue: 0.5))
                            }.padding(20)
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
                Image("icon-1")
                    .resizable()
                    .frame(width: 32, height: 32)
            }
        )
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
