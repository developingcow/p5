#!/bin/bash
export HOME=/home/ubuntu # not set on default

sudo apt update
sudo apt install -y mysql-server
sudo systemctl start mysql.service

# change mysql to listen on all interfaces (0.0.0.0) and restart
sudo sed -i 's/^bind-address\s*=\s*127\.0\.0\.1/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql

sudo mysql -e "\
CREATE DATABASE IF NOT EXISTS game;\
CREATE TABLE IF NOT EXISTS game.stats (playerName VARCHAR(255), points INT, team VARCHAR(255));\
INSERT INTO game.stats (playerName, points, team) VALUES ('Wolf 1', 25, 'Wolves');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Bear 2', 99, 'Bears');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Bear 1', 0, 'Bears');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Wolf 2', 25, 'Wolves');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Chicken 2', 9, 'Chickens');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Chicken 1', 1, 'Chickens');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Wolf 3', 30, 'Wolves');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Wolf 4', 45, 'Wolves');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Wolf 5', 15, 'Wolves');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Wolf 6', 20, 'Wolves');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Wolf 7', 55, 'Wolves');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Wolf 8', 35, 'Wolves');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Wolf 9', 40, 'Wolves');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Wolf 10', 60, 'Wolves');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Wolf 11', 25, 'Wolves');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Wolf 12', 50, 'Wolves');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Bear 3', 75, 'Bears');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Bear 4', 65, 'Bears');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Bear 5', 85, 'Bears');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Bear 6', 55, 'Bears');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Bear 7', 95, 'Bears');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Bear 8', 20, 'Bears');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Bear 9', 10, 'Bears');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Bear 10', 30, 'Bears');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Bear 11', 40, 'Bears');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Bear 12', 70, 'Bears');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Chicken 3', 5, 'Chickens');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Chicken 4', 10, 'Chickens');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Chicken 5', 15, 'Chickens');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Chicken 6', 8, 'Chickens');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Chicken 7', 12, 'Chickens');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Chicken 8', 7, 'Chickens');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Chicken 9', 14, 'Chickens');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Chicken 10', 6, 'Chickens');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Chicken 11', 3, 'Chickens');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Chicken 12', 11, 'Chickens');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Wolf 13', 65, 'Wolves');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Wolf 14', 75, 'Wolves');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Wolf 15', 85, 'Wolves');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Wolf 16', 95, 'Wolves');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Wolf 17', 55, 'Wolves');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Wolf 18', 45, 'Wolves');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Wolf 19', 35, 'Wolves');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Wolf 20', 25, 'Wolves');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Bear 13', 80, 'Bears');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Bear 14', 90, 'Bears');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Bear 15', 100, 'Bears');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Bear 16', 110, 'Bears');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Bear 17', 120, 'Bears');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Bear 18', 130, 'Bears');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Bear 19', 140, 'Bears');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Bear 20', 150, 'Bears');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Chicken 13', 18, 'Chickens');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Chicken 14', 20, 'Chickens');\
INSERT INTO game.stats (playerName, points, team) VALUES ('Chicken 15', 22, 'Chickens');\
"

# grant privileges to the test api user
sudo mysql -e "CREATE USER 'api'@'%' IDENTIFIED BY 'test';\
GRANT ALL PRIVILEGES ON game.* TO 'api'@'%';\
FLUSH PRIVILEGES;"
