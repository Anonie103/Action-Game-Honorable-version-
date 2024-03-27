//move
xspd = lengthdir_x( spd, dir );
yspd = lengthdir_y( spd, dir );

x += xspd;
y += yspd;

//clean up
  //hit confirm destroy 
  if hitConfirm = true && enemyDestroy == true {destroy = true;}
  
  //destroy 
 if destroy == true { instance_destroy(); }
  
  //collsion 
if place_meeting( x + xspd, y, sSolidWall){destroy = true;}
  //bullet out of range 
   if point_distance ( xstart, ystart, x, y)  > maxDist  { destroy = true; }

