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

while {life_phone_inCall} do {
	uiSleep 0.1;
};
hint "Rozmowa zostala przerwana";
life_phone_answered = 0;
life_phone_beingCalled = false;
life_phone_calling = false;
life_phone_inCall = false;
_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
_channel = _channel + 1;
[(call TFAR_fnc_activeSwRadio), _channel, life_phone_activeNumber] call TFAR_fnc_SetChannelFrequency;