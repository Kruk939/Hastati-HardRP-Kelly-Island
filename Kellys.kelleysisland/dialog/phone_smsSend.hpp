class life_phone_sms_send {
	idd = 61206;
	name= "life_phone_sms_send";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	
	class controlsBackground {
		class MainBackground : Life_RscPicture {
			colorBackground[] = {0, 0, 0, 0.7};
			text = "icons\phoneImage.paa";
			idc = -1;
			style = "2096";
			x = 0.59;
			y = -0.91;
			w = 1;
			h = 3;
		};
		class Life_RscTitleBackground: Life_RscText {
			colorBackground[] = {0,0,0,0.3};
			x = PHONE_GRID_X - 0.005;
			idc = -1;
			y = PHONE_GRID_Y - 0.005;
			w = PHONE_MAX_WIDTH + 0.035;
			h = 0.04;
			text = "Telefon";
		};
	};
	
	class controls {
		class phoneTargetNumber : Life_RscEdit {
			idc = 3003;
			x = PHONE_GRID_X;
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.52);
			w = PHONE_MAX_WIDTH;
			h = 0.1;
		};
		class phoneSmsMessage : Life_RscEdit {
			idc = 3004;
			x = PHONE_GRID_X;
			style = 16;
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.4);
			w = PHONE_MAX_WIDTH;
			h = 0.3;
		};
		class phoneSmsSendTitle : Life_RscText {
			idc = 3005;
			text = "Wyslij sms";
			x = PHONE_GRID_X;
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.64);
			w = PHONE_MAX_WIDTH;
			h = 0.1;
		};
		class phoneSend : Life_RscButtonInv {
			idc = 3001;
			action = "[61206] call life_fnc_phoneButtonSend";
			text = "";
			type = 1;
			x = PHONE_GRID_X + (PHONE_MAX_WIDTH / 4);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
		};
		
		class phoneReturn : Life_RscButtonInv {
			idc = 3002;
			text = "";
			action = "[61206] call life_fnc_phoneButtonReturn";
			type = 1;
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
			x = PHONE_GRID_X + 2 * (PHONE_MAX_WIDTH / 4);
		};
		class phoneButtonBackground1 : Life_RscPicture {
			idc = -1;
			style = "2096";
			text = PHONE_SEND;
			x = PHONE_GRID_X + (PHONE_MAX_WIDTH / 4);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
		};
		class phoneButtonBackground2 : Life_RscPicture {
			idc = -1;
			style = "2096";
			text = PHONE_RETURN;
			x = PHONE_GRID_X + 2 * (PHONE_MAX_WIDTH / 4);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
		};
	};
};