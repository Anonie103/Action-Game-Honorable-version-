// get inputs 
rightKey = keyboard_check(ord("D"));
leftKey = keyboard_check(ord("A"));
upKey = keyboard_check(ord("W"));
downKey = keyboard_check(ord("S"));
shootKey = mouse_check_button(mb_left);

//player movements 
#region
 //get directions 
  var _horizKey = rightKey - leftKey;
  var _vertKey = downKey - upKey;
  moveDir = point_direction( 0, 0, _horizKey, _vertKey);
  
  
  //get the x and y speeds 
   var _spd = 0;
   var _inputLevel = point_distance( 0, 0, _horizKey, _vertKey);
   _inputLevel = clamp(_inputLevel, 0, 1);
   _spd = moveSpd * _inputLevel;
   
   xspd = lengthdir_x(_spd, moveDir );
   yspd = lengthdir_y(_spd, moveDir );
   
   //collision
   if place_meeting(x + xspd, y, oWall)
   {
	   xspd = 0;
   }
    if place_meeting(x , y + yspd, oWall)
   {
	   yspd = 0;
   }
   
    //move the player 
   x += xspd;
   y += yspd;
  
  //depth 
  depth = -bbox_bottom;
  
 #endregion 

//get damaged
get_damaged(oDamagePlayer, true); 

//sprite control 
#region
//player aiming 
centerY = y + centerYOffset;//set in step event
aimDir = point_direction(x, centerY, mouse_x, mouse_y);
 
 // make sure player is facing right direction
      face = round( aimDir/90 );
	  if face == 4 { face = 0; };
	  
	  //animate 
	  if xspd == 0 && yspd == 0
	  {
		image_index = 0;
	  }


//set the players sprite 
   mask_index = sprite[3];
   sprite_index = sprite[face];
   
  #endregion


//shoot the weapon 
if shootTimer > 0 {shootTimer --;};
if shootKey && shootTimer <= 0
{
	//reset timer 
	shootTimer = shootCooldown;
	
	 // create bullet
	 var _xOffset = lengthdir_x(weaponLength + weaponOffestDist, aimDir);
	 var _yOffset = lengthdir_y(weaponLength + weaponOffestDist, aimDir)
	 var _bulletInst = instance_create_depth( x + _xOffset, centerY + _yOffset, depth-100, bulletObj );
	
	//change bullet direction
	with (_bulletInst)
	
	{
		dir = other.aimDir;
	}
}

