

import Foundation
struct SiteBaseModel : Codable {
    let code : Int?
    let message : String?
    let error : Bool?
    let data : PageData?
    
    
    init(code: Int?, message: String?, error: Bool?, data: PageData?) {
        self.code = code
        self.message = message
        self.error = error
        self.data = data
    }
    
}
