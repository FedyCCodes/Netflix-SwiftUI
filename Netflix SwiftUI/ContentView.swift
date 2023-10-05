//
//  ContentView.swift
//  Netflix SwiftUI
//
//  Created by Cherif, Fedy on 12/17/20.
//

import UIKit
import SwiftUI

struct ContentView: View {
    @State var selection: Int = 1
    
    init() {
        UITabBar.appearance().isOpaque = false
        UITabBar.appearance().barStyle = .black
        UITabBar.appearance().alpha = 1
        UITabBar.appearance().barTintColor = UIColor.black
        UITabBar.appearance().backgroundColor = UIColor.black
        // makes the UITabBar black
        
        UINavigationBar.appearance().isOpaque = false
        UINavigationBar.appearance().barStyle = .black
        UINavigationBar.appearance().alpha = 1
        UINavigationBar.appearance().barTintColor = UIColor.black
        UINavigationBar.appearance().backgroundColor = UIColor.black
        // makes all the navigation bars black
    }
    
    func getUITabImage(_ tag: Int) -> String {
        // this is a function to convert the tag to the image id
        
        var iconsList = ["home-tab","coming-soon-tab","search-tab","download-tab"]
        // stores all the icons
        
        var icon = iconsList[tag - 1]
        // gets the icon based on the tag
        
        if (tag != selection) {
            // if the tag is not equal to the selection
            
            icon = icon + "-disabled"
            // it adds the disabled tag to it
            
        }
        
        return icon
        // returns the icon
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.ignoresSafeArea()
                TabView(selection: $selection) {
                
                    NavigationView {
                        ZStack {
                            Color.black.ignoresSafeArea()
                            HomeView()
                                .foregroundColor(Color.white)
                        }
                    }
                    .tabItem {
                        VStack {
                            Image(getUITabImage(1))
                            Text("Home")
                        }
                    }.tag(1).foregroundColor(Color.white)
                    .background(Color.black)
                    
                    NavigationView {
                        ZStack {
                            Color.black.ignoresSafeArea()
                            ComingSoonView()
                                .foregroundColor(Color.white)
                        }
                    }.navigationBarTitle("")
                    .navigationBarHidden(true)
                    .tabItem {
                        VStack {
                            Image(getUITabImage(2))
                            Text("Coming Soon")
                        }
                        
                    }.tag(2).foregroundColor(Color.white)
                    NavigationView {
                        ZStack {
                            Color.black.ignoresSafeArea()
                            SearchView()
                                .foregroundColor(Color.white)
                        }
                    }.navigationBarTitle("")
                    .navigationBarHidden(true)
                    .tabItem {
                        VStack {
                            Image(getUITabImage(3))
                            Text("Search")
                        }
                    }.tag(3).foregroundColor(Color.white)
                    NavigationView {
                        ZStack {
                            Color.black.ignoresSafeArea()
                            DownloadView()
                                .foregroundColor(Color.white)
                        }
                    }.navigationBarTitle("")
                    .navigationBarHidden(true)
                    .tabItem {
                        VStack {
                            Image(getUITabImage(4))
                            Text("Downloads")
                        }
                    }.tag(4).foregroundColor(Color.white)
                    
                }
                .accentColor(.white)
                .background(Color.black)
                .tabViewStyle(DefaultTabViewStyle())
            }
        }
        .onAppear {
            // once the swiftui view loaded
            
            UINavigationController.attemptRotationToDeviceOrientation()
            // forces device to rotate
            
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            // sets the new orientation as portrait mode
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
