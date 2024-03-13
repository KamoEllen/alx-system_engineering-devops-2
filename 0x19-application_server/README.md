To set up and run a Flask application server:

1. **Setup Virtual Environment:**
   - To create a virtual environment (after installation):
     ```
     $ virtualenv <name_env>
     ```
   - To activate a virtual environment:
     ```
     $ source <name_env>/bin/activate
     ```

2. **Serve the Project with Gunicorn:**
   - Use Gunicorn to serve the project:
     ```
     $ gunicorn --bind 0.0.0.0:<port> <path_to_flask_route_file>:<name_of_Flask_instance>
     ```
     Example: 
     ```
     $ gunicorn --bind 0.0.0.0:8001 web_flask.0-hello_route:app
     ```
   - Verify the server is running by accessing the route:
     ```
     $ curl 0.0.0.0:8001/
     ```

3. **Setup Nginx to Listen to the Port/Route:**
   - Setup an upstart file (e.g., `0-welcome_gunicorn-upstart_config`).
   - Setup an Nginx conf file (e.g., `0-welcome_gunicorn-nginx_config`).
   - Restart Nginx to apply changes:
     ```
     $ sudo service nginx restart
     ```
   - Start the service:
     ```
     $ sudo service <name> start
     ```
   - Verify the Nginx setup by accessing the route:
     ```
     $ curl http://0.0.0.0:<port>
     ```

4. **Directories for Configuration Files:**
   - Directory to save the upstart file:
     ```
     /etc/init/<project_name>.conf
     ```
   - Directory to save the Nginx conf file:
     ```
     /etc/nginx/sites-available/<project_name>
     ```

5. **Link Nginx Conf File to `sites-enabled` Directory:**
   - Link the Nginx conf file to `sites-enabled` (restart Nginx after linking):
     ```
     $ sudo ln -s /etc/nginx/sites-available/<project_name> /etc/nginx/sites-enabled
     ```