import SwiftPlot
import SVGRenderer


@available(tvOS 13, watchOS 13, *)
extension LineChartTests {
  
  func testLineChartMultipleSeries() throws {
    
    let fileName = "_02_multiple_series_line_chart"
    
    let x1:[Float] = [10,100,263,489]
    let y1:[Float] = [10,120,500,800]
    let x2:[Float] = [100,200,361,672]
    let y2:[Float] = [150,250,628,800]
    
    var lineGraph = LineGraph<Float,Float>(enablePrimaryAxisGrid: true)
    lineGraph.addSeries(x1, y1, label: "Plot 1", color: .lightBlue)
    lineGraph.addSeries(x2, y2, label: "Plot 2", color: .orange)
    lineGraph.plotTitle = PlotTitle("MULTIPLE SERIES")
    lineGraph.plotLabel = PlotLabel(xLabel: "X-AXIS", yLabel: "Y-AXIS")
    lineGraph.plotLineThickness = 3.0
    
    try renderAndVerify(lineGraph, fileName: fileName)
  }
}
