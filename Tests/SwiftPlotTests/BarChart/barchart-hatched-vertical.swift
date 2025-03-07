import SwiftPlot
import SVGRenderer


@available(tvOS 13, watchOS 13, *)
extension BarchartTests {
  
  func testBarchartHatchedVertical() throws {
    
    let fileName = "_12_bar_chart_vertical_hatched"
    
    let x:[String] = ["2008","2009","2010","2011"]
    let y:[Float] = [320,-100,420,500]

    var barGraph = BarGraph<String,Float>(enableGrid: true)
    barGraph.addSeries(x, y, label: "Plot 1", color: .orange, hatchPattern: .vertical)
    barGraph.plotTitle = PlotTitle("HATCHED BAR CHART")
    barGraph.plotLabel = PlotLabel(xLabel: "X-AXIS", yLabel: "Y-AXIS")
    
    try renderAndVerify(barGraph, fileName: fileName)
  }
}
