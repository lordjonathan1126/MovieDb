//
//  MovieList.swift
//  MovieDb-fave
//
//  Created by Jonathan Ng on 28/10/2020.
//

import SwiftUI

struct MovieList: View {
    @FetchRequest(
        entity: Core_Results.entity(),
        sortDescriptors: [ NSSortDescriptor(keyPath: \Core_Results.release_date, ascending: false)]
    ) var posts: FetchedResults<Core_Results>
    var body: some View {
            List(_posts.wrappedValue, id: \.self){ result in
                MovieListCell(img: result.img ?? "", name:result.title!, rating: result.vote_average, id: String(result.id), release_date: (result.release_date?.asString(style: .medium))!, overview: result.overview!, language: result.language!)
            }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}

struct MovieListCell: View {
    var img:String
    var name:String
    var rating: Double
    var id: String
    var release_date: String
    var overview:String
    var language:String
    
    init(img: String, name:String, rating: Double, id: String, release_date: String, overview:String, language:String){
        self.img = img
        self.name = name
        self.rating = rating
        self.id = id
        self.release_date = release_date
        self.overview = overview
        self.language = language
    }
    var body: some View{
        NavigationLink(destination: DetailView(img: img, name: name, rating: rating, id: id, release_date: release_date, overview: overview, language: language)) {
            HStack{
                UrlImageView(urlString: "https://image.tmdb.org/t/p/w500" + img)
                    .frame(width: 140, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                VStack(alignment:.leading, spacing: 15){
                    Text(name)
                        .font(.headline)
                    HStack{
                        Text("\(rating, specifier: "%.1f")")
                            .bold()
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    Text(release_date)
                }
            }.padding()
        }.buttonStyle(PlainButtonStyle())
      
    }
}
