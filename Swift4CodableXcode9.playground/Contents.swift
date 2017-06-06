import UIKit

enum PetType: String, Codable {
  case cat
  case dog
}

struct Pet: Codable {
  let name: String
  let type: PetType
}

struct Human: Codable {
  let lastName: String
  let firstName: String
  let pets: [Pet]
}

extension Human {
  func toData() -> Data? {
    return try? JSONEncoder().encode(self)
  }
  
  init(data: Data) throws {
    self = try JSONDecoder().decode(Human.self, from: data)
  }
}

// Usage Example
let tsuki = Pet(name: "Tsuki", type: .cat)
let steven = Human(lastName: "Watremez", firstName: "Steven", pets: [tsuki])

let dataHuman = steven.toData()
do {
  let human = try Human.init(data: dataHuman!)
  print("""
    \(human.firstName) \(human.lastName) has a pet named \(steven.pets.first!.name).
    \(steven.pets.first!.name) is a \(steven.pets.first!.type.rawValue) !
    """)
} catch {
  // catch error
}
