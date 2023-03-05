# 每tick都要进行的玩家判定
execute as @a[gamemode=adventure] run function gbr:tick/player_in_game
# 空投判定
scoreboard players add game_tick global 1
execute if score game_tick global matches 1950 run function gbr:airdrop/airdrop
execute if score game_tick global matches 2050 run function gbr:airdrop/airdrop
execute if score game_tick global matches 4000 run function gbr:airdrop/airdrop
execute at @e[tag=dropping] run particle campfire_signal_smoke ~ ~ ~ 0 0.5 0 0 0 force @a
execute at @e[tag=finish] unless block ~ ~0.5 ~ chest{Items:[]} run particle campfire_cosy_smoke ~ ~ ~ 0 0.5 0 1 0 force @a
execute as @e[tag=dropping, nbt={OnGround:true}] at @s run function gbr:airdrop/land
# 技能
execute as @e[type=item] if data entity @s Thrower at @s run function gbr:skill/item
execute as @e[tag=fly] at @s run function gbr:skill/fly_entity
