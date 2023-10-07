//
//  VideoPlayView.swift
//  Netflix SwiftUI
//
//  Created by C, Fedy on 1/11/21.
//

import SwiftUI

struct VideoPlayView: View {
    // this is the struct for the video playing side
    
    var onClose: ()->()?
    // creates a callback parameter
    
    var title: String?
    // this gets the title of the movie that is being view
    
    @State var sliderValue: Float = 0.5
    // temporary
    
    init(onClose: @escaping ()->()) {
        
        self.onClose = onClose
        // stores the callback
        
    }
    
    var body: some View {
        // this gets the body of the video playing frame
        
        GeometryReader { geo in
            // gets the geometry reader for the data
            
            VStack {
                // gets vstack
                
                VStack {
                    
                    HStack {
                        // creates an hstack
                        
                        Spacer()
                        // puts a spacer
                        
                        Image(systemName: "xmark")
                        // puts a close image to dismiss it
                            
                            .onTapGesture {
                                // when clicked
                                
                                UINavigationController.attemptRotationToDeviceOrientation()
                                // forces device to rotate
                                
                                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                                // sets the new orientation as landscape
                                
                                onClose()
                                // hides the frame
                            }
                        
                    }
                    .padding()
                    // adds padding
                    
                    Spacer()
                    // adds a spacer
                    
                    HStack {
                        // creates an hstack
                        
                        
                        Image(systemName: "gobackward.10")
                        // puts a rewind image
                            
                            .resizable()
                            // allows the image to be resized
                            
                            .frame(width: 48, height: 48, alignment: .center)
                            // makes it 32 by 32 in the center
                            
                            .padding()
                            // adds padding
                        
                        Image(systemName: "pause.fill")
                        // puts a pause image
                            
                            .resizable()
                            // allows the image to be resized
                            
                            .frame(width: 48, height: 48, alignment: .center)
                            // makes it 32 by 32 in the center
                            
                            .padding()
                            // adds padding
                        
                        Image(systemName: "goforward.10")
                        // puts a forward image
                            
                            .resizable()
                            // allows the image to be resized
                            
                            .frame(width: 48, height: 48, alignment: .center)
                            // makes it 32 by 32 in the center
                            
                            .padding()
                            // adds padding
                        
                    }
                    .padding()
                    // adds padding
                    
                    Spacer()
                    // adds a spacer
                    
                }
                .padding([.top, .bottom], 16)
                // adds vertical margin of 16
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            // this makes it go at the maximum size
            
            .background(Color.black)
            // gives a black background
            
            .edgesIgnoringSafeArea(.all)
            // this makes sure that the black part covers the whole screen
        }
        .onAppear {
            
            UINavigationController.attemptRotationToDeviceOrientation()
            // forces device to rotate
            
            UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
            // sets the new orientation
            
        }
    }
}

struct VideoPlayView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayView(onClose: {})
    }
}
