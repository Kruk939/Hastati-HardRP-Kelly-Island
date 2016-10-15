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

_player = _this select 0;
_number = _this select 1;
_name = _this select 2;
_ret = false;
if(isNil "_player" || isNil "_number" || isNil "_name") exitWith {_ret;};
if(isNull _player) exitWith {_ret;};
if(_number == "" || _name == "") exitWith {_ret;};

_playerUID = getPlayerUID _player;
_query = format["INSERT INTO TelContact (playerUID, number, name) VALUES ('%1', '%2', '%3')", _playerUID, _name, _number];
_ret = true;
_ret;