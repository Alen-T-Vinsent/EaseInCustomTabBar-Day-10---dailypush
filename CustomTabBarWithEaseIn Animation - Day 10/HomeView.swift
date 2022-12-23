//
//  HomeView.swift
//  CustomTabBarWithEaseIn Animation - Day 10
//
//  Created by Apple  on 23/12/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
         ContentView(selectedTab: .constant(.house))
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
