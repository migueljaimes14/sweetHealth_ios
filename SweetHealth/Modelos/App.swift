// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let app = try? newJSONDecoder().decode(App.self, from: jsonData)

import Foundation

// MARK: - AppElement
struct AppElement: Codable {
    let id: Int?
    let name: Name?
    let image: String?
    let date, time: String?
    let event: Event?
    let latitude, longitude: Double?
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
