class GraphStatics
  attr_accessor :name, :data, :stack, :chart_title, :subtitle, :yAxis_title
  def initialize(options)
		@name = options[:name]
		@data = options[:data]
		@stack = options[:stack]
  end
  
  #CreateHistogram
  def self.createHistogram(chartTitle, categories, yAxisTitle, data)
    return  "<script type='text/javascript'>
			$(function () {

				$('#container1').highcharts({

					chart: {
						type: 'column'
					},

					title: {
						text: '#{chartTitle}'
					},

					xAxis: {
						categories: #{categories}
					},

					yAxis: {
						allowDecimals: false,
						min: 0,
						title: {
							text: '#{yAxisTitle}'
						}
					},

					tooltip: {
						formatter: function () {
							return '<b>' + this.x + '</b><br/>' +
								this.series.name + ': ' + this.y + '<br/>' +
								'Total: ' + this.point.stackTotal;
						}
					},

					plotOptions: {
						column: {
							stacking: 'normal'
						}
					},

					series:  #{data}

				});
			});
		</script>

	<div id='container1' style='min-width: 310px; height: 400px; margin: 0 auto'></div>"

  end #createHistogram 

#CreateHistogram Percentage
  def self.createHistogramPercentage(chartTitle, categories, yAxisTitle, data)
    return  "<script type='text/javascript'>
			$(function () {

				$('#container2').highcharts({

					chart: {
						type: 'column'
					},

					title: {
						text: '#{chartTitle}'
					},

					xAxis: {
						categories: #{categories}
					},

					yAxis: {
						min: 0,
						title: {
							text: '#{yAxisTitle}'
						}
					},

					tooltip: {
						pointFormat: '<span style=\"color:{series.color}\">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',
            					shared: true
					},

					plotOptions: {
						column: {
							stacking: 'percent'
						}
					},

					series:  #{data}

				});
			});
		</script>

	<div id='container2' style='min-width: 310px; height: 400px; margin: 0 auto'></div>"

  end #createHistogram Percentage

# createHistogramWithDecimals
def self.createHistogramWithDecimals(chartTitle, categories, yAxisTitle, data)
    return  "<script type='text/javascript'>
			$(function () {

				$('#container3').highcharts({

					chart: {
						type: 'column'
					},

					title: {
						text: '#{chartTitle}'
					},

					xAxis: {
						categories: #{categories}
					},

					yAxis: {
						allowDecimals: true,
						min: 0,
						title: {
							text: '#{yAxisTitle}'
						}
					},

					tooltip: {
						formatter: function () {
							return '<b>' + this.x + '</b><br/>' +
								this.series.name + ': ' + this.y + '<br/>' +
								'Total: ' + this.point.stackTotal;
						}
					},

					plotOptions: {
						column: {
							stacking: 'normal'
						}
					},

					series:  #{data}

				});
			});
		</script>

	<div id='container3' style='min-width: 310px; height: 400px; margin: 0 auto'></div>"

  end #createHistogram 

# createArea
def self.createArea(chartTitle, categories, yAxisTitle, data)
    return  "<script type='text/javascript'>
			$(function () {

				$('#container5').highcharts({

					chart: {
						type: 'area'
					},

					title: {
						text: '#{chartTitle}'
					},

					xAxis: {
						categories: #{categories},
						tickmarkPlacement: 'on',
					    title: {
						enabled: false
					    }
					},

					yAxis: {
						title: {
							text: '#{yAxisTitle}'
						},
					    labels: {
						formatter: function () {
						    return this.value ;
						}
					    }
					},

					tooltip: {
						shared: true,
		    				valueSuffix: ' '
					},

					plotOptions: {
						area: {
							stacking: 'normal',
							lineColor: '#666666',
							lineWidth: 1,
							marker: {
							    lineWidth: 1,
							    lineColor: '#666666'
							}
						    }
					},

					series:  #{data}

				});
			});
		</script>

	<div id='container5' style='min-width: 310px; height: 400px; margin: 0 auto'></div>"

  end #createArea 

  # createLineGraph
  def self.createLineGraph(chartTitle, subTitle, categories, yAxisTitle, data, valueSuffix)
    return  "<script type='text/javascript'>
			$(function () {
				$('#container4').highcharts({
					title: {
						text: '#{chartTitle}',
						x: 0 //center
					},
					subtitle: {
						text: '#{subTitle}',
						x: 0
					},
					xAxis: {
						categories: #{categories},
						x: -10
					},
					yAxis: {
						title: {
							text: '#{yAxisTitle}'
						},
						plotLines: [{
							value: 0,
							width: 1,
							color: '#808080'
						}]
					},
					tooltip: {
						valueSuffix: '#{valueSuffix}'
					},
					legend: {
						layout: 'vertical',
						align: 'right',
						verticalAlign: 'middle',
						borderWidth: 0
					},
					series: #{data}
				});
			});
		</script>

	<div id='container4' style='min-width: 310px; height: 400px; margin: 0 auto'></div>"

  end	# createLineGraph



end
