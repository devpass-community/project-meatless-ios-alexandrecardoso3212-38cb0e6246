import Foundation

struct Restaurant: Decodable {
    let name: String
    let distance: String
    let status: String
    let openDays: String
    let image: String
    let menu: [MenuItem]
}
