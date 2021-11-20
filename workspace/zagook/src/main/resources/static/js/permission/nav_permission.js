function getCoords() {
  return new Promise((resolve, reject) =>
    navigator.permissions ?

      // Permission API is implemented
      navigator.permissions.query({
        name: 'geolocation'
      }).then(permission =>
        // is geolocation granted?
        permission.state === "granted"
          ? navigator.geolocation.getCurrentPosition(pos => resolve(pos.coords)) 
          : resolve(null)
      ) :

    // Permission API was not implemented
    reject(new Error("Permission API is not supported"))
  )
}