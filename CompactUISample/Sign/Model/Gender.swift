//
//  Gender.swift
//  CompactUISample
//  
//  Created by 190yamayama on 2024/06/14
//  
//

enum Gender: CaseIterable {
    case male
    case woman
    case other
}

extension Gender {
    var key: String {
        "\(self)"
    }

    var value: String {
        "\(self)"
    }

    static func toTuple() -> [(key: String, value: String)] {
        Gender.allCases.map { (key: $0.key, value: $0.value )}
    }

    static func make(key: String) -> Gender {
        Gender.allCases.first(where: { $0.key == key }) ?? .male
    }

}
