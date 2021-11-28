//
//  Card.swift
//  IoTMonitor
//
//  Created by 周子航 on 2021/11/26.
//

import SwiftUI

struct Card: View {

    var icon: Image = Image(systemName: "")
    var str1: Text = Text("")
    var str2: Text = Text("")
    var str3: Text = Text("")

    var body: some View {
        VStack {

            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        icon
                        str1
                                .font(.headline)
                                .foregroundColor(.secondary)
                    }
                    str2
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .lineLimit(3)
                    str3
                            .foregroundColor(.secondary)
                }
                        .layoutPriority(100)
                Spacer()
            }
                    .padding()
        }
                .cornerRadius(20)
                .overlay(
                        RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(.sRGB, red: 150 / 255, green: 150 / 255, blue: 150 / 255, opacity: 0.1), lineWidth: 1)
                )
                .padding([.top, .horizontal])
    }
}

struct TimePickCard: View {
    @EnvironmentObject var postManager: PostManager
    @Binding var date1: Date
    @Binding var date2: Date

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    DatePicker("开始时间", selection: $date1)
                    DatePicker("结束时间", selection: $date2)
                    Spacer()
                }
                        .padding()
            }
                    .cornerRadius(20)
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.sRGB, red: 150 / 255, green: 150 / 255, blue: 150 / 255, opacity: 0.1), lineWidth: 1)
                    )
                    .padding([.top, .horizontal])
        }
    }

}


struct SingleStringCard: View {
    var str: String
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .center) {
                    Text(str)
                            .foregroundColor(.blue)
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .lineLimit(3)
                }
                        .padding()
            }
                    .cornerRadius(20)
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.sRGB, red: 150 / 255, green: 150 / 255, blue: 150 / 255, opacity: 0.1), lineWidth: 1)
                    )
                    .padding([.top, .horizontal])
        }
    }

}
