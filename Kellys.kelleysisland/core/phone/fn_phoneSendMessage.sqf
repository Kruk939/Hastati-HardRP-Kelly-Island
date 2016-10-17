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
if(count _targetArray == 0) exitWith {msg("Numer nie jest aktywny.")};

[life_phone_activeNumber, _message] remoteExec ["life_fnc_phoneGetMessage", (_targetArray select 2)];
[life_phone_activeNumber, _targetNumber, (getPos player), _message] remoteExec ["TON_fnc_smsInsert", RSERV];
life_phone_sms = [_targetNumber, life_phone_activeNumber, _message] + life_phone_sms;