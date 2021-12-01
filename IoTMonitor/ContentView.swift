//
//  ContentView.swift
//  IoTMonitor
//
//  Created by 周子航 on 2021/11/26.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @EnvironmentObject var postManager: PostManager

    var body: some View {
        TabView {
            NavigationView {
                ScrollView {
                    //                Card(icon:Image(systemName: "personalhotspot"),str1: Text("在线情况"), str2: Text("在线").foregroundColor(.green), str3: Text(""))
                    Button(action: {
                        postManager.getDeviceInfo()
                    }, label: {
                        Card(icon: Image(systemName: "repeat"), str1: Text(""), str2: Text("刷新").foregroundColor(.cyan), str3: Text(""))
                    })
                    Card(icon: Image(systemName: "sun.max"), str1: Text("温度"), str2: Text("\(postManager.temperature)°C").foregroundColor(.red), str3: Text(""))
                    Card(icon: Image(systemName: "thermometer"), str1: Text("湿度"), str2: Text("\(postManager.humidity)%").foregroundColor(.blue), str3: Text(""))
                    Button(action: {
                        postManager.turnDeviceOn()
                    }, label: {
                        Card(icon: Image(systemName: "power"), str1: Text(""), str2: Text("打开电机").foregroundColor(.green), str3: Text(""))
                    })
                    Button(action: {
                        postManager.turnDeviceOff()
                    }, label: {
                        Card(icon: Image(systemName: "power.dotted"), str1: Text(""), str2: Text("关闭电机").foregroundColor(.gray), str3: Text(""))
                    })
                }.navigationTitle("设备状态")
            }.tabItem({
                Image(systemName: "person")
            })
            History().tabItem({
                Image(systemName: "clock")
            })
            Option().tabItem({
                Image(systemName: "gear")
            })
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
