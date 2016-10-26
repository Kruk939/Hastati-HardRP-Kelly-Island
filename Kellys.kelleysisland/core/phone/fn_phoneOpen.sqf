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
#define NUMBER 3006
#define PHONE_CALL 3001
#define PHONE_CONTACTS 3002
#define PHONE_MESSAGES 3003
#define PHONE_REJECT 3004
disableSerialization;
private [];

if(!alive player || dialog) exitWith {};
if(!(createDialog "life_phone_main")) exitWith {};
//if(HANDCUFFED(player) || ISSURRENDERED(player)) exitWith {}; //ace check if player has his hands free
//if(ISUNCONSCIOUS(player)) exitWith {}; //ace check if player is unconscious
_dialog = findDisplay 61201;
_phoneNumber = _dialog displayCtrl NUMBER;
_phoneEvent = _dialog displayCtrl 3007;
_phoneTitle = _dialog displayCtrl 3006;
_phoneInput = _dialog displayCtrl 3005;
_phoneCall = _dialog displayCtrl PHONE_CALL;
_phoneReject = _dialog displayCtrl PHONE_REJECT;
_phoneMessages = _dialog displayCtrl PHONE_MESSAGES;
_phoneContacts = _dialog displayCtrl PHONE_CONTACTS;
[] spawn life_fnc_phoneGetActiveNumber;
if(isNil "life_phone_selectedNumber") then {};
if(life_phone_activeNumber != "") then {
	if(life_phoneBeingCalled) then {
	_phoneMessages ctrlEnable false;
	_phoneContacts ctrlEnable false;
	_phoneEvent ctrlSetText life_phone_caller;
	_phoneTitle ctrlSetText "Połączenie przychodzące:";
	} else {
		_phoneNumber ctrlSetText life_phone_activeNumber;
		_str = "";
		if(life_phone_newMessages == 0) then {
			_str = "Nie masz nowych wiadomosci.\n";
		} else { 
			if(life_phone_newMessages < 2) then {
				_str = "Masz 1 nowy SMS.\n";
			} else {
				if(life_phone_newMessages < 5) then {
					_str = format["Masz %1 nowe SMS.\n", life_phone_newMessages];
				} else {
					_str = format["Masz %1 nowych SMS.\n", life_phone_newMessages];
				};
			};
		};
		if(life_phone_newCalls == 0) then {
			_str = _str + "";
		} else { 
			if(life_phone_newCalls < 2) then {
				_str = _str + "Masz 1 nieodebrane polaczenie.\n";
			} else {
				if(life_phone_newCalls < 5) then {
					_str = _str + format["Masz %1 nieodebrane polaczenia.\n", life_phone_newCalls];
				} else {
					_str = _str + format["Masz %1 nieodebranych polaczen.\n", life_phone_newCalls];
				};
			};
	};
	_phoneEvent ctrlSetText _str;
	//_phoneCall buttonSetAction "hint 'Dzwonienie';";
	//_phoneCall ctrlSetEventHandler ["MouseButtonDown", "hint 'Dzwonienie';"];
	//_phoneReturn ctrlSetEventHandler ["MouseButtonDown", "hint 'Return';"];
	//_phoneMessages ctrlSetEventHandler ["MouseButtonDown", "hint 'Messages';"];
	//_phoneReject ctrlSetEventHandler ["MouseButtonDown", "hint 'Reject';"];
	};
} else {
	_phoneNumber ctrlSetText "Brak numeru";
	_phoneEvent ctrlSetText "Musisz kupic badz aktywowac karte,\njezeli chcesz uzywac telefonu.";
};
