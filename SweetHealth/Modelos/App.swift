// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let app = try? newJSONDecoder().decode(App.self, from: jsonData)

import Foundation

// MARK: - AppElement
class AppElement: Codable {
    let id: Int?
    let name: Name?
    let image: String?
    let date, time: String?
    let event: Event?
    let latitude, longitude: Double?

    init(id: Int?, name: Name?, image: String?, date: String?, time: String?, event: Event?, latitude: Double?, longitude: Double?) {
        self.id = id
        self.name = name
        self.image = image
        self.date = date
        self.time = time
        self.event = event
        self.latitude = latitude
        self.longitude = longitude
    }
}

enum Event: String, Codable {
    case closes = "closes"
    case opens = "opens"
}

enum Name: String, Codable {
    case chrome = "Chrome"
    case facebook = "Facebook"
    case gmail = "Gmail"
    case instagram = "Instagram"
    case reloj = "Reloj"
    case whatsapp = "Whatsapp"
}

typealias App = [AppElement]
