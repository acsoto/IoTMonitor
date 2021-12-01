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
    @State var date1 = NSDate.init(timeInterval: -2 * 24 * 60 * 60, since: Date()) as Date
    @State var date2 = Date()

    var body: some View {
        NavigationView {
            ScrollView {
                Button(action: {
                    postManager.getHistory(date1: date1, date2: date2)
                }, label: {
                    Card(icon: Image(systemName: "repeat"), str1: Text(""), str2: Text("获取").foregroundColor(.cyan), str3: Text(""))
                })
                TimePickCard(date1: $date1, date2: $date2)
//                MultiLineChartView(data: [(postManager.temperatureHistory,GradientColors.orange),(postManager.humidityHistory,GradientColors.blue)], title: "", form: ChartForm.large)
//                    .cornerRadius(20)
//                    .overlay(
//                            RoundedRectangle(cornerRadius: 10)
//                                .stroke(Color(.sRGB, red: 150 / 255, green: 150 / 255, blue: 150 / 255, opacity: 0.1), lineWidth: 0.5)
//                    )
//                    .padding([.top, .horizontal])
                LineChartView(data: postManager.temperatureHistory, title: "温度", form: ChartForm.large)
                        .cornerRadius(20)
                        .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(.sRGB, red: 150 / 255, green: 150 / 255, blue: 150 / 255, opacity: 0.1), lineWidth: 0.5)
                        )
                        .padding([.top, .horizontal])
                LineChartView(data: postManager.humidityHistory, title: "湿度", form: ChartForm.large)
                        .cornerRadius(20)
                        .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(.sRGB, red: 150 / 255, green: 150 / 255, blue: 150 / 255, opacity: 0.1), lineWidth: 0.5)
                        )
                        .padding([.top, .horizontal])
                        .onReceive(postManager.timer) { time in

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
