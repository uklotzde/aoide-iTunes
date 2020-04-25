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
import AoideModel
import ITunesModel

extension ITLibMediaItemProtocol {

    func mapToAoide() -> Track {
        Track(
            media_sources: sources(),
            release: release(),
            album: _album.mapToAoide(),
            titles: titles(),
            actors: _artist?.mapToAoide().map(Array.pure) ?? [],
            indexes: indexes(),
            markers: markers(),
            tags: tags()
        )
    }

    func release() -> Release {
        Release(
            released_at: releaseDate,
            released_by: nil,
            copyright: nil,
            licenses: []
        )
    }

    func titles() -> [Title] {
        (title.count > 0 ? title : sortTitle ?? "")
            .map(Title.default)
            .map(Array.pure)
            ?? []
    }

    func sources() -> [Source] {
        [Source(
            uri: location!.absoluteString,
            content_type: "iTunes",
            content: .audio(audioContent())
        )]
    }

    func audioContent() -> AudioContent {
        AudioContent(
            channels: .layout(.stereo),
            duration: Double(totalTime),
            sample_rate: UInt32(sampleRate),
            bit_rate: UInt32(bitrate),
            loudness: nil,
            encoder: nil
        )
    }

    func indexes() -> Indexes {
        Indexes(
            disc: Index(number: UInt16(_album.discNumber), total: UInt16(_album.discCount)),
            track: Index(number: UInt16(trackNumber), total: UInt16(_album.trackCount)),
            movement: Index(number: 0, total: 0)
        )
    }

    func markers() -> Markers {
        Markers(
            positions: .empty,
            beats: BeatMarkers(
                state: .readOnly,
                markers: [BeatMarker(
                    start: 0,
                    end: nil,
                    tempo: TempoBpm(beatsPerMinute),
                    timing: nil,
                    beat_at_start: nil
                )]
            ),
            keys: .empty
        )
    }

    func tags() -> Tags {
        [:]
    }
}