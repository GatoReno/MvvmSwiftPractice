//
//  SAURLImage.swift
//  MvvmSwiftPractice
//
//  Created by etho on 12/24/22.
//
import SwiftUI
import Foundation

struct SAURLImage: View {
    
    let urlString: String
    
    @State var data: Data?
    var body: some View {
        
        if  let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame (width: 120,height: 60)
                .background(Color.gray)
        }
        else{
                Image(systemName: "video")
                .frame (width: 120,height: 60)
                .background(Color.black)
                .aspectRatio(contentMode: .fit)
                .onAppear{
                    fetchData()
                }
        }
    }
   
    private func fetchData(){
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url){ data,
            _,_ in
            self.data = data
        }
        task.resume()
    }
    
}
