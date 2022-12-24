//
//  MainViewModel.swift
//  MvvmSwiftPractice
//
//  Created by etho on 12/24/22.
//

import Foundation

// a ObservableObject is a bindable object in swift
// allows to observe changes into the data or structs

class MainViewModel : ObservableObject {
    @Published var courses: [SACourse] = []
    func fetch () {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/")
        else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){[weak self]
            data, _,
            error in
            guard let data = data , error == nil else{
                return
            }
            
            //convert to json
            
            do {
                let _courses = try JSONDecoder().decode([SACourse].self, from: data)
                DispatchQueue.main.async {
                    self?.courses = _courses
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
}
