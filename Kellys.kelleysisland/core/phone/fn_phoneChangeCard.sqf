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
_card = _this select 0;
if(_card == 0) exitWith {
	life_phone_activeCard = 0;
	life_phone_activeNumber = "";
	life_phone_activeCardSaldo = 0;
	life_phone_activeCardSMS = 0;
	life_phone_activeCardCall = 0;
	if(isNil "life_phone_numbers") then {
		life_phone_numbers = [];
	} else {
		{
			if((_x select 0) == (getPlayerUID player)) then {
				life_phone_numbers set [_forEachIndex, [-1]];
				life_phone_numbers = life_phone_numbers - [-1];
			};
		} forEach life_phone_numbers;
	};
	publicVariable "life_phone_numbers";
};
if(life_phone_activeNumber != "") {
	{
		if(_x select 0 == life_phone_activeCard) exitWith {
			_x set [3, life_phone_activeCardSaldo];
			[0,life_phone_activeCard] spawn life_fnc_phoneCardUpdate;
		};
	} forEach life_phone_cards;
};
{
	if(_x select 0 == _card) exitWith {
		life_phone_activeCard = _card;
		life_phone_activeNumber = _x select 1;
		life_phone_activeCardSaldo = _x select 3;
		life_phone_activeCardSMS = _x select 4;
		life_phone_activeCardCall = _x select 5;
		[1,_card] spawn life_fnc_phoneCardUpdate;
	};
} forEach life_phone_cards;

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