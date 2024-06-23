
import Foundation

struct State : Codable {
	let id : Int?
	let country_id : Int?
	let created_at : String?
	let updated_at : String?
	let name : String?
	let abbreviation : String?
    
    init(id: Int?, country_id: Int?, created_at: String?, updated_at: String?, name: String?, abbreviation: String?) {
        self.id = id
        self.country_id = country_id
        self.created_at = created_at
        self.updated_at = updated_at
        self.name = name
        self.abbreviation = abbreviation
    }

}
