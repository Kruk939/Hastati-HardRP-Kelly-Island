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

diag_log "---------------- fn_phoneGetData ----------------";
_data = _this;

life_phone_contacts = [];
life_phone_cards = [];
life_phone_sms = [];
life_phone_call = [];
life_phone_selectedNumber = "";
life_phone_newMessages = 0;
life_phone_newCalls = 0;
life_phone_answered = 0;
life_phone_beingCalled = false;
life_phone_calling = false;
life_phone_inCall = false;
life_phone_activeCard = 0;

if(isNil "_data") exitWith {};
//if(typeName _data != "ARRAY") exitWith {};
if((count _data) != 0) then {
	life_phone_contacts = _data select 0;
	life_phone_cards = _data select 1;
	life_phone_sms = _data select 2;
	life_phone_call = _data select 3;
	{
		if(_x select 6 != 0) exitWith {
			life_phone_activeNumber = _x select 1;
			life_phone_activeCard = _x select 0;
		};
	} forEach life_phone_cards;
	if(!isNil "life_phone_activeNumber") then {
		if(isNil "life_phone_numbers") then {
			life_phone_numbers = [];
			life_phone_numbers pushBack [getPlayerUID player, life_phone_activeNumber, player];
			publicVariable "life_phone_numbers";
		} else {
			_active = false;
			{
				if((_x select 0) == (getPlayerUID player)) exitWith {
					_x set [1, life_phone_activeNumber];
					_x set [2, player];
					_active = true;
				};
			} forEach life_phone_numbers;
			if(!_active) then {life_phone_numbers pushBack [getPlayerUID player, life_phone_activeNumber, player];};
			publicVariable "life_phone_numbers";
		};
	} else {
		life_phone_activeNumber = "";
	};
};