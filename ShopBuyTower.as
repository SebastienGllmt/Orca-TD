package
{
	import flash.events.*;
	import Engine.*;
	
	public class ShopBuyTower
	{
		public static function buyArcherTower(e:Event){
			if(ItemManager.Money>=1){
				Shop.enoughMoney=true;
				Shop.whereFrom="Tower";
				ItemManager.archerTower++;
				ItemManager.Money--;
			}else{
				Shop.enoughMoney=false;
				DisplayManager.onMenu=true;
				Main.stageRef.addEventListener(Event.ENTER_FRAME, Shop.buyTowers);
			}
			Main.stageRef.addEventListener(Event.ENTER_FRAME, Shop.buyingDelay);
			Main.stageRef.removeEventListener(Event.ENTER_FRAME, buyArcherTower);
		}
		public static function buyJamTower(e:Event){
			if(ItemManager.Money>=5){
				Shop.enoughMoney=true;
				Shop.whereFrom="Tower";
				ItemManager.jamTower++;
				ItemManager.Money-=5;
			}else{
				Shop.enoughMoney=false;
				DisplayManager.onMenu=true;
				Main.stageRef.addEventListener(Event.ENTER_FRAME, Shop.buyTowers);
			}
			Main.stageRef.addEventListener(Event.ENTER_FRAME, Shop.buyingDelay);
			Main.stageRef.removeEventListener(Event.ENTER_FRAME, buyJamTower);
		}
		public static function buyTeslaCoil(e:Event){
			if(ItemManager.Money>=20){
				Shop.enoughMoney=true;
				Shop.whereFrom="Tower";
				ItemManager.teslaCoil++;
				ItemManager.Money-=20;
			}else{
				Shop.enoughMoney=false;
				DisplayManager.onMenu=true;
				Main.stageRef.addEventListener(Event.ENTER_FRAME, Shop.buyTowers);
			}
			Main.stageRef.addEventListener(Event.ENTER_FRAME, Shop.buyingDelay);
			Main.stageRef.removeEventListener(Event.ENTER_FRAME, buyTeslaCoil);
		}
		public static function buyHarpoonTower(e:Event){
			if(ItemManager.Money>=50){
				Shop.enoughMoney=true;
				Shop.whereFrom="Tower";
				ItemManager.harpoonTower++;
				ItemManager.Money-=50;
			}else{
				Shop.enoughMoney=false;
				DisplayManager.onMenu=true;
				Main.stageRef.addEventListener(Event.ENTER_FRAME, Shop.buyTowers);
			}
			Main.stageRef.addEventListener(Event.ENTER_FRAME, Shop.buyingDelay);
			Main.stageRef.removeEventListener(Event.ENTER_FRAME, buyHarpoonTower);
		}
	}
}