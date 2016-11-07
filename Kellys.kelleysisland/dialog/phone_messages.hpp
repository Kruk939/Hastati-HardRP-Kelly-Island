class life_phone_messages {
	idd = 61204;
	name= "life_phone_messages";
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
	};
	
	class controls {
		class messageInput: Life_RscEdit
		{
			idc = 3008;
			x = PHONE_GRID_X;
			style = 16;
			text = "";
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.26);
			w = PHONE_MAX_WIDTH;
			h = 0.18;
			colorBackground[] = {0,0,0,0.5};
			colorBackgroundActive[] = {0, 0, 0, 0.3};
		};
		class phoneCall : Life_RscButtonInv {
			idc = 3001;
			type = 1;
			action = "[61204] call life_fnc_phoneButtonCall";
			text = "";
			x = PHONE_GRID_X;
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
		};
		
		class phoneSend : Life_RscButtonInv {
			idc = 3002;
			type = 1;
			action = "[61204] call life_fnc_phoneButtonSend";
			text = "";
			x = PHONE_GRID_X + 1 * (PHONE_MAX_WIDTH / 4);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
		};
		
		class phoneAdd : Life_RscButtonInv {
			idc = 3002;
			type = 1;
			action = "[61204] call life_fnc_phoneButtonAdd";
			text = "";
			x = PHONE_GRID_X + 2 * (PHONE_MAX_WIDTH / 4);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
		};
		
		class phoneReturn : Life_RscButtonInv {
			idc = 3004;
			type = 1;
			action = "[61204] call life_fnc_phoneButtonReturn";
			text = "";
			x = PHONE_GRID_X + 3 * (PHONE_MAX_WIDTH / 4);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
		};
		class phoneSettings : Life_RscButtonInv {
			idc = 3010;
			type = 1;
			action = "[] call life_fnc_phoneDialogSettings";
			colorBackground[] = {0,0,0,0.3};
			x = PHONE_GRID_X - 0.005;
			idc = -1;
			y = PHONE_GRID_Y - 0.005;
			w = PHONE_MAX_WIDTH + 0.035;
			h = 0.045;
		};
		class Life_RscTitleBackground: Life_RscText {
			colorBackground[] = {0,0,0,0.3};
			x = PHONE_GRID_X - 0.005;
			idc = -1;
			y = PHONE_GRID_Y - 0.005;
			w = PHONE_MAX_WIDTH + 0.035;
			h = 0.045;
			text = "Telefon";
		};
		class phoneMessages : Life_RscListBox
		{
			idc = 3005;
			x = PHONE_GRID_X;
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.75);
			w = PHONE_MAX_WIDTH;
			h = 0.25;
		};
		
		class phoneFrom : Life_RscText
		{
			idc = 3006;
			x = PHONE_GRID_X;
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.79);
			w = PHONE_MAX_WIDTH;
			h = 0.04;
		};
		class messageFull : Life_RscText
		{
			idc = 3007;
			x = PHONE_GRID_X;
			style = 16;
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.50);
			w = PHONE_MAX_WIDTH;
			h = 0.22;
		};
		class phoneButtonBackground1 : Life_RscPicture {
			idc = -1;
			style = "2096";
			text = PHONE_CALL;
			x = PHONE_GRID_X;
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
		};
		class phoneButtonBackground2 : Life_RscPicture {
			idc = -1;
			style = "2096";
			text = PHONE_SEND;
			x = PHONE_GRID_X + 1 * (PHONE_MAX_WIDTH / 4);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
		};
		class phoneButtonBackground3 : Life_RscPicture {
			idc = -1;
			style = "2096";
			text = PHONE_ADD;
			x = PHONE_GRID_X + 2 * (PHONE_MAX_WIDTH / 4);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
		};
		class phoneButtonBackground4 : Life_RscPicture {
			idc = -1;
			style = "2096";
			text = PHONE_RETURN;
			x = PHONE_GRID_X + 3 * (PHONE_MAX_WIDTH / 4);
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
		};
	};
};