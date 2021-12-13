import SwiftPlot
import SVGRenderer


@available(tvOS 13, watchOS 13, *)
extension HistogramTests {
  
  func testHistogramStep() throws {
    let fileName = "_22_histogram_step"
    
    var histogram = Histogram<Float>(isNormalized: false, enableGrid: true)
    histogram.addSeries(data: histogram_step_values,
                        bins: 50,
                        label: "Plot 1",
                        color: .blue,
                        histogramType: .step)
    histogram.plotTitle = PlotTitle("HISTOGRAM STEP")
    histogram.plotLabel = PlotLabel(xLabel: "X", yLabel: "Frequency")
    
    try renderAndVerify(histogram, fileName: fileName)
  }
}
