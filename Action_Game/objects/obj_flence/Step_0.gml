// get inputs 
rightKey = keyboard_check(ord("D"));
leftKey = keyboard_check(ord("A"));
upKey = keyboard_check(ord("W"));
downKey = keyboard_check(ord("S"));


//player movements 
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
   
   //move the player 
   x += xspd;
   y += yspd;
   
   
