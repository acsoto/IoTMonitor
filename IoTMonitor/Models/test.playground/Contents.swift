
import Foundation
import SwiftHTTP


var date = Date()
//print(String(format: "%.0f", date.timeIntervalSince1970*1000))


let params = ["begin_timestamp": "1637856052000","end_timestamp": "1637942452000" ]
HTTP.POST("https://service-mu7i6cz3-1308528160.bj.apigw.tencentcs.com/release/get_history_status_page", parameters: params){response in
    do{
        let json = try JSONSerialization.jsonObject(with: response.data)
        let dic = json as! Dictionary<String,Array<NSNumber>>
        print(dic)
    }catch _ {
        print("error")
    }
}



