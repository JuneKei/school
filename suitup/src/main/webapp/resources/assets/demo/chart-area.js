// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

var maxvalue = Math.max(
	  $('#daysum14').val(),
  	  $('#daysum13').val(),
	  $('#daysum12').val(),
	  $('#daysum11').val(),
	  $('#daysum10').val(),
	  $('#daysum9').val(),
	  $('#daysum8').val(),
	  $('#daysum7').val(),
	  $('#daysum6').val(),
	  $('#daysum5').val(),
	  $('#daysum4').val(),
	  $('#daysum3').val(),
	  $('#daysum2').val(),
	  $('#daysum1').val()    	);
var minvalue = Math.min(
	  $('#daysum14').val(),
  	  $('#daysum13').val(),
	  $('#daysum12').val(),
	  $('#daysum11').val(),
	  $('#daysum10').val(),
	  $('#daysum9').val(),
	  $('#daysum8').val(),
	  $('#daysum7').val(),
	  $('#daysum6').val(),
	  $('#daysum5').val(),
	  $('#daysum4').val(),
	  $('#daysum3').val(),
	  $('#daysum2').val(),
	  $('#daysum1').val()    	);
var maxLength= maxvalue.toString().length-1;
var minLength= minvalue.toString().length-1;
var maxten=10;
var minten=10;
for(var i=1;i<maxLength;i++){
	 maxten *=10;
}
for(var i=1;i<minLength;i++){
	 minten *=10;
}
var maxResult = Math.ceil(maxvalue/maxten)*maxten;
var minResult = Math.floor(minvalue/minten)*minten;

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: [  
    	$('#day14').val()+"일",
    	$('#day13').val()+"일",
    	$('#day12').val()+"일",
    	$('#day11').val()+"일",
    	$('#day10').val()+"일",
    	$('#day9').val()+"일",
    	$('#day8').val()+"일",
    	$('#day7').val()+"일",
    	$('#day6').val()+"일",
    	$('#day5').val()+"일",
    	$('#day4').val()+"일",
    	$('#day3').val()+"일",
    	$('#day2').val()+"일",
    	$('#day1').val()+"일"
    	],
    datasets: [{
      label: "Sessions",
      lineTension: 0.3,
      backgroundColor: "rgba(2,117,216,0.2)",
      borderColor: "rgba(2,117,216,1)",
      pointRadius: 5,
      pointBackgroundColor: "rgba(2,117,216,1)",
      pointBorderColor: "rgba(255,255,255,0.8)",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "rgba(2,117,216,1)",
      pointHitRadius: 50,
      pointBorderWidth: 2,
      data: [
    	  $('#daysum14').val(),
    	  $('#daysum13').val(),
    	  $('#daysum12').val(),
    	  $('#daysum11').val(),
    	  $('#daysum10').val(),
    	  $('#daysum9').val(),
    	  $('#daysum8').val(),
    	  $('#daysum7').val(),
    	  $('#daysum6').val(),
    	  $('#daysum5').val(),
    	  $('#daysum4').val(),
    	  $('#daysum3').val(),
    	  $('#daysum2').val(),
    	  $('#daysum1').val()    	  
    	  ],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 14
        }
      }],
      yAxes: [{
        ticks: {
          min: minResult,
          max: maxResult,
          maxTicksLimit: 10
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
