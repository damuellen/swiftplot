import SwiftPlot
import SVGRenderer


@available(tvOS 13, watchOS 13, *)
extension LineChartTests {
  
  func testLineChartSecondaryAxis() throws {
    
    let fileName = "_07_secondary_axis_line_chart"
    
    let x:[Float] = [10,100,263,489]
    let y:[Float] = [10,120,500,800]
    let x1:[Float] = [100,200,361,672]
    let y1:[Float] = [150,250,628,800]
    
    var lineGraph = LineGraph<Float,Float>()
    lineGraph.addSeries(x1,y1,label: "Plot 1",color: .lightBlue,axisType: .primaryAxis)
    lineGraph.addSeries(x, y, label: "Plot 2", color: .orange, axisType: .secondaryAxis)
    lineGraph.plotTitle = PlotTitle("SECONDARY AXIS")
    lineGraph.plotLabel = PlotLabel(xLabel: "X-AXIS", yLabel: "Y-AXIS")
    lineGraph.plotLabel.y2Label = "Y2-AXIS"
    lineGraph.plotLineThickness = 3.0
    
    try renderAndVerify(lineGraph, fileName: fileName)
  }
}
