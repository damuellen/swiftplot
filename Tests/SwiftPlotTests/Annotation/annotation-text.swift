@testable import SwiftPlot
import SVGRenderer


@available(tvOS 13, watchOS 13, *)
extension AnnotationTests {

  func testAnnotationText() throws {
    
    let fileName = "_29_text_annotation"

    let x:[Float] = [10,100,263,489]
    let y:[Float] = [10,120,500,800]

    var lineGraph = LineGraph<Float, Float>(enablePrimaryAxisGrid: true)
    lineGraph.addSeries(x, y, label: "Plot 1", color: .lightBlue)
    lineGraph.plotTitle.title = "SINGLE SERIES"
    lineGraph.plotLabel.xLabel = "X-AXIS"
    lineGraph.plotLabel.yLabel = "Y-AXIS"
    lineGraph.plotLineThickness = 3.0

    lineGraph.addAnnotation(annotation: Text(text: "HELLO WORLD",
                                             color: Color(0.0, 0.0, 0.0, 0.5),
                                             size: 50.0,
                                             location: Point(300, 300)))

    try renderAndVerify(lineGraph, fileName: fileName)
  }
}
