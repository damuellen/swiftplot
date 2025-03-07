import SwiftPlot
import SVGRenderer


extension HistogramTests {
  
  /// Regression test [#57]. We used to fail to clear the histogram state between renders,
  /// leading to slight offsets in the subsequent AGG and CG renders.
  func testHistogramStackedStepOffset() throws {
    let fileName = "_reg_57_histogram_stacked_step_offset"
    
    var histogram = Histogram<Float>(isNormalized: false, enableGrid: true)
    histogram.addSeries(data: [5], bins: 10, label: "Plot 1", color: .blue, histogramType: .step)
    histogram.addStackSeries(data: [6], label: "Plot 2", color: .orange)
    histogram.plotTitle = PlotTitle("HISTOGRAM STACKED STEP")
    histogram.plotLabel = PlotLabel(xLabel: "X", yLabel: "Frequency")
    
    // Note: This does not use renderAndVerify because it is explicitly testing
    //       rendering the plot a second time.
    
    // TODO: Replace AGG/Quartz renderers with 2 SVG renders.
    
    let svg_renderer = SVGRenderer()
    try histogram.drawGraphAndOutput(fileName: svgOutputDirectory+fileName,
                                     renderer: svg_renderer)
    verifyImage(name: fileName, renderer: .svg)
    #if canImport(AGGRenderer)
    let agg_renderer = AGGRenderer()
    try histogram.drawGraphAndOutput(fileName: aggOutputDirectory+fileName,
                                     renderer: agg_renderer)
    verifyImage(name: fileName, renderer: .agg)
    #endif
    #if canImport(QuartzRenderer)
    let quartz_renderer = QuartzRenderer()
    try histogram.drawGraphAndOutput(fileName: coreGraphicsOutputDirectory+fileName,
                                     renderer: quartz_renderer)
    verifyImage(name: fileName, renderer: .coreGraphics)
    #endif
  }
}
