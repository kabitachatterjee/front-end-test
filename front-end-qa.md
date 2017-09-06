## CDN
 CDN works by fetching static assets from your site's server and caching them on their servers. When a browser makes a request to visit your site, the static contents are served via the CDN rather than by your site. This is faster because the CDN servers are globally distributed and serve as proxies that determine which server is located physically closest to your visitor, thus delivering content on a speedier, more convenient network. Hence the full name: Content Delivery Network.
For all static assets used in our web application like images, css files and javascript files we need to update their relative paths to point to a CDN so the browser running the web application will know to take the static assets from the CDN and hence web pages are served much faster.
## Implementation steps

- Register your account with a CDN provider like Amazon AWS or MaxCDN.
- The CDN URL is the URL all of your assets will point to once things have been set up. A good rule of thumb is to use a URL name that is easy to do a search and replace in your database for all of your existing URLs.

- Define a global CDN variable in our javascript application and then prepend this variable to our static resources URLs.

- We can also setup a global CDN variable and prepend it to our CSS resources using a CSS preprocessor, like LESS or SASS.

- Anytime we wish to switch back from CDN to our webserver we can change the global CDN variable to '/'

- CDNs have a TTL(Time To Live) set for assets. This is the time in seconds after which an asset is considered stale and the CDN looks up on our server for a fresh copy of it.The longer the TTL, the longer a "version" of that asset will stay with the CDN and continue to be served. The shorter the TTL, the more often it ditches the "version" of the asset it stores and goes back to the original server to look for an updated version.

- If we make changes to our static assets on the server and if the TTL has not expired then the asset is still fresh and CDN will keep serving it without checking back with our web server.
- We need to use some sort of versioning on our files so that when the version changes, the CDN will refresh all of the assets as soon as we want to fully invalidate them.
We can do this by setting up a config file where we define a variable for the version number, import that variable into our asset URL structure and then change the version number each time we want to push a refresh of our assets across the board.
