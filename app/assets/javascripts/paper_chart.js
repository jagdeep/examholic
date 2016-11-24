function paperPieChart(id, labels, data){
  var ctx = document.getElementById(id);
  // var borders = [];
//   var colors = [];
//   for(i=0; i<labels.length; i++){
//     colors.push(dynamicColors());
//     borders.push(dynamicHovers());
//   }
  var data = {
    labels: labels,
    datasets: [{ data: data, 
      backgroundColor: dynamicColors, 
      hoverBackgroundColor: dynamicHovers
    }],
  };
  var myPieChart = new Chart(ctx, {
      type: 'pie',
      data: data
  });
}

