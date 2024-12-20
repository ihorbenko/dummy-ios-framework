import ottu_checkout_sdk_bin
import SVGKit
import Sentry

public class OttuSDK {
    public init() {
        print("OttuSDK initialized")
    }

    public func testSVGKit() {
        let svgImage = SVGKImage(contentsOf: URL(string: "https://example.com/image.svg")!)
        print("Loaded SVG image: \(svgImage)")
    }

    public func testSentry() {
        SentrySDK.start { options in
            options.dsn = "https://examplePublicKey@o0.ingest.sentry.io/0"
            options.debug = true
        }
        print("Sentry initialized")
    }
}
