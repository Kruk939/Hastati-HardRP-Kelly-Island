#include "..\..\script_macros.hpp"
/*
	File: fn_cellphone.sqf
	Author: Alan
	
	Description:
	Opens the cellphone menu?
*/
private["_display","_list","_type"];
_amount = parseNumber (_this select 0);
if(isNil "_amount") exitWith {};
if(_amount < 0) exitWith {};
if(CASH < _amount) exitWith {hint "Nie masz wystarczajaco pieniedzy";};
CASH = CASH - _amount;
life_phone_activeCardSaldo = life_phone_activeCardSaldo + _amount;
[0] call SOCK_fnc_updatePartial;
[0,life_phone_activeCard] spawn life_fnc_phoneCardUpdate;