import {PerformanceTime} from '/app/app.js'
import Environment from '/app/environment.js'

window.onload = function() {
   if (!Environment.isRunningInApp) {
      document.querySelectorAll(".nav").forEach((nav) =>{
         nav.style.display = "block";
      });
   }

   let performanceTime = new PerformanceTime()

   // Performance redirect
   var performanceURL = 'https://demo.audimance.org/live'

   performanceTime.addEventListener('Speech', function() {
      window.location.href = performanceURL
   })
}
