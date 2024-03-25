//drawing players weapon 
function draw_my_weapon()
{
	//draw weapon 
  //get weapon off playes body 
  var _xOffset = lengthdir_x( weaponOffestDist, aimDir);
  var _yOffset = lengthdir_y( weaponOffestDist, aimDir);
  
//flip weapon upright
var _weaponYscl = 1;
if aimDir > 90 && aimDir < 270
{
	_weaponYscl = -1;
}

draw_sprite_ext(spr_pewpew, 0, x + _xOffset, centerY + _yOffset, 1, _weaponYscl, aimDir, c_white, 1 );
}