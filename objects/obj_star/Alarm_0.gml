var p = instance_create_depth(x, y, 0, obj_projectile);

p.dir = dir
p.spd = bullet_spd

dir += 41
alarm[0] = cooldown + random(5)