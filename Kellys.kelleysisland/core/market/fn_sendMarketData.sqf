/*
	Author: Kajetan "Kruk" Mruk
	

	Description:
	Execute received remote execution

	Parameter(s):
	_this select 0: STRING - Virtual item name
	_this select 1: Buy or Sell - true for buy, false for sell
	
	Returns:
	BOOL - true if function was executed successfully
*/

params [
	["_type"],
	["_buy",false],
	["quantity", 1]
];

if(typename _type != "STRING") exitWith {}; //Checking if _type is string



[_type, _buy, player] remoteExec ["life_fnc_reciveMarketData", 2];