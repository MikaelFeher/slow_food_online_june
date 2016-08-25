function initMap() {
    // var map;
    map = GMaps({
        div: '#map',
        zoom: 12,
        lat: 57.7089,
        lng: 11.9746
    });
    getUserLocation(map);
}

function getUserLocation(map) {
    var environment = $('#map').data('test-env');
    if (environment === false) {
        GMaps.geolocate({
            success: function (position) {
                map.setCenter(position.coords.latitude, position.coords.longitude);
            },
            error: function (error) {
                alert('Geolocation failed: ' + error.message);
            },
            not_supported: function () {
                alert("Your browser does not support geolocation");
            }
        });
    } else {
        map.setCenter(57.7089, 11.98);
    }
}
