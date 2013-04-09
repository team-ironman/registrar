var start = new Date().getTime(); 
var elapsed = '0.0'; 
var t;
var timer_is_on=0;

function timedCount() {
var time = new Date().getTime() - start;
elapsed = Math.floor(time / 100) / 10; 
if(Math.round(elapsed) == elapsed) { elapsed += '.0'; } 
document.getElementById('txt').value=elapsed;
t=setTimeout("timedCount()",50);
}

function doTimer() {
if (!timer_is_on) {
    start = new Date().getTime(); 
    timer_is_on=1;
    timedCount();
}
}

function stopCount() {
clearTimeout(t);
timer_is_on=0;
}

function resetCount() {
document.getElementById('txt').value='0.0';
var elapsed = '0.0';
}





// function StopWatch(){
    
//     var startTime = null;
//     var stopTime = null;
//     var running = false;
    
//     this.start = function(){
        
//         if (running == true)
//            return;
//        else if (startTime != null)
//            stopTime = null;
       
//        running = true;    
//        startTime = getTime();
//    }
   
//    this.stop = function(){
       
//        if (running == false)
//            return;    
       
//        stopTime = getTime();
//        running = false;
//    }
   
//    this.duration = function(){
//        if (startTime == null || stopTime == null)
//            return 'Undefined';
//        else
//            return (stopTime - startTime) / 1000;
//    }
   
//    this.isRunning = function() { return running; }
   
//    function getTime(){
//        var day = new Date();
//        return day.getTime();
//    }
   
   
//    }
