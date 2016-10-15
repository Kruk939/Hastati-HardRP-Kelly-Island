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

_callerNumber = _this select 0;
_targetNumber = _this select 1;
_message = _this select 3;
_caller = _this select 2;
_callerPos = getPos _caller;
_callerMres = [_callerPos] call DB_fnc_mresArray;
if(isNil "_callerNumber" || isNil "_targetNumber" || isNil "_message") exitWith {};
if(_message == "") exitWith {};
_query = format["INSERT INTO TelSMS (senderNumber, recipientNumber, message, pos) VALUES ('%1', '%2', '%3', '%4')", _callerNumber, _targetNumber, _message, _callerMres];
[_query, 1] call DB_fnc_asyncCall;