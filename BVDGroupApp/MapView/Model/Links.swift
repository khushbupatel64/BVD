

import Foundation
struct Links : Codable {
	let url : String?
	let label : String?
	let active : Bool?
    
    init(url: String?, label: String?, active: Bool?) {
        self.url = url
        self.label = label
        self.active = active
    }
}
