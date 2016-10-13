#include "..\..\script_macros.hpp"
/*
	File: fn_cellphone.sqf
	Author: Alan
	
	Description:
	Opens the cellphone menu?
*/
private["_display","_market","_type"];
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "Life_market_view";

disableSerialization;
waitUntil {!isNull findDisplay 4000};
_display = findDisplay 4000;
_market = _display displayCtrl 4001;
lbClear _market;
_market lbAdd "Nazwa:                              Cena:             Popyt:";
{
	_name = localize (getText(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "displayName"));
	_price = _x select 1;
	_text = "";
	_quantity = _x select 5;
	_maxQuantity = _x select 6;
	switch(true) do {
		case(_quantity == 0): {_text = "Ogromny";};
		case(_quantity < (_maxQuantity / 10)): {_text = "Bardzo wysoki";};
		case(_quantity < (_maxQuantity / 4)): {_text = "Wysoki";};
		case(_quantity < (_maxQuantity / 2)): {_text = "Normalny";};
		case(_quantity < ((_maxQuantity / 4) * 3)): {_text = "Niski";};
		case(_quantity < ((_maxQuantity / 10) * 9)): {_text = "Bardzo niski";};
		case(_quantity == _maxQuantity): {_text = "Brak";};
	};
	_market lbAdd format["%1          $%2    %3",_name, _price, _text];
} foreach life_marketItems;

lbSetCurSel [3004,0];