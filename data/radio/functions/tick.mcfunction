#Movement
execute as @a[scores={id=1.., radio=1..}, nbt={SelectedItemSlot:0}] at @s as @e[tag=car] if score @s id = @p[distance=..0,limit=1] id run data modify entity @s Motion set value [0.5,0.0,0.0]
execute as @a[scores={id=1.., radio=1..}, nbt={SelectedItemSlot:0}] at @s as @e[tag=car] if score @s id = @p[distance=..0,limit=1] id run data modify entity @s Rotation set value [-90f,0f]
execute as @a[scores={id=1.., radio=1..}, nbt={SelectedItemSlot:2}] at @s as @e[tag=car] if score @s id = @p[distance=..0,limit=1] id run data modify entity @s Motion set value [-0.5,0.0,0.0]
execute as @a[scores={id=1.., radio=1..}, nbt={SelectedItemSlot:2}] at @s as @e[tag=car] if score @s id = @p[distance=..0,limit=1] id run data modify entity @s Rotation set value [90f,0f]
execute as @a[scores={id=1.., radio=1..}, nbt={SelectedItemSlot:1}] at @s as @e[tag=car] if score @s id = @p[distance=..0,limit=1] id run data modify entity @s Motion set value [0.0,0.0,0.5]
execute as @a[scores={id=1.., radio=1..}, nbt={SelectedItemSlot:1}] at @s as @e[tag=car] if score @s id = @p[distance=..0,limit=1] id run data modify entity @s Rotation set value [-1f,0f]
execute as @a[scores={id=1.., radio=1..}, nbt={SelectedItemSlot:3}] at @s as @e[tag=car] if score @s id = @p[distance=..0,limit=1] id run data modify entity @s Motion set value [0.0,0.0,-0.5]
execute as @a[scores={id=1.., radio=1..}, nbt={SelectedItemSlot:3}] at @s as @e[tag=car] if score @s id = @p[distance=..0,limit=1] id run data modify entity @s Rotation set value [179f,0f]
execute as @a[scores={id=1.., radio=1..}, nbt={SelectedItemSlot:4}] at @s as @e[tag=car] if score @s id = @p[distance=..0,limit=1] id at @s if block ~ ~-1 ~ #blocks run data modify entity @s Motion set value [0.0,0.5,0.0]

#Fire
execute as @a[scores={id=1.., radio=1..}, nbt={SelectedItemSlot:5}] at @s as @e[tag=car,nbt={Rotation:[-90f,0f]}] if score @s id = @p[distance=..0,limit=1] id at @s run summon fireball ~ ~0.5 ~ {Motion:[5.0,0.0,0.0],ExplosionPower:2}
execute as @a[scores={id=1.., radio=1..}, nbt={SelectedItemSlot:5}] at @s as @e[tag=car,nbt={Rotation:[90f,0f]}] if score @s id = @p[distance=..0,limit=1] id at @s run summon fireball ~ ~0.5 ~ {Motion:[-5.0,0.0,0.0],ExplosionPower:2}
execute as @a[scores={id=1.., radio=1..}, nbt={SelectedItemSlot:5}] at @s as @e[tag=car,nbt={Rotation:[-1f,0f]}] if score @s id = @p[distance=..0,limit=1] id at @s run summon fireball ~ ~0.5 ~ {Motion:[0.0,0.0,5.0],ExplosionPower:2}
execute as @a[scores={id=1.., radio=1..}, nbt={SelectedItemSlot:5}] at @s as @e[tag=car,nbt={Rotation:[179f,0f]}] if score @s id = @p[distance=..0,limit=1] id at @s run summon fireball ~ ~0.5 ~ {Motion:[0.0,0.0,-5.0],ExplosionPower:2}

#Radio_Reset
scoreboard players reset @a radio

#Visual
item replace entity @e[tag=car1] armor.head with minecraft:carrot_on_a_stick{CustomModelData:1005}
item replace entity @e[tag=car2] armor.head with minecraft:carrot_on_a_stick{CustomModelData:1007}

#Car_Own_Mechanism
execute as @a store result storage carown:amount list[] int 1 if entity @e[tag=car]

#say tick

#execute as @a[scores={id=1.., radio=1..}, nbt={SelectedItemSlot:0}] at @s as @e[tag=car] if score @s id = @p[distance=..0,limit=1] id run
#Огромное спасибо людям из Дискорд Сервера СвИнперия, а конкретно — twelve[12] и PyXiion


#Car_Hp
effect give @e[tag=carhp] invisibility 999999 2 true
execute as @e[tag=car] at @s run tp @e[tag=carhp,sort=nearest,limit=1] ~ ~ ~
execute as @e[tag=car] at @s unless entity @e[tag=carhp,distance=0] run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.1 1000
execute as @e[tag=car] at @s unless entity @e[tag=carhp,distance=0] run kill @s
execute as @e[tag=car] at @s as @e[tag=carhp,limit=1,sort=nearest] store result score @s CarHealth run data get entity @s Health


#Craft
#1
execute as @a[scores={o=1..}] at @s run function radio:carspawn1
execute as @a[scores={o=1..}] at @s run item replace entity @s weapon.offhand with carrot_on_a_stick{CustomModelData:1006}
execute as @a[scores={o=1..}] at @s run clear @s nautilus_shell 1
scoreboard players reset @a o

#2
execute as @a[scores={g=1..}] at @s run function radio:carspawn2
execute as @a[scores={g=1..}] at @s run item replace entity @s weapon.offhand with carrot_on_a_stick{CustomModelData:1006}
execute as @a[scores={g=1..}] at @s run clear @s blue_orchid 1
scoreboard players reset @a g
