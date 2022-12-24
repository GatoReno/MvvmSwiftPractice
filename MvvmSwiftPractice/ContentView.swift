//
//  ContentView.swift
//  MvvmSwiftPractice
//
//  Created by etho on 12/24/22.
//

import SwiftUI

struct Item: Identifiable {
    var id: UUID
    var name: String
}



struct ContentView: View {
    // main state agains changes and reloads
    @StateObject var viewModel = MainViewModel()
    
    let item = ["Hi💎","Bye☠️","Hey💜"]
    
    var body: some View {
        NavigationView {
            List
            {
                ForEach(viewModel.courses, id: \.self){ course in
                    HStack{
                        SAURLImage(urlString: course.image)
                        Text(course.name).padding(8)
                    }
                }
            }.navigationTitle("Courses")
                .onAppear{
                    viewModel.fetch()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
