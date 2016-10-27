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
_freq = _this select 1;
_fromObj = _this select 2;
_target = _this select 3;
if(_target != player) exitWith {};
if(life_phone_beingCalled || life_phone_calling || life_phone_inCall) exitWith {[_from, life_phone_activeNumber, (getPos _fromObj), _fromObj, 3] remoteExec ["TON_fnc_callInsert", 2];};
life_phone_answered = 0;
life_phone_beingCalled = true;
life_phone_calling = false;
life_phone_inCall = false;

_contact = [_from] spawn life_fnc_phoneGetContact;

if(count _contact != 0) then {_fromName = _contact select 1;} else {_fromName = _from;}
msg(format["Dzwoni do Ciebie: %1\n",_fromName]);
life_phone_caller = _from;
while {_k < 10} do {
	uiSleep 0.1;
	_k = _k + 0.1;
//playsound
	if(life_phone_answered != 0) exitWith {
		if(life_phone_answered == 1) then {
			msg("Rozmawiasz teraz");
			_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
			_channel = _channel + 1;
			life_phone_activeFrequency = _freq;
			[(call TFAR_fnc_activeSwRadio), _channel, _freq] call TFAR_fnc_SetChannelFrequency;
			life_phone_inCall = true;
			[] spawn life_fnc_phoneHandleCall;
			//setFreq
		};
		if(life_phone_answered == 2) then {msg("Odrzuciles polaczenie");};
		if(life_phone_answered == 3) then {msg("Wyslano sygnal - zajety");};
		[_from, life_phone_activeNumber, (getPos _fromObj), _fromObj, life_phone_answered, _freq] remoteExec ["TON_fnc_callInsert", 2];
	};
};
life_phone_caller = "";
//life_phone_sms = [life_phone_activeNumber, _from, _message] + life_phone_sms;