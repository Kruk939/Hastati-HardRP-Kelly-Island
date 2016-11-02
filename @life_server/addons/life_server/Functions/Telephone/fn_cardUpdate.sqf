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

_mode = _this select 0;
_cardID = _this select 1;
_player = _this select 2;
_saldo = _this select 3;
//_playerUID = getPlayerUID _player;
if(isNil "_cardID") exitWith {};
if(isNil "_player") exitWith {};

switch(_mode) do {
	case 0: {
		_query = format ["UPDATE TelSimCards SET saldo='%1' WHERE id='%2'", _saldo, _cardID];
	};
	case 1: {
		_query = format ["UPDATE TelSimCards SET permanent='0' WHERE ownerUID='%1'", _player];
		_query2 = format ["UPDATE TelSimCards SET permanent='1' WHERE id='%1'", _cardID];
	};
	case 2: {
		_query = format ["UPDATE TelSimCards SET alive='0' WHERE id='%1'", _cardID];
	};
};

if(!isNil "_query") then {
	[_query, 1] call DB_fnc_asyncCall;
};
if(!isNil "_query2") then {
	[_query2, 1] call DB_fnc_asyncCall;
};