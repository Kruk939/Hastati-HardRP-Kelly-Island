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

_targetNumber = _this select 0;
if(life_phone_beingCalled || life_phone_calling) exitWith {}; //check if calling or being called

life_phone_answered = 0;
life_phone_beingCalled = false;
life_phone_calling = true;
life_phone_inCall = false;


if(life_phone_activeNumber == "") exitWith {msg("Nie masz karty SIM")};
if(_targetNumber == "") exitWith {msg("Nie wpisano numeru.")};
_targetArray = [_targetNumber] call life_fnc_phoneCheckNumber;
_obj = _targetArray select 2;
if(count _targetArray == 0) exitWith {msg("Numer nie jest aktywny.")};
_freq = life_phone_activeNumber;
life_phone_activeFrequency = _freq;

[life_phone_activeNumber, _freq, player, _obj] remoteExec ["TON_fnc_sendCall", 2];
_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
_channel = _channel + 1;
[(call TFAR_fnc_activeSwRadio), _channel, _freq] call TFAR_fnc_SetChannelFrequency;
_k = 0;
while {_k < 10} do {
	uiSleep 0.1;
	_k = _k + 0.1;
//playsound
	if(life_phone_answered != 0) exitWith {
		if(life_phone_answered == 1) then {
			msg("Rozmawiasz teraz"); 
		};
		if(life_phone_answered == 2) then {msg("Kontakt odrzucil polaczenie");};
		if(life_phone_answered == 3) then {msg("Kontakt jest zajety");};
	};
};