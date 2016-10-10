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

/*params [
	["_type"],
	["_buy",false],
	["_quantity", 1]
];*/

diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Wysylanie danych ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";

_type = _this select 0;
_buy = _this select 1;
_quantity = _this select 2;

if(typename _type != "STRING") exitWith {}; //Checking if _type is string
if(typename _buy != "BOOL") exitWith {};


[_type, _buy, player, _quantity] remoteExec ["life_fnc_reciveMarketData",2];