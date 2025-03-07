import SwiftPlot
import SVGRenderer


@available(tvOS 13, watchOS 13, *)
extension LineChartTests {
  
  func testLineChartSubplotHorizontallyStacked() throws {
    
    let fileName = "_03_sub_plot_horizontally_stacked_line_chart"
    
    let x:[Float] = [10,100,263,489]
    let y:[Float] = [10,120,500,800]
    
    var subPlot = SubPlot(layout: .horizontal)

    var lineGraph1 = LineGraph<Float,Float>(enablePrimaryAxisGrid: true)
    lineGraph1.addSeries(x, y, label: "Plot 1", color: .lightBlue)
    lineGraph1.plotTitle = PlotTitle("PLOT 1")
    lineGraph1.plotLabel = PlotLabel(xLabel: "X-AXIS", yLabel: "Y-AXIS")
    lineGraph1.plotLineThickness = 3.0
    
    var lineGraph2 = LineGraph<Float,Float>(enablePrimaryAxisGrid: true)
    lineGraph2.addSeries(x, y, label: "Plot 2", color: .orange)
    lineGraph2.plotTitle = PlotTitle("PLOT 2")
    lineGraph2.plotLabel = PlotLabel(xLabel: "X-AXIS", yLabel: "Y-AXIS")
    lineGraph2.plotLineThickness = 3.0
    
    subPlot.plots = [lineGraph1, lineGraph2]
    
    try renderAndVerify(subPlot, fileName: fileName)
  }
}
