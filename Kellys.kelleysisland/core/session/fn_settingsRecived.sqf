#include "..\..\script_macros.hpp"
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called by the server saying that we have a response so let's
	sort through the information, validate it and if all valid
	set the client up.
*/
private["_array"];
_array = _this select 0;
_settings = _array;
player setVariable ["playerDBid", (_settings select 0)];
life_phone_activeCard = _settings select 1;