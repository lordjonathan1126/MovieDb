//
//  ContentView.swift
//  MovieDb
//
//  Created by Jonathan Ng on 28/10/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{ geometry in
        NavigationView{
            RefreshScrollView(width: geometry.size.width , height: geometry.size.height)
                .edgesIgnoringSafeArea(.bottom)
                .navigationBarTitle("Movie DB")
        }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
