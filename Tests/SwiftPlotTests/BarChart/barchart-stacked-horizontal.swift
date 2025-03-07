import SwiftPlot
import SVGRenderer


@available(tvOS 13, watchOS 13, *)
extension BarchartTests {
  
  func testBarchartStackedHorizontal() throws {
    
    let fileName = "_19_bar_chart_horizontal_stacked"
    
    let x:[String] = ["2008","2009","2010","2011"]
    let y:[Float] = [320,-100,420,500]
    let y1:[Float] = [100,100,220,245]

    var barGraph = BarGraph<String,Float>(enableGrid: true)
    barGraph.addSeries(x, y, label: "Plot 1", color: .orange, graphOrientation: .horizontal)
    barGraph.addStackSeries(y1, label: "Plot 2", color: .blue)
    barGraph.plotTitle = PlotTitle("BAR CHART")
    barGraph.plotLabel = PlotLabel(xLabel: "X-AXIS", yLabel: "Y-AXIS")
    
    try renderAndVerify(barGraph, fileName: fileName)
  }
}
