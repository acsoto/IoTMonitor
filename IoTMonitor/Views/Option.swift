//
//  Option.swift
//  IoTMonitor
//
//  Created by 周子航 on 2021/11/28.
//

import SwiftUI

struct Option: View {
    @EnvironmentObject var postManager: PostManager
    @State var thresholdValue = 30

    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    VStack(alignment: .center) {
                        Stepper(value: $thresholdValue) {
                            HStack {
                                Text("阈值").foregroundColor(.gray)
                                Spacer()
                                Text("\(thresholdValue)")
                                        .foregroundColor(.red)
                                        .font(.title)
                                        .fontWeight(.black)
                                        .foregroundColor(.primary)
                                        .lineLimit(3)
                            }

                        }

                    }
                            .padding()
                }
                        .cornerRadius(20)
                        .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(.sRGB, red: 150 / 255, green: 150 / 255, blue: 150 / 255, opacity: 0.1), lineWidth: 1)
                        )
                        .padding([.top, .horizontal])

                Button(action: {
                    postManager.setThreshold(threshold: thresholdValue)
                }, label: {
                    Card(icon: Image(systemName: ""), str1: Text(""), str2: Text("保存").foregroundColor(.cyan), str3: Text(""))
                })

            }.navigationTitle(Text("设置"))
        }
    }
}

struct Option_Previews: PreviewProvider {
    static var previews: some View {
        Option()
    }
}
