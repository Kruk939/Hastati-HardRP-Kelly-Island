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

_answered = _this select 0;
_freq = _this select 1;
_target = _this select 2;
diag_log "----------------------- life_fnc_phoneCallAnswered";
if(_target != player) exitWith {};

life_phone_answered = _answered;
if(_answered == 1) then {
	life_phone_activeFrequency = _freq;
	_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
	_channel = _channel + 1;
	[(call TFAR_fnc_activeSwRadio), _channel, _freq] call TFAR_fnc_SetChannelFrequency;
	life_phone_inCall = true;
	[] spawn life_fnc_phoneHandleCall;
};
life_phone_answered = 0;
life_phone_beingCalled = false;
life_phone_calling = false;