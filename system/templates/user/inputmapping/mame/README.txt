# retrobat mame inputmapping

This directory can be used to specify your own mappings for MAME games, the format is xml.
Examples can be found in the system\resources\inputmapping\mame folder of your RetroBat installation.

##################################################################"
Here is an example of a mapping for one button in sf2:
------------------------------------------------------------------------------------------------------------------------
<game name="sf2" rom="sf2">
  <layouts>
    <layout type="default" joystickcolor="Black">
      <button type="P1_JOYSTICK_RIGHT" tag=":IN1" mask="1" defvalue="1" x="30" y="60" color="Blue" function="Right">
        <mapping type="standard" name="JOY_right OR JOY_lsright"/>
      </button>
    </layout>
  </layouts>
</game>

This will generate the following cfg file for MAME:
<mameconfig version="10">
  <system name="default">
    <input>
      <port type="P1_JOYSTICK_RIGHT" tag=":IN1" mask="1" defvalue="1">
        <newseq type="standard">JOYCODE_1_HAT1RIGHT OR JOYCODE_1_XAXIS_RIGHT_SWITCH</newseq>
    </input>
  </system>
</mameconfig>
-------------------------------------------------------------------------------------------------------------------------
button attributes:
  type: specifies the button name in MAME port element
  tag: specifies the tag in MAME port element
  mask: specifies the mask in MAME port element
  defvalue: specifies the defvalue in MAME port element
  x: not used yet
  y: not used yet
  color: not used yet
  function: helper text to specify what this button does in the game

mapping attributes:
  type: can be standard or increment, specifies the type in MAME newseq element
  name: specifies the source for mapping the button to the value in MAME newseq element (THIS IS THE IMPORTANT PART)

######################################################################
THE MAPPING:

Here is the explanation of what can be put in the mapping name:

There can be 4 type of values : JOY (joystick), GUN (gun), MOUSE (mouse) and KEY (keyboard)
You assign multiple buttons to a single MAME port by separating the values with 'OR' => for example "JOY_up OR JOY_lsup"

-------
JOY: the values accepted are:

JOY_up => for dpad up
JOY_down
JOY_left
JOY_right
JOY_lsup => for left joystick up
JOY_lsdown
JOY_lsleft
JOY_lsright
JOY_rsup => for right joystick up
JOY_rsdown
JOY_rsleft
JOY_rsright
JOY_rsup => for right joystick up
JOY_rsdown
JOY_rsleft
JOY_south => for south face button (eg A on xbox controller)
JOY_east => for east face button (eg B on xbox controller)
JOY_west => for west face button (eg X on xbox controller)
JOY_north => for north face button (eg Y on xbox controller)
JOY_l1 => leftshoulder
JOY_l2 => lefttrigger (as button)
JOY_l2trigger => left trigger analogic
JOY_l3 => leftstick press
JOY_r1 => rightshoulder
JOY_r2 => righttrigger (as button)
JOY_r2trigger => right trigger analogic
JOY_r3 => rightstick press
JOY_start
JOY_select
JOY_leftstickx (to specify left horizontal stick)
JOY_rightstickx (to specify right horizontal stick)
JOY_leftsticky (to specify left vertical stick)
JOY_rightsticky (to specify right vertical stick)

-------
GUN:
Value can be:
GUN_BUTTONx (where x is the gun button number)
GUN_XAXIS
GUN_YAXIS

-------
MOUSE:
Value can be:
MOUSE_BUTTONx (where x is the mouse button number)
MOUSE_XAXIS
MOUSE_YAXIS

-------
KEY:
RetroBat will just copy the value to MAME config as is, some examples here:
KEYCODE_RIGHT => right arrow
KEYCODE_ENTER => enter
KEYCODE_P => P key
KEYCODE_F7
KEYCODE_1
KEYCODE_LSHIFT
...