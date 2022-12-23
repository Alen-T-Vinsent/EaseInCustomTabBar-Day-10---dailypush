//
//  HomeView.swift
//  CustomTabBarWithEaseIn Animation - Day 10
//
//  Created by Apple  on 23/12/22.
//

import SwiftUI

struct HomeView: View {
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    @State var selectedTab:Tab = .house
    
    private var tabColour:Color{
        switch selectedTab{
        case .house:
            return .blue
        case .message:
            return .green
        case .person:
            return .indigo
        case .leaf:
            return .green
        case .gearshape:
            return .orange
        }
    }
    
    var body: some View {
        
        VStack{
            TabView(selection: $selectedTab){
                ForEach(Tab.allCases,id:\.rawValue){eachTab in
                    HStack{
                        Image(systemName: eachTab.rawValue)
                            .resizable()
                            .frame(width: 300,height: 300)
                            .foregroundColor(selectedTab == eachTab ? tabColour : .gray)
                            .animation(.easeInOut(duration: 2),value: selectedTab)
//                        Text("\(eachTab.rawValue.capitalized)")
//                            .frame(width: 100,height: 100)
//                            .foregroundColor(selectedTab == eachTab ? tabColour : .gray)
//                            .bold()
//                            .animation(.easeInOut(duration: 2),value: selectedTab)
                    }
                    .tag(eachTab)
                    .padding()
                   
                }
            }
        }
        VStack{
            ContentView(selectedTab: $selectedTab)
        }
        
    }
}

