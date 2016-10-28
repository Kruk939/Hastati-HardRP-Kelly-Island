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
#define msg(var) hint var
_from = _this select 0;
_message = _this select 1;
_target = _this select 2;
if(_target != player) exitWith {};

_contact = [_from] call life_fnc_phoneGetContact;
_fromName = "";
if((count _contact) != 0) then {
	_fromName = _contact select 1;
} else {
	_fromName = _from;
};
hint format["Nowa wiadomosc od: %1\n%2",_fromName,_message];
{
	if(life_phone_activeCard == _x select 0) exitWith {
		(_x select 1) pushBack [life_phone_activeNumber, _from, _message];
	};
} forEach life_phone_sms;
//life_phone_sms = [life_phone_activeNumber, _from, _message] + life_phone_sms;