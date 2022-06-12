
	var map_getting;
	var current_zoom = 13;

	function initialize(map_center) {
		var marker = new google.maps.Marker({
			position: map_center,
			draggable:true,
			title:"Drag me!"
		});

		var map_prop = {
			center: map_center,
			zoom: current_zoom,
			minZoom: 8,
			streetViewControl: false,
			zoomControl: true,
			zoomControlOptions: {
				position: google.maps.ControlPosition.TOP_RIGHT
			},
			mapTypeControl: false
        };

        map_getting = new google.maps.Map(document.getElementById("map_canvas"), map_prop);
        marker.setMap(map_getting);

        google.maps.event.addListener(marker, 'dragend', function(evt){

        	$('#get_lat').val(evt.latLng.lat());
        	$('#get_lng').val(evt.latLng.lng());
          $('#btn_get_latlng').prop('disabled', false);
        });

        google.maps.event.addListener(map_getting, "click", function(evt){
        	marker.setPosition(new google.maps.LatLng(evt.latLng.lat(), evt.latLng.lng()));
        	// map_getting.setCenter(new google.maps.LatLng(evt.latLng.lat(), evt.latLng.lng()));

        	$('#get_lat').val(evt.latLng.lat());
        	$('#get_lng').val(evt.latLng.lng());
          $('#btn_get_latlng').prop('disabled', false);
        });

        // search and go to positon ************************************************************************
        var input = document.getElementById('pac-input');
        var searchBox = new google.maps.places.SearchBox(input);
        // map_getting.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        map_getting.addListener('bounds_changed', function() {
          searchBox.setBounds(map_getting.getBounds());
        });

        searchBox.addListener('places_changed', function() {
          var places = searchBox.getPlaces();

          if (places.length == 0) {
            return;
          }

          var bounds = new google.maps.LatLngBounds();
          places.forEach(function(place) {

            if (place.geometry.viewport) {
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            }
          });

          map_getting.fitBounds(bounds);
        });
        // search and go to positon ************************************************************************
    };