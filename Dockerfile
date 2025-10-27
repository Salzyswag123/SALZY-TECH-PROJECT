
# Production Dockerfile — serve the compiled static site with nginx
# Copies only the site files needed for runtime (index and static directories)
FROM nginx:stable-alpine

LABEL maintainer="you@example.com"
LABEL description="Atelier Penha — static site served by nginx"

# Copy custom nginx config
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf

# Copy minimal site files into the nginx html directory. This keeps the image
# smaller than copying the entire repository. Add or remove COPY lines below
# if the site relies on other top-level files.
COPY index.html /usr/share/nginx/html/index.html
COPY 3DRoom.html /usr/share/nginx/html/3DRoom.html
COPY project.html /usr/share/nginx/html/project.html
COPY 404.html /usr/share/nginx/html/404.html

# Copy WordPress static exports (theme public, resources and uploads)
COPY wp-content /usr/share/nginx/html/wp-content
COPY wp-includes /usr/share/nginx/html/wp-includes

EXPOSE 80
#yh
CMD ["nginx", "-g", "daemon off;"]
