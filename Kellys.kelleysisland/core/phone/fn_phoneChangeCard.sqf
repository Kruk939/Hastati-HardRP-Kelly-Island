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
{
	if(_x select 0 == _card) exitWith {
		life_phone_activeCard = _card;
		life_phone_active_number = _x select 1;
		life_phone_activeCardSaldo = _x select 3;
		life_phone_activeCardSMS = _x select 4;
		life_phone_activeCardCall = _x select 5;
	};
} forEach life_phone_cards;