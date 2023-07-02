FROM nginx:latest

# make the 'app' folder the current working directory
WORKDIR /etc/nginx/

RUN mkdir /etc/nginx/www

# copy both 'package.json' and 'package-lock.json' (if available)
COPY default.conf /etc/nginx/conf.d/

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY dist /etc/nginx/www


EXPOSE 8080
# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]