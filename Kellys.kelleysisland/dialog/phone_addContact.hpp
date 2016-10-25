class life_phone_addContact {
	idd = 61202;
	name= "life_phone_addContact";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.6;
			y = 0;
			w = 0.4;
			h = 0.08;
			text = "Telefon";
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.6;
			y = 0;
			w = 0.4;
			h = 1;
		};
	};
	
	class controls {
		class phoneAdd : Life_RscButton {
			idc = 3001;
			text = PHONE_ADD;
			type = 1;
			action = "[61202] call life_fnc_phoneButtonAdd";
			x = 0.6;
			y = 0.88;
			w = 0.1;
			h = 0.12;
		};
		
		class phoneReturn : Life_RscButton {
			idc = 3002;
			text = PHONE_RETURN;
			type = 1;
			x = 0.9;
			y = 0.88;
			w = 0.1;
			h = 0.12;
			action = "[61202] call life_fnc_phoneButtonReturn";
		};
		
		class phoneContactNumber : Life_RscEdit {
			idc = 3003;
			text = "";
			x = 0.625;
			y = 0.4;
			w = 0.35;
			h = 0.1;
		};
		
		class phoneContactName : Life_RscEdit {
			idc = 3004;
			text = "";
			x = 0.625;
			y = 0.54;
			w = 0.35;
			h = 0.1;
		};
		
		class phoneContactTitle : Life_RscText 
		{
			idc = 3005;
			text = "Dodaj kontakt"; //--- ToDo: Localize;
			x = 0.625;
			y = 0.26;
			w = 0.35;
			h = 0.1;
		};
	};
};