CREATE USER 'planet'@'%' IDENTIFIED BY '123456';
CREATE DATABASE surveys DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
grant all on surveys.* to 'planet'@'%'IDENTIFIED BY '123456';
use surveys;
