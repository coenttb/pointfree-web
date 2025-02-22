import Foundation
import Prelude

/// Encodes an encodable into `x-www-form-urlencoded` format. It first converts the value into a JSON
/// dictionary using the provided encoder, and then encodes that into the format.
///
/// - Parameters:
///   - value: The encodable value to encode
///   - encoder: The JSONEncoder to use for the initial encoding step
public func urlFormEncode<A: Encodable>(value: A, encoder: JSONEncoder = .init()) -> String {
    return (try? encoder.encode(value))
        .flatMap { try? JSONSerialization.jsonObject(with: $0) }
        .flatMap { $0 as? [String: Any] }
        .map(urlFormEncode(value:))
        ?? ""
}


/// Encodes an array into `x-www-form-urlencoded` format.
///
/// - Parameters:
///   - value: The array of values to encode.
///   - rootKey: A root key to hold the array.
public func urlFormEncode(values: [Any], rootKey: String) -> String {
  return urlFormEncode(values: values, rootKey: rootKey, keyConstructor: id)
}

/// Encodes a dictionary of values into `x-www-form-urlencoded` format.
///
/// - Parameter value: The dictionary of values to encode
public func urlFormEncode(value: [String: Any]) -> String {
  return urlFormEncode(value: value, keyConstructor: id)
}

// MARK: - Private

private func urlFormEncode(values: [Any], rootKey: String, keyConstructor: (String) -> String) -> String {
  return values.enumerated()
    .map { idx, value in
      switch value {
      case let value as [String: Any]:
        return urlFormEncode(value: value, keyConstructor: { "\(keyConstructor(rootKey))[\(idx)][\($0)]" })

      case let values as [Any]:
        return urlFormEncode(
          values: values, rootKey: "", keyConstructor: { _ in "\(keyConstructor(rootKey))[\(idx)]" }
        )

      default:
        return urlFormEncode(value: value, keyConstructor: { _ in "\(keyConstructor(rootKey))[\(idx)]" })
      }
    }
    .joined(separator: "&")
}

private func urlFormEncode(value: Any, keyConstructor: (String) -> String) -> String {
  guard let dictionary = value as? [String: Any] else {
    let encoded = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryParamAllowed) ?? value
    return "\(keyConstructor(""))=\(encoded)"
  }

  return dictionary
    .sorted(by: { $0.key < $1.key })
    .map { key, value in
      switch value {
      case let value as [String: Any]:
        return urlFormEncode(value: value, keyConstructor: { "\(keyConstructor(key))[\($0)]" })

      case let values as [Any]:
        return urlFormEncode(values: values, rootKey: key, keyConstructor: keyConstructor)

      default:
        return urlFormEncode(value: value, keyConstructor: { _ in keyConstructor(key) })
      }
    }
    .joined(separator: "&")
}

extension CharacterSet {
  public static let urlQueryParamAllowed = CharacterSet.urlQueryAllowed
    .subtracting(.init(charactersIn: ":#[]@!$&'()*+,;="))
}
