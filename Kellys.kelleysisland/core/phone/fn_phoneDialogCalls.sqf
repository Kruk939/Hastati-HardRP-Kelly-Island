#include "..\..\script_macros.hpp"
/*
	Author: Kajetan "Kruk" Mruk
	

	Description:
	Execute received remote execution

	Parameter(s):
	_this select 0: STRING - Packet variable name (always "life_fnc_MP_packet")
	_this select 1: ARRAY - Packet value (sent by life_fnc_MP function; see it's description for more details)
	
	Returns:
	BOOL - true if function was executed successfully
*/
#define NUMBER 3006
#define BTN1 3001
#define BTN2 3002
#define BTN3 3003
#define BTN4 3004
#define PHONE_CALLLIST 3005
disableSerialization;

private [];

if(!alive player || dialog) exitWith {};
if(!(createDialog "life_phone_calls")) exitWith {};
//if(HANDCUFFED(player) || ISSURRENDERED(player)) exitWith {}; //ace check if player has his hands free
//if(ISUNCONSCIOUS(player)) exitWith {}; //ace check if player is unconscious
_dialog = findDisplay 61205;
_btn1 = _dialog displayCtrl BTN1;
_btn2 = _dialog displayCtrl BTN2;
_btn3 = _dialog displayCtrl BTN3;
_btn4 = _dialog displayCtrl BTN4;
_phoneCallList = _dialog displayCtrl PHONE_CALLLIST;
//[] spawn life_fnc_phoneGetActiveNumber;
{
	if(life_phone_activeCard == _x select 0) then {
		_array = _x select 1;
		{
			_number = "";
			_name = "";
			if((_x select 1) == life_phone_activeNumber) then {
			//przychodzace
			_number = _x select 0;
			_name = "Przychodzące: ";
			} else {
			//wychodzace
			_number = _x select 1;
			_name = "Wychodzące: ";
			};
			_contact = [_number] call life_fnc_phoneGetContact;
			if((count _contact) == 0) then {
				_name = _name + _number;
			} else {
				_name = _name + (_contact select 1);
			};
			_index = _phoneCallList lbAdd _name;
			_phoneCallList lbSetData [_index, _number];
		} forEach _array;
	};
} forEach life_phone_call;
_phoneCallList lbSetCurSel 0;
