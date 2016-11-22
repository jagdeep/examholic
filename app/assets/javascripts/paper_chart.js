function paperPieChart(id, labels, data){
  var ctx = document.getElementById(id);
  var data = {
    labels: labels,
    datasets: [{ data: data, backgroundColor: [ "#FF6384", "#36A2EB", "#FFCE56" ], hoverBackgroundColor: [ "#FF6384", "#36A2EB", "#FFCE56" ]} ],
  };
  var myPieChart = new Chart(ctx, {
      type: 'pie',
      data: data
  });
}

