import SwiftImage
import ArgumentParser
import PathKit

@main
struct SnapshotEnhance: ParsableCommand {
    @Option(name: .shortAndLong, transform: { Path.current + $0 })
    var input: Path

    @Option(name: .shortAndLong, transform: { Path.current + $0 })
    var output: Path

    @MainActor
    mutating func run() throws {
        let imageData = try input.read()

        guard let image = Image<RGBA<UInt8>>(data: imageData) else {
            print("Unable to decode image at \(input)")
            return
        }

        let processed = image.map { $0 == .black ? RGBA<UInt8>.black : .red }

        guard let data = processed.pngData() else {
            print("Unable to encode image at \(input)")
            return
        }

        try output.write(data)

        print("Done!")
    }
}
