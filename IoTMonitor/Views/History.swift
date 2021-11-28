//
//  History.swift
//  IoTMonitor
//
//  Created by 周子航 on 2021/11/27.
//

import SwiftUI
import SwiftUICharts

struct History: View {
    @EnvironmentObject var postManager: PostManager
    @State var date1 = Date()
    @State var date2 = Date()

    var body: some View {
        NavigationView {
            ScrollView {
                TimePickCard(date1: $date1, date2: $date2)
                Button(action: {
                    postManager.getHistory(begin: String(format: "%.0f", date1.timeIntervalSince1970 * 1000), end: String(format: "%.0f", date2.timeIntervalSince1970 * 1000))
                }, label: {
                    Card(icon: Image(systemName: "repeat"), str1: Text(""), str2: Text("获取").foregroundColor(.cyan), str3: Text(""))
                })
                Spacer(minLength: 50)
                HStack {
                    LineChartView(data: postManager.temperatureHistory, title: "温度")
                    LineChartView(data: postManager.humidityHistory, title: "湿度")
                }
            }.navigationTitle("历史记录")

        }
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        MultiLineChartView(data: [([8, 32, 11, 23, 40, 28], GradientColors.green), ([90, 99, 78, 111, 70, 60, 77], GradientColors.purple), ([34, 56, 72, 38, 43, 100, 50], GradientColors.orngPink)], title: "Title")

    }
}
