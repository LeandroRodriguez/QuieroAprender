QuieroAprender
==============

Tp para Taller de Proyectos I

# Instalar Redis (http://redis.io/download) 
- wget http://download.redis.io/releases/redis-2.8.13.tar.gz
- tar xzf redis-2.8.13.tar.gz
- cd redis-2.8.13
- make
- make install

# Configurar Redis
Agregar en el config "save 60 1" para que cada 1 minuto persista el cache en disco

# Correr Redis
- redis-server &

# Detener Redis
- redis-cli
- SHUTDOWN SAVE
- exit