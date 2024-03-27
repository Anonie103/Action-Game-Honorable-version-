//draw the weapon behind the player 
if aimDir >= 0 && aimDir < 180
{
	draw_my_weapon();
}

//draw the player 
draw_self();

//draw weapon 
 if aimDir >= 180 && aimDir < 360
 {
    draw_my_weapon();
 }
 

var _healthPercent = hp / maxHp;
var _hpImage = _healthPercent * (sprite_get_number (spr_PlayerHealthBar) -1)
draw_sprite (spr_PlayerHealthBar, _hpImage, x, y - sprite_height - 1);
