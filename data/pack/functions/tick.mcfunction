#cooldown
execute as @a at @s run execute if score @s iz.cooldown matches 1 run playsound entity.experience_orb.pickup master @s
execute as @a at @s run execute unless score @s iz.cooldown matches ..0 run scoreboard players remove @s iz.cooldown 1

#duration
kill @e[type=armor_stand,tag=duration60,scores={iz.timer=60..}]
kill @e[type=armor_stand,tag=duration100,scores={iz.timer=100..}]
kill @e[type=armor_stand,tag=duration150,scores={iz.timer=150..}]

#particles
function pack:particles

#fireball
execute as @a at @s if score @s iz.wand matches 1.. run execute if score @s iz.cooldown matches ..0 run function pack:fireball

#snowball shenanigans
execute at @e[type=minecraft:snowball] run summon minecraft:lightning_bolt ~ ~ ~

#totem shit
function pack:taunting_totem


execute as @a[scores={Taunt=1..}] at @s run execute as @e[type=!player,distance=..10] run data modify entity @s AttackTarget set from entity @a[scores={Taunt=1..},limit=1,sort=nearest] UUID

execute as @e[type=!player,distance=..10] run data get entity @s Target



#--arrow shenanigans--

#lightning arrow
#NoGravity?

#add tag to originial arrow
execute as @a[tag=Archer] at @s run execute as @e[type=spectral_arrow,distance=..4] run execute unless predicate pack:new_lightning_arrow run tag @s add lightning_arrow 

#create new arrow and modify data
execute as @e[type=spectral_arrow,tag=lightning_arrow] at @s run summon spectral_arrow ~ ~ ~ {Tags:["new_lightning_arrow"],HasVisualFire:true,Passengers:[{id:"minecraft:marker",Glowing:true,Tags:["arrow_rider"]}]}

execute as @e[type=spectral_arrow] at @s run data modify entity @e[type=spectral_arrow,tag=new_lightning_arrow,limit=1,sort=nearest] Motion set from entity @s Motion
#execute as @e[type=spectral_arrow] at @s run data modify entity @e[type=spectral_arrow,tag=new_lightning_arrow,limit=1,sort=nearest] Rotation set from entity @s Rotation

#kill orginal arrow
kill @e[tag=lightning_arrow]

#detect if new arrow in ground of hit entity
kill @e[type=spectral_arrow,tag=new_lightning_arrow,nbt={inGround:true}]
execute as @e[type=marker,tag=arrow_rider] at @s unless predicate pack:is_riding_arrow run summon lightning_bolt
execute as @e[type=marker,tag=arrow_rider] unless predicate pack:is_riding_arrow run kill @s



#frag arrow (proximity)





#wand
scoreboard players set @a iz.wand 0
