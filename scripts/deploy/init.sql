CREATE DATABASE testdb;

CREATE USER test_user WITH password 'qwerty';

GRANT ALL privileges ON DATABASE testdb TO test_user;
