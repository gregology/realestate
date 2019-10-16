# README

A property monitoring app

## DB setup

### Dev

```
CREATE DATABASE realestate_development;
CREATE USER realestate_development WITH PASSWORD 'password';
ALTER USER realestate_development WITH SUPERUSER;
GRANT ALL PRIVILEGES ON DATABASE "realestate_development" to realestate_development;
```

```
CREATE DATABASE realestate_test;
CREATE USER realestate_test WITH PASSWORD 'password';
ALTER USER realestate_test WITH SUPERUSER;
GRANT ALL PRIVILEGES ON DATABASE "realestate_test" to realestate_test;
```
