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
_ret = [];
diag_log "---------------- fn_phoneQuery ----------------";
if(isNil "_player") exitWith {[_ret] remoteExec ["life_fnc_phoneGetData", _player];};
if(isNull _player) exitWith {[_ret] remoteExec ["life_fnc_phoneGetData", _player];};

_contacts = [player] spawn TEL_fnc_contactGet;
_cards = [player] spawn TEL_fnc_cardGet;
if(count _cards != 0) {
	_sms = [];
	_calls = [];
	{
		_phoneNumber = _x select 1;
		_query = [_phoneNumber] spawn TEL_fnc_smsGet;
		_tmp = [_x select 0, _query];
		_sms pushBack _tmp;
		_query = [_phoneNumber] spawn TEL_fnc_callGet;
		_tmp = [_x select 0, _query];
		_calls pushBack _tmp;
	} forEach _cards;
	_ret pushBack _contacts;
	_ret pushBack _cards;
	_ret pushBack _sms;
	_ret pushBack _calls;
} else {
	_ret pushBack _contacts;
	_ret pushBack [];
	_ret pushBack [];
	_ret pushBack [];
};
diag_log "-----------------------------------------------------------";
diag_log format ["%1", _ret];
diag_log "-----------------------------------------------------------";
[_ret] remoteExec ["life_fnc_phoneGetData", _player];