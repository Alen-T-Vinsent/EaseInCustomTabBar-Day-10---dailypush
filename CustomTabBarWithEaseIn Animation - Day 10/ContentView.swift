//
//  ContentView.swift
//  CustomTabBarWithEaseIn Animation - Day 10
//
//  Created by Apple  on 23/12/22.
//

import SwiftUI

enum Tab:String,CaseIterable{
    case house
    case message
    case person
    case leaf
    case gearshape
}

struct ContentView: View {
    @Binding var selectedTab:Tab
    
    
  
    
    private var fillImage:String {
        selectedTab.rawValue + ".fill"
    }
    
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
        VStack {
            HStack{
                ForEach(Tab.allCases,id: \.rawValue){ eachTab in
                    Spacer()
                    Image(systemName: selectedTab == eachTab ? fillImage : eachTab.rawValue)
                        .scaleEffect(selectedTab == eachTab ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == eachTab ? tabColour : .gray)
                        .font(.system(size: 22))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)){
                                print(eachTab)
                                selectedTab = eachTab
                                print(selectedTab)
                            }
                        }
                    Spacer()
                }
            }
        }
        .frame(width: nil,height: 60)
        .background(.thinMaterial)
        .cornerRadius(10)
        .padding()
    }
}

