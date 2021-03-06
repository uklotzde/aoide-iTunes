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

public struct Release: Equatable {

    public init(
        released_at: Date?,
        released_by: String?,
        copyright: String?,
        licenses: [String]
    ) {
        self.released_at = released_at
        self.released_by = released_by
        self.copyright = copyright
        self.licenses = licenses
    }


    public let released_at: Date?

    public let released_by: String? // record label

    public let copyright: String?
    
    public let licenses: [String]
}
