#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"
#include "cfgPatches.hpp"
#include "dialogs\MasterHandler.hpp"


class cfgFunctions {
	class hst_life_phone_ace {
		tag = "hst_life_phone_ace";
		class ace {
			file = "hst_life_phone\functions\ace";
		};
	};
	class hst_life_phone_buttons {
		tag = "hst_life_phone_buttons";
		class buttons {
			file = "hst_life_phone\functions\buttons";
			class add {};
			class apply {};
			class back {};
			class call {};
			class message {};
			class reject {};
			class remove {};
			class send {};
		};
	};
	class hst_life_phone_dialogs {
		tag = "hst_life_phone_dialogs";
		class dialogs {
			file = "hst_life_phone\functions\dialogs";
			class addContact {};
			class calls {};
			class contacts {};
			class messages {};
			class newMessage {};
			class settings {};
			class simCards {};
		};
	};
	class hst_life_phone_functions {
		tag = "hst_life_phone_functions";
		class functions {
			file = "hst_life_phone\functions\functions";
			class addContact {};
			class callAnswered {};
			class cardUpdate {};
			class changeCard {};
			class checkNumber {};
			class getActiveNumber {};
			class getCall {};
			class getContact {};
			class getMessage {};
			class handleCall {};
			class phoneOpen {};
			class sendCall {};
			class sendMessage {};
			class simCardBuy {};
			class simCardCharge {};
			class updateRequest {};
		};
	};
	class hst_life_phone_session {
		tag = "hst_life_phone_session";
		class session {
			file = "hst_life_phone\functions\session";
			class playerGetData {};
			class playerInit {};
			class serverGetData {};
			class serverInit {};
		};
	};
};
class cfgWeapons {
	class ItemWatch;
	class hst_life_phone_phone: ItemWatch {
		displayName = "Telefon";
		count = 1;
		picture = "data\phone.paa";
		Author = "Mattaust";
		descriptionShort = "Najnowszy telefon najnowszej generacji, Kappa";
		model = "data\phone.p3d";
		class itemInfo {
			mass = 1;
		};
		tf_prototype = 1;
		tf_range = 50000;
		tf_dialog = "";
		tf_encryptionCode = "tf_west_radio_code";
		tf_dialogUpdate = "call TFAR_fnc_updateSWDialogToChannel;";
		tf_subtype = "digital";
		tf_parent = "hst_life_phone_phone";
		tf_additional_channel = 0;
	};
};
class CfgSounds {
	class phoneBusy
	{
		name = "phoneBusy";
		sound[] = {"data\sounds\phoneBusy.ogg", 1.0, 1};
		titles[] = {};
	};
	class phoneDial
	{
		name = "phoneDial";
		sound[] = {"data\sounds\phoneDial.ogg", 1.0, 1};
		titles[] = {};
	};
	class phoneRingtone
	{
		name = "phoneRingtone";
		sound[] = {"data\sounds\phoneRingtone.ogg", 1.0, 1};
		titles[] = {};
	};
};
#include "aceConfig.cpp"