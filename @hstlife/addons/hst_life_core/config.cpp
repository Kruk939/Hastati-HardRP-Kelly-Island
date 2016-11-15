#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"
#include "cfgPatches.hpp"
#include "dialogs\MasterHandler.hpp"


class cfgFunctions {
	class hst_life_core {
		tag = "hst_life_core";
		class session {
			file = "hst_life_phone\functions";
			class playerGetData {};
			class playerInit {};
			class serverGetData {};
			class serverInit {};
		};
	};
};

#include "aceConfig.cpp"