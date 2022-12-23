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
        selectedTab.rawValue + "fill"
    }
    var body: some View {
        VStack {
            HStack{
                ForEach(Tab.allCases,id: \.rawValue){ eachTab in
                    Spacer()
                    Image(systemName: selectedTab == eachTab ? fillImage : eachTab.rawValue)
                        .scaleEffect(selectedTab == eachTab ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == eachTab ? .red : .gray)
                        .font(.system(size: 22))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)){
                                selectedTab = eachTab
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selectedTab: .constant(.house))
    }
}
