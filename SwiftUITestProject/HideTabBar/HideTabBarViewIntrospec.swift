//
//  HideTabBarView.swift
//  SwiftUITestProject
//
//  Created by Davidyoon on 12/20/23.
//

import SwiftUI
import SwiftUIIntrospect

struct HideTabBarViewIntrospec: View {
    var body: some View {
        TabView {
            IntrospecHomeView()
                .tabItem {
                    Label(
                        title: { Text("") },
                        icon: { Image(systemName: "house.fill") }
                    )
                }
            IntrospecSettingView()
                .tabItem {
                    Label(
                        title: { Text("Label") },
                        icon: { Image(systemName: "42.circle") }
                    )
                }
        }
    }
}

struct IntrospecHomeView: View {
    
    @State var uiTabbarController: UITabBarController?
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Home")
                NavigationLink(destination: IntrospecHomeSubView(), label: {
                    Text("Go to subView")
                })
            }
        }
        .navigationTitle("Home")
    }
}

struct IntrospecHomeSubView: View {
    @State var uiTabbarController: UITabBarController?
    
    var body: some View {
        VStack {
            Text("Home SubView")
        }
        .introspect(.tabView, on: .iOS(.v17), scope: .ancestor) { entity in
            entity.tabBar.isHidden = true
            self.uiTabbarController = entity
        }
        .onDisappear {
            self.uiTabbarController?.tabBar.isHidden = false
        }
    }
}

struct IntrospecSettingView: View {
    var body: some View {
        Text("Setting")
    }
}

#Preview {
    HideTabBarViewIntrospec()
}
