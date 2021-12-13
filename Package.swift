// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let platformTargets: [Target] = [
    .target(name: "SwiftPlot"),
    .testTarget(
      name: "SwiftPlotTests",
      dependencies: ["SwiftPlot"])
]
let platformProducts: [Product] =  [
  .library(name: "SwiftPlot", targets: ["SwiftPlot"]),
]

let package = Package(
    name: "SwiftPlot",
    products: platformProducts,
    targets: platformTargets
)
