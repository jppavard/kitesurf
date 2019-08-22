import "bootstrap";



import Slider from "bootstrap-slider";

console.log('toto')
var slider = new Slider('#ex1', {
  formatter: function(value) {
    return 'Current value: ' + value;
  }
});
