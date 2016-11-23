function BarChart(labels, data, label){
  var ctx = document.getElementById("myChart");
  var borders = [];
  var colors = [];
  for(i=0; i<labels.length; i++){
    colors.push(dynamicColors());
    borders.push(dynamicBorders());
  }
  var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: labels,
      datasets: [{
        label: '# of '+label,
        data: data,
        backgroundColor: colors,
        borderColor: borders,
        borderWidth: 1
      }]
    },
    options: { 
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero:true
          }
        }]
      }
    }
  });
}
