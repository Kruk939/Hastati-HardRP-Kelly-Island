#define PHONE_GRID_X (0.6)

class life_phone_main {
	idd = 61201;
	name= "life_phone_main";
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
		class phoneCall : Life_RscPicture {
			idc = 3001;
			text = PHONE_CALL;
			x = PHONE_GRID_X;
			y = 0.88;
			w = 0.1;
			h = 0.12;
		};
		
		class phoneContacts : Life_RscPicture {
			idc = 3002;
			text = PHONE_CONTACTS;
			x = PHONE_GRID_X + 0.1;
			y = 0.88;
			w = 0.1;
			h = 0.12;
		};
		
		class phoneMessages : Life_RscPicture {
			idc = 3003;
			text = PHONE_MESSAGE;
			x = PHONE_GRID_X + 0.2;
			y = 0.88;
			w = 0.1;
			h = 0.12;
		};
		
		class phoneReject : Life_RscPicture {
			idc = 3004;
			text = PHONE_REJECT;
			x = PHONE_GRID_X + 0.3;
			y = 0.88;
			w = 0.1;
			h = 0.12;
		};
		
		class phoneNumberInput : Life_RscEdit 
		{
			idc = 3005;
			text = "Wprowadz numer telefonu"; //--- ToDo: Localize;
			x = PHONE_GRID_X;
			y = 0.78;
			w = 0.4;
			h = 0.1;
		};
		class phoneNumber: Life_RscText
		{
			idc = 3006;
			text = "123456789"; //--- ToDo: Localize;
			x = PHONE_GRID_X;
			y = 0.08;
			w = 0.4;
			h = 0.16;
			sizeEx = 2 * GUI_GRID_H;
		};
		class phoneEvent: Life_RscText
		{
			idc = 3007;
			text = "1 Nowa wiadomosc, 1 Nieodebrane polaczenie"; //--- ToDo: Localize;
			x = PHONE_GRID_X;
			y = 0.28;
			w = 0.4;
			h = 0.36;
		};
	};
};