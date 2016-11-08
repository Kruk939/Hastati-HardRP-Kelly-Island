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
		
	};
};