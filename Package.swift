// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let platformTargets: [Target] = [
    .target(name: "SwiftPlot"),
    .target(
        name: "SVGRenderer",
        dependencies: ["SwiftPlot"]),
    
    .testTarget(
      name: "SwiftPlotTests",
      dependencies: ["SVGRenderer", "SwiftPlot"])
]
let platformProducts: [Product] =  [
  .library(name: "SwiftPlot", targets: ["SwiftPlot"]),
  .library(name: "SVGRenderer", targets: ["SVGRenderer"]),

]


let package = Package(
    name: "SwiftPlot",
    products: platformProducts,
    targets: platformTargets
)
