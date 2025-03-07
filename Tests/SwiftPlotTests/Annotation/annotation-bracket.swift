@testable import SwiftPlot
import Foundation
import SVGRenderer


@available(tvOS 13, watchOS 13, *)
extension AnnotationTests {

  func testAnnotationBracket() throws {

    let fileName = "_35_bracket_annotation"

    var lineGraph = LineGraph<Float, Float>(enablePrimaryAxisGrid: true)
    lineGraph.addFunction(sin, minX: -5.0, maxX: 5.0, label: "sin(x)", color: .lightBlue)
    lineGraph.plotTitle.title = "FUNCTION"
    lineGraph.plotLabel.xLabel = "X-AXIS"
    lineGraph.plotLabel.yLabel = "Y-AXIS"
    lineGraph.plotLineThickness = 3.0

    lineGraph.addAnnotation(annotation: Bracket(start: Coordinate(point: Point(150.0, 607.0)),
                                                end: Coordinate(point: Point(630.0, 607.0)),
                                                anchorableAnnotation: Text(text: "Period",
                                                                           direction: .south)))
    lineGraph.addAnnotation(annotation: Bracket(start: Coordinate(point: Point(900, 585.0)),
                                                end: Coordinate(point: Point(900, 340.0)),
                                                anchorableAnnotation: Text(text: "Amplitude",
                                                                           direction: .east)))
    let svg_renderer = SVGRenderer()
    try lineGraph.drawGraphAndOutput(fileName: svgOutputDirectory+fileName,
                                     renderer: svg_renderer)
    verifyImage(name: fileName, renderer: .svg)
    #if canImport(AGGRenderer)
    let agg_renderer = AGGRenderer()
    try lineGraph.drawGraphAndOutput(fileName: aggOutputDirectory+fileName,
                                     renderer: agg_renderer)
    verifyImage(name: fileName, renderer: .agg)
    #endif
    /*
    #if canImport(QuartzRenderer)
    let quartz_renderer = QuartzRenderer()
    try lineGraph.drawGraphAndOutput(fileName: coreGraphicsOutputDirectory+fileName,
                                     renderer: quartz_renderer)
    verifyImage(name: fileName, renderer: .coreGraphics)
    #endif
    */
  }
}
