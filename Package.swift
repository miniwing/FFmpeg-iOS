// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "FFmpeg-iOS",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "FFmpeg-iOS",
            targets: [
                "avcodec", "avutil", "avformat", "avfilter", "avdevice", "swscale", "swresample",
                "Depend", "fftools", "Hook", "FFmpegSupport",
            ]),
    ],
    targets: [
        .binaryTarget(name: "avcodec", path: "Frameworks/avcodec.xcframework"),
        .binaryTarget(name: "avutil", path: "Frameworks/avutil.xcframework"),
        .binaryTarget(name: "avformat", path: "Frameworks/avformat.xcframework"),
        .binaryTarget(name: "avfilter", path: "Frameworks/avfilter.xcframework"),
        .binaryTarget(name: "avdevice", path: "Frameworks/avdevice.xcframework"),
        .binaryTarget(name: "swscale", path: "Frameworks/swscale.xcframework"),
        .binaryTarget(name: "swresample", path: "Frameworks/swresample.xcframework"),
        .binaryTarget(name: "fftools", path: "Frameworks/fftools.xcframework"),
        .target(name: "Depend",
                linkerSettings: [
                    .linkedLibrary("z"),
                    .linkedLibrary("bz2"),
                    .linkedLibrary("iconv"),
                    .linkedFramework("AVFoundation"),
                    .linkedFramework("VideoToolbox"),
                    .linkedFramework("CoreMedia"),
                ]
        ),
        .target(name: "Hook", dependencies: [
            "fftools",
            "avcodec", "avformat", "avfilter", "avdevice", "avutil", "swscale", "swresample",
            "Depend",
        ]),
        .target(name: "FFmpegSupport", dependencies: [
            "Hook",
        ]),
        .testTarget(name: "FFmpeg-iOSTests",
                    dependencies: ["FFmpegSupport",]),
    ]
)
