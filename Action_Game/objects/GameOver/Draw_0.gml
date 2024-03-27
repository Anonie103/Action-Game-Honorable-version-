var _camX = camera_get_view_x(view_camera[0]);
var _camW =  camera_get_view_width(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

//draw black screen
draw_set_alpha(alpha*alphaMax);
draw_rectangle_color(_camX,_camY, _camX+_camW, _camY+_camH, c_black, c_black, c_black, c_black, false);


//draw text 
 
  draw_set_halign(fa_center);
  draw_set_valign(fa_middle);
  draw_set_alpha(alpha);
  draw_set_font(fnt_font);
   // Game Over 
   var _gameoverOffset = -30;
  draw_text_transformed(_camX + _camW/2, _camY + _camH/2+ _gameoverOffset, "Game Over, Man You Suck!", 5,5,0);
 
 // press 'space' to restartdraw
 var _restartOffset = 80;
  draw_text_transformed(_camX + _camW/2, _camY + _camH/2+ _restartOffset, "-Press Space To Restart-", 2,2,0);
 
 //reset alpha
 draw_set_alpha(1);