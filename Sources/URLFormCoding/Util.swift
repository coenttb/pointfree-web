import Foundation
import UrlFormEncoding

extension UrlFormDecoder {
    public static let `default`: UrlFormDecoder = {
        let decoder = UrlFormDecoder()
        decoder.parsingStrategy = .bracketsWithIndices
        return decoder
    }()
}

// public let formDecoder: UrlFormDecoder = {
//    let decoder = UrlFormDecoder()
//    decoder.parsingStrategy = .bracketsWithIndices
//    return decoder
// }()

extension DateFormatter {
    public static let form: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}
