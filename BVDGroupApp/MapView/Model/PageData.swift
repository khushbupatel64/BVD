
import Foundation


struct PageData : Codable {
    let current_page : Int?
    let data : [FuelSite]?
    let first_page_url : String?
    let from : Int?
    let last_page : Int?
    let last_page_url : String?
    let links : [Links]?
    let next_page_url : String?
    let path : String?
    let per_page : String?
    let prev_page_url : String?
    let to : Int?
    let total : Int?
    
    init(current_page: Int?, data: [FuelSite]?, first_page_url: String?, from: Int?, last_page: Int?, last_page_url: String?, links: [Links]?, next_page_url: String?, path: String?, per_page: String?, prev_page_url: String?, to: Int?, total: Int?) {
        self.current_page = current_page
        self.data = data
        self.first_page_url = first_page_url
        self.from = from
        self.last_page = last_page
        self.last_page_url = last_page_url
        self.links = links
        self.next_page_url = next_page_url
        self.path = path
        self.per_page = per_page
        self.prev_page_url = prev_page_url
        self.to = to
        self.total = total
    }
}
