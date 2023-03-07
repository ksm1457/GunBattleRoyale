package com.moon404.gbr.item;

import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.item.Item;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.level.Level;

public class ShieldBattery extends RecoverItem
{
    public ShieldBattery(Item.Properties properties)
    {
        super(properties);
    }

    public int getUseDuration(ItemStack stack)
    {
        return 50;
    }

    public ItemStack finishUsingItem(ItemStack stack, Level level, LivingEntity entity)
    {
        if (!level.isClientSide && entity instanceof Player player)
        {
            float shield = player.experienceLevel * 4 + 4;
            player.setAbsorptionAmount(shield);
        }
        return this.isEdible() ? entity.eat(level, stack) : stack;
    }
}
