#define PHONE_GRID_X (0.6)

class life_phone_messages {
	idd = 61204;
	name= "life_phone_messages";
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
			type = 1;
			text = PHONE_CALL;
			x = PHONE_GRID_X;
			y = 0.88;
			w = 0.1;
			h = 0.12;
			action = "[61204] call life_fnc_phoneButtonCall";
		};
		
		class phoneSend : Life_RscButton {
			idc = 3002;
			type = 1;
			text = PHONE_SEND;
			x = PHONE_GRID_X + 0.10;
			y = 0.88;
			w = 0.1;
			h = 0.12;
			action = "[61204] call life_fnc_phoneButtonSend";
		};
		class phoneAdd : Life_RscButton {
			idc = 3002;
			text = PHONE_ADD;
			x = PHONE_GRID_X + 0.2;
			type = 1;
			y = 0.88;
			w = 0.1;
			h = 0.12;
			action = "[61204] call life_fnc_phoneButtonAdd";
		};
		
		class phoneReturn : Life_RscButton {
			idc = 3003;
			type = 1;
			text = PHONE_RETURN;
			x = PHONE_GRID_X + 0.3;
			y = 0.88;
			w = 0.1;
			h = 0.12;
			action = "[61204] call life_fnc_phoneButtonReturn";
		};
		
		class phoneMessages : Life_RscListBox
		{
			idc = 3005;
			x = PHONE_GRID_X + 0.025;
			y = 0.12;
			w = 0.35;
			h = 0.72;
		};
		class phoneFrom : Life_RscText
		{
			idc = 3006;
			x = PHONE_GRID_X + 0.025;
			y = 0.1;
			w = 0.35;
			h = 0.04;
		};
		class messageFull : Life_RscText
		{
			idc = 3007;
			x = PHONE_GRID_X + 0.025;
			style = 16;
			y = 0.42;
			w = 0.35;
			h = 0.24;
		};
		class messageInput: Life_RscEdit
		{
			idc = 3008;
			x = PHONE_GRID_X + 0.025;
			style = 16;
			y = 0.68;
			w = 0.35;
			h = 0.18;
		};
	};
};