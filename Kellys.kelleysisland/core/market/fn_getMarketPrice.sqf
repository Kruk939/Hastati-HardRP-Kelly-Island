/*
	Author: Kajetan "Kruk" Mruk
	

	Description:
	Searches through array looking for price

	Parameter(s):
	_this select 0: STRING - Virtual item name
	_this select 1: Buy or Sell - true for buy, false for sell
	
	Returns:
	BOOL - true if function was executed successfully
*/

params [
	["_name"]
];
_ret = -1;
if(isNil "_name") exitWith {};
if(typename _name != "STRING") exitWith {}; //Checking if _type is string

{
	if( (_x select 0) == _name) exitWith {_ret = _x select 1;};
} foreach life_marketItems;
_ret;