execute positioned ~ ~1 ~ run summon fireball ^ ^ ^0.8 {ExplosionPower:2}
playsound block.enchantment_table.use master @a[distance=..15] ~ ~ ~ 1 1 1
summon armor_stand ~ ~ ~ {Invisible:true,Marker:true,NoGravity:true,Tags:["duration60","fireball1"]}
scoreboard players add @s iz.cooldown 100