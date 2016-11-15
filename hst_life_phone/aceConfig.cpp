/*  */
class CBA_Extended_EventHandlers;
class CfgVehicles {
	class Man;
	class CAManBase: Man {
		class ACE_SelfActions {
			class ACE_Equipment {
				class LIFE_Phone {
					displayName = "Otworz telefon";
					condition = "";
					statement = QUOTE([] spawn hst_life_phone_functions_fnc_openPhone;);
				};
			};
		};
	};
};