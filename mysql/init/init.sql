create user if not exists 'runelite'@'%' identified by 'runelite';

create database if not exists `runelite`;
grant all on `runelite`.* to 'runelite'@'%' identified by 'runelite' with grant option;
create database if not exists `runelite-tracker`;
grant all on `runelite-tracker`.* to 'runelite'@'%' identified by 'runelite' with grant option;
create database if not exists `runelite-cache2`;
grant all on `runelite-cache2`.* to 'runelite'@'%' identified by 'runelite' with grant option;
flush privileges;

use `runelite-tracker`;
create function level_for_xp returns integer soname 'libxp.so';
