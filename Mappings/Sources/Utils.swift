// Copyright (C) 2020 Ferran Pujol Camins et al.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program. If not, see <https://www.gnu.org/licenses/>.

import Foundation

extension Array {
    static func pure(_ e: Element) -> Self {
        [e]
    }
}

extension Date {
    static func forYear(_ year: Int) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        dateFormatter.timeZone = TimeZone.init(secondsFromGMT: 0)
        return dateFormatter.date(from: "\(year)")
    }
}

extension Optional {
    /// Return the first value that is not nil
    static func first(_ optionals: [Optional]) -> Optional {
        for optional in optionals {
            if optional != nil {
                return optional
            }
        }
        return nil
    }
}

func validate<Wrapped>(_ optional: Wrapped?, _ condition: (Wrapped) -> Bool) -> Wrapped? {
    optional.flatMap { value in
        if condition(value) {
            return value
        } else {
            return nil
        }
    }
}

func validate<Wrapped>(_ value: Wrapped, _ condition: (Wrapped) -> Bool) -> Wrapped? {
    if condition(value) {
        return value
    } else {
        return nil
    }
}
