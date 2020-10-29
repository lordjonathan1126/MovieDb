//
//  DetailView.swift
//  MovieDb-fave
//
//  Created by Jonathan Ng on 28/10/2020.
//

import SwiftUI

struct DetailView: View {
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
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 12 ) {
                HStack {
                    UrlImageView(urlString: "https://image.tmdb.org/t/p/w500" + img)
                        .frame(width: 150, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Spacer()
                    VStack(alignment:.leading, spacing: 15) {
                        Text(name)
                            .font(.headline)
                            .lineLimit(3)
                        HStack{
                            Text("\(rating, specifier: "%.1f")")
                                .bold()
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                }
                Text("Summary:").bold()
                Text(overview)
                    .lineLimit(nil)
                HStack{
                    Text("Language:").bold()
                    Text(language)
                }
                HStack{
                    Text("Release Date:").bold()
                    Text(release_date)
                }
                Spacer()
            }.padding(.horizontal)
        }
        .navigationBarItems(trailing:
                                Button(action: {
                                    let formattedString = "https://www.cathaycineplexes.com.sg/"
                                    let url: NSURL = URL(string: formattedString)! as NSURL
                                    UIApplication.shared.open(url as URL)
                                }
                                ){
                                    Text("Book")
                                }
        )
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(img: "", name: "", rating: 0.0, id: "", release_date: "", overview: "", language: "")
    }
}
