class life_tablet_licenses {
	idd = 61303;
	name= "life_phone_licenses";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	class controlsBackground {
		class MainBackground : Life_RscPicture {
			text = "icons\tablet.paa";
			idc = -1;
			style = "2096";
			x = TABLET_GRID_X - 0.08;
			y = TABLET_GRID_Y - 0.32;
			w = TABLET_WIDTH + 0.165;
			h = TABLET_HEIGHT + 0.64;
		};
		class TabletBackground: Life_RscText {
			idc = -1;
			x = TABLET_GRID_X;
			y = TABLET_GRID_Y;
			w = TABLET_WIDTH;
			h = TABLET_HEIGHT;
			colorBackground[] = {0,0,0,0.7};
			text = "";
		};
	};
	class controls {
		class licensesList: Life_RscListBox {
			idc = 3001;
			x = TABLET_GRID_X + 0.03;
			y = TABLET_GRID_Y + 0.03;
			w = (TABLET_WIDTH - 0.06) / 2;
			h = TABLET_HEIGHT - 0.06;
		};
		class playerInfo: Life_RscText {
			idc = 3002;
			text = "TEST TEST TEST";
			style = 16;
			x = TABLET_GRID_X + (TABLET_WIDTH / 2) + 0.03;
			y = TABLET_GRID_Y + 0.03;
			w = (TABLET_WIDTH - 0.06) / 2;
			h = (TABLET_HEIGHT / 2) - 0.06;
		};
		class addButton: Life_RscButton {
			idc = 3003;
			type = 1;
			text = "Dodaj";
			x = TABLET_GRID_X + (TABLET_WIDTH / 2) + 0.03;
			y = TABLET_GRID_Y + (TABLET_HEIGHT / 2) + 0.03;
			w = 0.2;
			h = 0.05;
		};
		class removeButton: Life_RscButton {
			idc = 3004;
			type = 1;
			text = "Usun";
			x = TABLET_GRID_X + (TABLET_WIDTH / 2) + 0.24;
			y = TABLET_GRID_Y + (TABLET_HEIGHT / 2) + 0.03;
			w = (TABLET_WIDTH / 2) - 0.26;
			h = 0.05;
		};
		class exitButton: Life_RscButton {
			idc = 3007;
			type = 1;
			action = "closeDialog 0;";
			text = "Wyjscie";
			x = TABLET_GRID_X + TABLET_WIDTH - 0.12;
			y = TABLET_GRID_Y + TABLET_HEIGHT - 0.07;
			w = 0.10;
			h = 0.05;
		};
	};
};