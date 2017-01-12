function secondsToTime(secs) {
    var hours   = Math.floor(secs / 3600);
    var minutes = Math.floor((secs - (hours * 3600)) / 60);
    var seconds = secs - (hours * 3600) - (minutes * 60);

    if (hours   < 10) {hours   = "0"+hours;}
    if (minutes < 10) {minutes = "0"+minutes;}
    if (seconds < 10) {seconds = "0"+seconds;}
    var time    = hours+':'+minutes+':'+seconds;
    return time;
}
