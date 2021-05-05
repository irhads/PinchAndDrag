//
//  ReferenceTables.swift
//  Learn Bosnian
//
//  Created by Irhad Sehovic on 5/4/21.
//

import SwiftUI

struct ReferenceTables: View {
    var body: some View {
        List {
            NavigationLink(destination: NominativeTable(), label: {
                LessonButton(lessonNum: 1, lessonName: "Nominative Case")
            })
            NavigationLink(destination: AccusativeTable(), label: {
                LessonButton(lessonNum: 2, lessonName: "Accusative Case")
            })
        }
    }
}

struct NominativeTable: View {
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    @State private var currentScale: CGFloat = 1
    @State private var newScale: CGFloat = 1
    
    var body: some View {
        
        let pinchGesture = MagnificationGesture().onChanged { (value)
            in
            currentScale = CGFloat(value + newScale)-1
        }.onEnded { value in
            newScale = currentScale
        }
        
        let dragGesture = DragGesture().onChanged { (value)
            in
            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
        }.onEnded { value in
            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
            self.newPosition = self.currentPosition
            
        }
        
        let pinchNDrag = dragGesture.simultaneously(with: pinchGesture)
        
        VStack{
            Spacer()
            Text("Nominative Case Endings")
                .font(.title2)
                .bold()
            Text("You can pinch and zoom.")
                .font(.caption)
                .padding()
            Image("NominativeTable")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal)
                .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .scaleEffect(max(currentScale,1))
                .offset(x: self.currentPosition.width, y: self.currentPosition.height)
                .gesture(pinchNDrag)
            Text("How to read this table:").bold()
                .padding()
            VStack(alignment: .leading){
                Text("1. Is the word masculine, neuter, feminine, or feminine zero-ending? Find the gender of the word and go to that row.")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.callout)
                    .padding(.horizontal)
                Text("2. Is the word singular or is it plural (is the word about one thing or multiple things)? Look under the yellow section if it's singular or the blue section if it's plural.")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.callout)
                    .padding()
                Text("3. Is the word an adjective or a noun? (If the word is a description word, like \"red\" or \"big\", it's an adjective. If it's a thing, like \"dog\" or \"house\", it's a noun.")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.callout)
                    .padding(.horizontal)
                HStack {
                    Spacer()
                    Text("You have found the right word ending!")
                        .bold()
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.callout)
                        .padding()
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

struct AccusativeTable: View {
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    @State private var currentScale: CGFloat = 1
    @State private var newScale: CGFloat = 1
    
    var body: some View {
        
        let pinchGesture = MagnificationGesture().onChanged { (value)
            in
            currentScale = CGFloat(value + newScale)-1
        }.onEnded { value in
            newScale = currentScale
        }
        
        let dragGesture = DragGesture().onChanged { (value)
            in
            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
        }.onEnded { value in
            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
            self.newPosition = self.currentPosition
            
        }
        
        let pinchNDrag = dragGesture.simultaneously(with: pinchGesture)
        
        VStack{
            Spacer()
            Text("Accusative Case Endings")
                .font(.title2)
                .bold()
            Text("You can pinch and zoom.")
                .font(.caption)
                .padding()
            Image("AccusativeTable")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal)
                .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .scaleEffect(max(currentScale,1))
                .offset(x: self.currentPosition.width, y: self.currentPosition.height)
                .gesture(pinchNDrag)
            Text("How to read this table:").bold()
                .padding()
            VStack(alignment: .leading){
                Text("1. Is the word masculine, neuter, feminine, or feminine zero-ending? Find the gender of the word and go to that row.")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.callout)
                    .padding(.horizontal)
                Text("2. Is the word singular or is it plural (is the word about one thing or multiple things)? Look under the yellow section if it's singular or the blue section if it's plural.")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.callout)
                    .padding()
                Text("3. Is the word an adjective or a noun? (If the word is a description word, like \"red\" or \"big\", it's an adjective. If it's a thing, like \"dog\" or \"house\", it's a noun.")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.callout)
                    .padding(.horizontal)
                HStack {
                    Spacer()
                    Text("You have found the right word ending!")
                        .bold()
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.callout)
                        .padding()
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

struct ReferenceTables_Previews: PreviewProvider {
    static var previews: some View {
        NominativeTable()
    }
}

/* Geestures Archive
.gesture(DragGesture()
            .onChanged { value in
                withAnimation(.spring()) {
                    offset = value.translation
                }
            }
            .onEnded { value in
                withAnimation(.spring()) {
                    offset = .zero
                }
            }
            )
.gesture(MagnificationGesture()
            .onChanged { value in
                currentAmount = value - 1
            }
            .onEnded { value in
                withAnimation(.spring()) {
                    currentAmount = 0
                }
            })
*/
