//
//  PinchNDrag
//  Swift 5
//  Created by Irhad Sehovic on 5/4/21.
//

import SwiftUI

struct ImagePinchNZoom: View {
    // Creates variables to hold drag position and zoom scale
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    @State private var currentScale: CGFloat = 1
    @State private var newScale: CGFloat = 1
    
    var body: some View {
        
        // Creates the Pinch gesture
        let pinchGesture = MagnificationGesture().onChanged { (value)
            in
            currentScale = CGFloat(value + newScale)-1
        }.onEnded { value in
            newScale = currentScale
        }
        
        // Creates the Drag gesture
        let dragGesture = DragGesture().onChanged { (value)
            in
            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
        }.onEnded { value in
            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
            self.newPosition = self.currentPosition
            
        }
        
        // Creates a simultaneous gesture
        let pinchNDrag = dragGesture.simultaneously(with: pinchGesture)
        
        VStack{
            Spacer()
            Image("ImageName") // Insert image name here
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal)
                .zIndex(1.0) // Only necessary if you have text/image code below this line that will cover your image if it's zoomed. 
                .scaleEffect(max(currentScale,1)) // Makes it impossible to shrink the image
                .offset(x: self.currentPosition.width, y: self.currentPosition.height)
                .gesture(pinchNDrag)
            Spacer()
        }
    }
}

struct ImagePinchNZoom_Previews: PreviewProvider {
    static var previews: some View {
        ImagePinchNZoom()
    }
}
