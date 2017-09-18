## WP Super Cache Plugin

There are other ways to improve WordPress performance that don't require a second server and load balancing.
Wordpress is a heavy "read" site (vs. write). We can increase the requests per second by serving static versions of your most popular posts. The best plugin for that is: WP Super Cache. Since there is more "read" traffic so we don't actually require to purge the cache too often.
This plugin generates static html files from the dynamic WordPress blog. After a html file is generated your web server will serve that file instead of processing the comparatively heavier and more expensive WordPress PHP scripts.

The static html files will be served to the vast majority of the users like
- Users who are not logged in.
- Users who have not left a comment on your blog.
- Or users who have not viewed a password protected post.
99% of your visitors will be served static html files. One cached file can be served thousands of times. Other visitors will be served custom cached files tailored to their visit. If they are logged in, or have left comments those details will be displayed and cached for them.
