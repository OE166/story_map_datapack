
execute at @a[scores={Taunt=1..}] run execute as @e[type=!player,distance=..10] at @s run data modify entity @s AngryAt set from entity @p[scores={Taunt=1..},sort=nearest,limit=1] UUID
execute at @[scores={Taunt=1..}] run execute as @e[type=!player,distance=..10] run data modify entity @s AngerTime set value 1


execute as @a[scores={Taunt=1..}] run scoreboard players reset @s Taunt
execute as @a run scoreboard players set @s Taunt 0

execute as @a[nbt={SelectedItem:{id:"minecraft:totem_of_undying",tag:{display:{Name:'{"text":"Taunting Totem"}'}}}}] run scoreboard players set @s Taunt 1


#fat juicy potatoes 