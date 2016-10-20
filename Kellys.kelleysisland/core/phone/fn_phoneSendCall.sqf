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
if(life_phone_beingCalled || life_phone_calling) exitWith {}; //check if calling or being called

life_phone_answered = 0;
life_phone_beingCalled = false;
life_phone_calling = true;


if(life_phone_activeNumber == "") exitWith {msg("Nie masz karty SIM")};
if(_targetNumber == "") exitWith {msg("Nie wpisano numeru.")};
_targetArray = [_targetNumber] call life_fnc_phoneCheckNumber;
if(count _targetArray == 0) exitWith {msg("Numer nie jest aktywny.")};
_freq = life_phone_activeNumber;
life_phone_activeFrequency = _freq;

[life_phone_activeNumber, _freq, player] remoteExec ["life_fnc_phoneGetCall", (_targetArray select 2)];
//setFreq to listen
_k = 0;
while {_k < 10} do {
	uiSleep 0.1;
	_k = _k + 0.1;
//playsound
	if(life_phone_answered != 0) exitWith {
		if(life_phone_answered == 1) then {msg("Rozmawiasz teraz")};
		if(life_phone_answered == 2) then {msg("Kontakt odrzucil polaczenie")};
		if(life_phone_answered == 3) then {msg("Kontakt jest zajety")};
	};
};