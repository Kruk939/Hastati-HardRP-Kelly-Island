class life_phone_change {
	idd = 61207;
	name= "life_phone_change";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	
	class controlsBackground {
		
		class MainBackground : Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = PHONE_GRID_X;
			y = 0.08;
			w = 0.2;
			h = 0.44;
		};
		class Life_RscTitleBackground : Life_RscText {
			x = PHONE_GRID_X;
			idc = -1;
			y = 0.08;
			w = 0.2;
			h = 0.08;
			text = "Zmien karte SIM";
		};
	};
	
	class controls {
		class phoneSimCards : Life_RscListBox {
			idc = 3003;
			x = PHONE_GRID_X;
			y = PHONE_GRID_Y + 0.05;
			w = PHONE_MAX_WIDTH;
			h = PHONE_MAX_HEIGHT - 0.16;
		};
		class phoneApply : Life_RscButtonInv {
			idc = 3001;
			action = "[61207] call life_fnc_phoneButtonApply";
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
			action = "[61207] call life_fnc_phoneButtonReturn";
			type = 1;
			y = (PHONE_GRID_Y + PHONE_MAX_HEIGHT - 0.08);
			h = 0.08;
			w = (PHONE_MAX_WIDTH / 4);
			x = PHONE_GRID_X + 2 * (PHONE_MAX_WIDTH / 4);
		};
		class phoneButtonBackground1 : Life_RscPicture {
			idc = -1;
			style = "2096";
			text = PHONE_ADD;
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