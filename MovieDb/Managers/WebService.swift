//
//  WebService.swift
//  MovieDb-fave
//
//  Created by Jonathan Ng on 28/10/2020.
//

import Foundation
import Combine

class WebService: ObservableObject {
    @Published var results = [Results]()
    @Published var genres = [Genres]()
    @Published var details = [Details]()
    func getPost(){
        let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=328c283cd27bd1877d9080ccb1604c91&primary_release_date.lte=2020-10-01&sort_by=release_date.desc&page=2")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard data != nil else{
                return
            }
            do{
                let jsonDecoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-mm-dd"
                jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
                print("Started decoding Json")
                let responseModel = try jsonDecoder.decode(Json4Swift_Base.self, from: data!)
                DispatchQueue.main.async {
                    self.results = responseModel.results!
                    print("Started saving result into coredata")
                        let cdManager = CoreDataManager()
                    cdManager.saveResults(self.results)
                    }
            }
            catch{
                print(error)
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
