draw_self ();

//draw_text(x, y,string(hp));

//draw hp with sprite 
var _healthPercent = hp / maxHp;
var _hpImage = _healthPercent * (sprite_get_number (spr_EnemyHealthBar) -1)
draw_sprite (spr_EnemyHealthBar, _hpImage, x, y - sprite_height - 1);

if hp <=0
{
instance_destroy(_hpImage)
}