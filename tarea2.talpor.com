
server {
	listen 80 default_server;
	#listen [::]:80 default_server ipv6only=on;

	root /home/marcos/public_html;
	index tarea2/index.html;

	# Make site accessible from http://localhost/
	server_name tarea2.talpor.com;

	location / {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		try_files $uri $uri/ /index.html;
		# Uncomment to enable naxsi on this location
		# include /etc/nginx/naxsi.rules
	}

	location /doc/ {
		alias /usr/share/doc/;
		autoindex on;
		allow 127.0.0.1;
		allow ::1;
		deny all;
	}

}

