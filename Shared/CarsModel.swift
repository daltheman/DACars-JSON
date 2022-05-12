//
//  CarsModel.swift
//  DACars-JSON
//
//  Created by Danilo Altheman on 11/05/22.
//

import Foundation

struct Cars: Codable, Hashable {
    let objectId: String?
    let year: Int?
    let make: String?
    let model: String?
    let category: String?
    let createdAt: String?
    let updatedAt: String?
    
}
/*
Excerpt from
https://www.hackingwithswift.com/books/ios-swiftui/loading-a-specific-kind-of-codable-data
*/
extension Bundle {
    func decode<T: Codable>(_ file: String, type: T.Type = T.self, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
                            keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        
        /* Usage
         let object: ModelObject = bundle.decode(“<file path>”)
         let object = bundle.decode(“<file path>”, type: ModelObject.self)
         */
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}


/* Debugging Solution
 let decoder = JSONDecoder()
 decoder.dateDecodingStrategy = dateDecodingStrategy
 decoder.keyDecodingStrategy = keyDecodingStrategy
 
 do {
 return try decoder.decode(T.self, from: data)
 } catch DecodingError.keyNotFound(let key, let context) {
 fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' - \(context.debugDescription)")
 } catch DecodingError.typeMismatch(_, let context) {
 fatalError("Failed to decode \(file) from bundle due to type mismatch - \(context.debugDescription)")
 } catch DecodingError.valueNotFound(let type, let context) {
 fatalError("Failed to decode \(file) from bundle due to missing \(type) value = \(context.debugDescription)")
 } catch DecodingError.dataCorrupted(_) {
 fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON.")
 } catch {
 fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
 }
 }
 */
