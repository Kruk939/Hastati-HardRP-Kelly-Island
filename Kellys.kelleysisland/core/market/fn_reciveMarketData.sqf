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
	["_object",objNull,[objNull],
	["_quantity", 1]
];
if(_quantity < 1) exitWith {}; //Dafuq?
if(!isDedicated) exitWith {}; //Don't let players execute this script
if(typename _type != "STRING") exitWith {}; //Checking if _type is string
if(isNull _object) exitWith {}; // anonymous sender?

{
	if( (_x select 0) == _name) then {
		if(_buy) then {
			if((SEL(_x,5)) > 0) then {
				_x set [5, SEL(_x,5) - _quantity];
				_x set [1, (SEL(_x,1) + SEL(_x,7) * _quantity)];
			} else {
				//if not enough to buy set quantity to 0 and set maximum price
				_x set [5, 0];
				_x set [1, SEL(_x,2)];
			}
		} else {
			if(SEL(_x,5) < SEL(_x,6)) then {
				_x set [5, SEL(_x,5) + _quantity];
				_x set [1, (SEL(_x,1) - SEL(_x,7) * _quantity)];
			} else {
				//if there is too much on market set maximum and minimal price
				_x set [5, SEL(_x,6)];
				_x set [1, SEL(_x,3)];
			}		
		};
	}
} foreach life_marketItems;
[] spawn life_fnc_syncMarketData;
