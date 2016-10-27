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
#define PHONE_MAIN 61201
#define PHONE_ADDCONTACT 61202
#define PHONE_CONTACTS 61203
#define PHONE_MESSAGES 61204
#define PHONE_CALLS 61205
#define PHONE_SMSSEND 61206
#define PHONE_CHANGE 61207
disableSerialization;

private [];

if(!alive player || !dialog) exitWith {};
//if(HANDCUFFED(player) || ISSURRENDERED(player)) exitWith {}; //ace check if player has his hands free
//if(ISUNCONSCIOUS(player)) exitWith {}; //ace check if player is unconscious

_display = _this select 0;


_dialog = findDisplay _display;

if(life_phone_beingCalled) exitWith {
	life_phone_answered = 2;
	closeDialog 0;
	hint "Answering";
};

switch(_display) do {
	case PHONE_MAIN: {
		closeDialog 0;
		if(life_phone_inCall) then {
			life_phone_inCall = false;
		} else {
			[_display] spawn life_fnc_phoneDialogCalls;
		};
		hint "Cals";
	};
};