summon armor_stand ~ ~ ~ {Invisible:1, Tags:[car,car2], Silent:1,ShowArms:1,Small:1}
summon vex ~ ~ ~ {NoAI:1,Silent:1,Tags:[carhp]}
attribute @e[tag=carhp,sort=nearest,limit=1] minecraft:generic.max_health base set 75
data modify entity @e[tag=carhp,sort=nearest,limit=1] Health set value 75.0f
item replace entity @e[tag=car] weapon.mainhand with minecraft:torch{CustomModelData:1}
item replace entity @e[tag=car2] armor.head with minecraft:carrot_on_a_stick{CustomModelData:1007}
execute as @e[tag=car] run data modify entity @s DisabledSlots set value 256
scoreboard players operation @s id = *free id
execute as @e[tag=car,sort=nearest,limit=1] run scoreboard players operation @s id = *free id
execute as @e[tag=carhp,sort=nearest,limit=1] run scoreboard players operation @s id = *free id
scoreboard players add *free id 1
