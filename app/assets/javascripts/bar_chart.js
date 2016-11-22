function BarChart(labels, data, label){
  var ctx = document.getElementById("myChart");
  var borders = [];
  var colors = [];
  for(i=0; i<labels.length; i++){
    colors.push('rgba(54, 162, 235, 0.2)');
    borders.push('rgba(54, 162, 235, 1)');
  }
  var borders2 = [];
  var colors2 = [];
  for(i=0; i<labels.length; i++){
    colors2.push('rgba(255, 99, 132, 0.2)');
    borders2.push('rgba(255,99,132,1)');
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
      },{
        label: '# of '+label,
        data: data,
        backgroundColor: colors2,
        borderColor: borders2,
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
