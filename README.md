# Inception-42
This project sets up a small web infrastructure using Docker and Docker Compose. It includes core services like NGINX, WordPress, and MariaDB, along with bonus services like Adminer, cAdvisor, FTP, Redis, and a static website. Each service runs in its own container, ensuring secure communication, persistent storage, and automatic restarts.
Core Services
1-NGINX:
  Handles web traffic with TLSv1.2 or TLSv1.3 for security.
  Runs on port 443 (HTTPS).
2-WordPress + php-fpm:
  Manages the WordPress website.
  Uses php-fpm to process PHP files.
  No NGINX inside this container.
3-MariaDB:
  Stores the WordPress database.
Bonus Services
1-Adminer:
  A web-based database management tool.
2-cAdvisor:
  Monitors container resource usage and performance.
3-FTP Server:
  Allows file transfers to/from the WordPress volume.
  Configured for easy file management.
4-Redis:
  Used as a caching system for WordPress to improve performance.
5-Static Website:
  A simple static website served by NGINX.
