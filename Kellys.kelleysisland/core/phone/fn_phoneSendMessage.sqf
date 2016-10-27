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
#define msg(var) hint var;

_targetNumber = _this select 0;
_message = _this select 1;
if(life_phone_activeNumber == "") exitWith {msg("Nie masz karty SIM")};
if(_message == "") exitWith {msg("Nie podano wiadomosci.")};
if(_targetNumber == "") exitWith {msg("Nie wpisano numeru.")};
_targetArray = [_targetNumber] call life_fnc_phoneCheckNumber;
_obj = (_targetArray select 2);
if(count _targetArray == 0) exitWith {msg("Numer nie jest aktywny.")};


[_obj, life_phone_activeNumber, _targetNumber, (getPos player), _message] remoteExec ["TON_fnc_smsInsert", RSERV];
{
	if(life_phone_activeCard == _x select 0) exitWith {
		(_x select 1) pushBack pushback [life_phone_activeNumber, _from, _message];
	};
} forEach life_phone_sms;