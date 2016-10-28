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
			x = PHONE_GRID_X + 0.025;
			y = 0.16;
			w = 0.2;
			h = 0.24;
		};		
		class phoneApply : Life_RscButton {
			idc = 3001;
			text = "";
			type = 1;
			x = PHONE_GRID_X;
			y = 0.4;
			w = 0.1;
			h = 0.12;
		};
		class phoneReturn : Life_RscButton {
			idc = 3002;
			text = "";
			type = 1;
			x = PHONE_GRID_X + 0.1;
			y = 0.4;
			w = 0.1;
			h = 0.12;
			action = "[61207] call life_fnc_phoneButtonReturn";
		};

		class phoneButtonBackground1 : Life_RscPicture {
			idc = -1;
			text = PHONE_APPLY;
			x = PHONE_GRID_X;
			y = 0.4;
			w = 0.1;
			h = 0.12;
		};
		class phoneButtonBackground2 : Life_RscPicture {
			idc = -1;
			text = PHONE_RETURN;
			x = PHONE_GRID_X + 0.1;
			y = 0.4;
			w = 0.1;
			h = 0.12;
		};
	};
};