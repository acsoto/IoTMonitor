//
//  PostManager.swift
//  IoTMonitor
//
//  Created by 周子航 on 2021/11/26.
//

import Foundation
import SwiftHTTP
import SwiftUICharts

final class PostManager: ObservableObject {
    @Published var temperature = ""
    @Published var humidity = ""
    @Published var temperatureHistory = [Double]()
    @Published var humidityHistory = [Double]()
    @Published var thresholdVlaueHistory = [Double]()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    init() {
        getDeviceInfo()
    }

    func setThreshold(threshold: Int) {
        let params = ["threshold": threshold]
        HTTP.POST("https://service-mu7i6cz3-1308528160.bj.apigw.tencentcs.com/release/set_threshold", parameters: params) { response in

        }
    }

    //"1637856052000" "1637942452000"
    func getHistory(begin: String, end: String) {
        let params = ["begin_timestamp": begin, "end_timestamp": end]
        HTTP.POST("https://service-mu7i6cz3-1308528160.bj.apigw.tencentcs.com/release/get_history_status_page", parameters: params) { response in
            self.humidityHistory = [Double]()
            self.temperatureHistory = [Double]()
            do {
                let json = try JSONSerialization.jsonObject(with: response.data)
                let dic = json as! Dictionary<String, Array<NSNumber>>
                if let list = dic["humidity_data"] {
                    for i in list {
                        self.humidityHistory.append(Double(truncating: i))
                    }
                }
                if let list = dic["temperature_data"] {
                    for i in list {
                        self.temperatureHistory.append(Double(truncating: i))
                    }
                }
            } catch _ {
                print("error")
            }
        }
    }

    func getDeviceInfo() {
        HTTP.GET("https://service-mu7i6cz3-1308528160.bj.apigw.tencentcs.com/release/get_temperature_humidity") { response in
            if let dict = dataToDictionary(data: response.data) {
                if let deviceStatusList = dict["deviceStatusList"] {
                    for i in deviceStatusList as! Array<Dictionary<String, Any>> {
                        if i["datasetId"] as! String == "humidity_data" {
                            DispatchQueue.main.async {
                                self.humidity =
                                        String(format: "%.2f", Double(i["value"] as! String)!)
                                  }
                        } else {
                            DispatchQueue.main.async {
                            self.temperature = String(format: "%.2f", Double(i["value"] as! String)!)
                            }
                        }
                    }
                }
            }
        }
    }

    func turnDeviceOn() {
        HTTP.GET("https://service-mu7i6cz3-1308528160.bj.apigw.tencentcs.com/release/turn_motor_on") { response in

        }
    }

    func turnDeviceOff() {
        HTTP.GET("https://service-mu7i6cz3-1308528160.bj.apigw.tencentcs.com/release/turn_motor_off") { response in

        }
    }
}

func dataToDictionary(data: Data) -> Dictionary<String, Any>? {
    do {
        let json = try JSONSerialization.jsonObject(with: data)
        let dic = json as! Dictionary<String, Any>
        return dic
    } catch _ {
        return nil
    }
}
