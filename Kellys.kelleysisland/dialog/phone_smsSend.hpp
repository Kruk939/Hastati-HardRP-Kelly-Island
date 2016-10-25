#define PHONE_GRID_X (0.6)

class life_phone_sms_send {
	idd = 61206;
	name= "life_phone_sms_send";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = PHONE_GRID_X;
			y = 0;
			w = 0.4;
			h = 0.08;
			text = "Telefon";
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = PHONE_GRID_X;
			y = 0;
			w = 0.4;
			h = 1;
		};
	};
	
	class controls {
		class phoneCall : Life_RscButton {
			idc = 3001;
			text = PHONE_CALL;
			type = 1;
			x = PHONE_GRID_X;
			y = 0.88;
			w = 0.1;
			h = 0.12;
		};
		class phoneReturn : Life_RscButton {
			idc = 3002;
			text = PHONE_RETURN;
			type = 1;
			x = PHONE_GRID_X + 0.3;
			y = 0.88;
			w = 0.1;
			h = 0.12;
			action = "[61206] call life_fnc_phoneButtonReturn";
		};
		class phoneTargetNumber : Life_RscEdit {
			idc = 3003;
			x = PHONE_GRID_X + 0.025;
			y = 0.4;
			w = 0.35;
			h = 0.1;
		};
		class phoneSmsMessage : Life_RscEdit {
			idc = 3004;
			x = PHONE_GRID_X + 0.025;
			y = 0.54;
			w = 0.35;
			h = 0.3;
		};
		class phoneSmsSendTitle : Life_RscText {
			idc = 3005;
			text = "Wyslij sms";
			x = PHONE_GRID_X + 0.025;
			y = 0.26;
			w = 0.35;
			h = 0.1;
			
		};
	};
};