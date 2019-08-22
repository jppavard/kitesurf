import "bootstrap";
import Slider from "bootstrap-slider";

console.log('toto')
var slider = new Slider('#ex1', {
  formatter: function(value) {
    return 'Current value: ' + value;
  }
});

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';


import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';

initMapbox();
initAutocomplete();

