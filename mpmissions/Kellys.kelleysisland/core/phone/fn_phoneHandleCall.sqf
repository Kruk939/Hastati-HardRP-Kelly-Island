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
diag_log "----------------------- life_fnc_phoneHandleCall";
_radio = (call TFAR_fnc_ActiveSwRadio);
_time = 0;
life_phone_beingCalled = false;
life_phone_calling = false;
while {life_phone_inCall && _radio != ""} do {
	uiSleep 0.5;
	_radio = (call TFAR_fnc_ActiveSwRadio);
	if(_time == 0 || floor(_time) % 60 == 0) then {
		life_phone_activeCardSaldo = life_phone_activeCardSaldo - life_phone_activeCardCall;
	};
	_time = _time + 0.5;
};
hint "Rozmowa zostala przerwana";
life_phone_answered = 0;
life_phone_beingCalled = false;
life_phone_calling = false;
life_phone_inCall = false;
_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
_channel = _channel + 1;
[(call TFAR_fnc_activeSwRadio), _channel, life_phone_activeNumber] call TFAR_fnc_SetChannelFrequency;