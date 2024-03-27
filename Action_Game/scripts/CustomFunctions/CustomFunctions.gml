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

draw_sprite_ext(spr_pewpew, 0, x + _xOffset, centerY + _yOffset, 1, _weaponYscl, aimDir, c_white, image_alpha );
}

//damage calculation
  //damage create event 
  function get_damage_create(_hp = 10, _iframes = false)
  {
		hp = _hp;
		
		//get the iframes 
		if _iframes == true
		{
			iframeTimer = 0;
			iframeNumber = 90;
		}

	  //create damage list
	  if _iframes == false
	  {
		damageList = ds_list_create();
	  }
  }

 
 //damage cleanup function
 function get_damage_cleaup()
 {
	 //DO not NEED if we are using iframes 
	 
//delete our damage list to free memory
ds_list_destroy(damageList);
 }
 
 //damage step event 
   function get_damaged(_damageObj, _iframes = false)
   {
	   //special exit for iframe  timer
	   if _iframes == true && iframeTimer > 0
	   {
		   iframeTimer--;
		 
		 if iframeTimer mod 4 == 0
		 {
		   if image_alpha == 1
		   {
			   image_alpha = 0;
		   } else {
			   image_alpha = 1;
		   }
		 }   
		   exit;
	  }
	   //make sure the blinking iframe stops 
	   if _iframes == true
	   {
	   image_alpha = 1;
	   }
	   
	   
      //recieve damage 
      if place_meeting (x, y, _damageObj)
        {
	
//getting a list of the damage instance 
   
   // create ds list and copy instance to it
	var _instList = ds_list_create();
	instance_place_list(x ,y ,_damageObj, _instList, false );
	
	//get the size of our list
	var _listSize = ds_list_size(_instList);

	//loop through list
		var _hitConfirm = false; 
		for(var i =0; i < _listSize; i++)
	{
		//get a damage object instance from the list 
		var _inst = ds_list_find_value (_instList,i);
	
	//check if this instance is already in the damage list 
	if  _iframes == true || ds_list_find_index (damageList, _inst) ==-1
	{
		//add the new damage instance to list
		if _iframes == false
		{
		ds_list_add(damageList, _inst );
		}
		
		//take damage from specific instance 
		hp -= _inst.damage;
		_hitConfirm = true;
        // tell the damage instance to destroy itself 
		_inst.hitConfirm = true;
	  }
	}
	//set iframes if we're hit
	if _iframes == true && _hitConfirm 
	{
		iframeTimer = iframeNumber;
	}
	
	// free memory by killing itself in ds list
			ds_list_destroy(_instList);
}


//clear the damage list of objects that don't exist anymore 
  if  _iframes == false
{
   var _damageListSize = ds_list_size(damageList);
    for(var i =0; i < _damageListSize; i++)
{
	//if not touching damage instance, remove it from list and set loop
	   var _inst = ds_list_find_value(damageList,i);
	if !instance_exists(_inst) || !place_meeting(x, y, _inst)
	{
		ds_list_delete(damageList,i);
		i--;
		_damageListSize--;
	    }
     }
   }
 }