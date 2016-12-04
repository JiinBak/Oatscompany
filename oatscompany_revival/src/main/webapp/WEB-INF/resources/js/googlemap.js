		function initMap() {
			var myLatlng = new google.maps.LatLng(37.5238862196042, 126.98650360107422);
			var map = new google.maps.Map(document.getElementById('map'), {
				center : myLatlng,
				scrollwheel : true,
				zoom : 10
			});

			var marker = new google.maps.Marker({
				draggable : true,
				position : myLatlng,
				map : map,
				title : "Your location"
			});

			google.maps.event.addListener(marker, 'dragend', function(event) {
				document.getElementById("lat").value = event.latLng.lat();
				document.getElementById("long").value = event.latLng.lng();

			});

			google.maps.event.addListener(map, 'click', function(event) {
				document.getElementById("lat").value = event.latLng.lat();
				document.getElementById("long").value = event.latLng.lng();
				document.getElementById("latLng").value = event.latLng;
				marker.setPosition(event.latLng);
				geocodeLatLng(geocoder, map, event.latLng.lat(), event.latLng.lng());

			});

			var geocoder = new google.maps.Geocoder;

		}
		function geocodeLatLng(geocoder, map, lat_, lng_) {
			var latlng = {
				lat : parseFloat(lat_),
				lng : parseFloat(lng_)
			};
			geocoder.geocode({
				'location' : latlng
			}, function(results, status) {
				if (status === google.maps.GeocoderStatus.OK) {
					if (results[1]) {
						map.setZoom(11);
						//var marker = new google.maps.Marker({
						//	position : latlng,
						//	map : map
						//});
						document.getElementById("inputaddress").value = results[1].formatted_address ;
					} else {
						window.alert('No results found');
					}
				} else {
					window.alert('Geocoder failed due to: ' + status);
				}
			});
		}
