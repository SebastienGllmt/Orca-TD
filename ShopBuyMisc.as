package
{
	import flash.events.*;
	import Engine.*;
	
	public class ShopBuyMisc
	{
		
		public static function buyHealth(e:Event){
			if(ItemManager.Money>=5){
				Shop.enoughMoney=true;
				Shop.whereFrom="Misc";
				ItemManager.Health++;
				ItemManager.Money-=5;
			}else{
				Shop.enoughMoney=false;
				DisplayManager.onMenu=true;
				Main.stageRef.addEventListener(Event.ENTER_FRAME, Shop.buyMisc);
			}
			Main.stageRef.addEventListener(Event.ENTER_FRAME, Shop.buyingDelay);
			Main.stageRef.removeEventListener(Event.ENTER_FRAME, buyHealth);
		}
		public static function buyIncome(e:Event){
			if(ItemManager.Money>=(100*Math.pow(ItemManager.incomeMulti,2))){
				Shop.enoughMoney=true;
				Shop.whereFrom="Misc";
				ItemManager.Money-=(100*Math.pow(ItemManager.incomeMulti,2));
				ItemManager.incomeMulti++;
			}else{
				Shop.enoughMoney=false;
				DisplayManager.onMenu=true;
				Main.stageRef.addEventListener(Event.ENTER_FRAME, Shop.buyMisc);
			}
			Main.stageRef.addEventListener(Event.ENTER_FRAME, Shop.buyingDelay);
			Main.stageRef.removeEventListener(Event.ENTER_FRAME, buyIncome);
		}
		public static function tempPow(e:Event){
			if(ItemManager.Money>=100){
				Shop.enoughMoney=true;
				Shop.whereFrom="Misc";
				ItemManager.tempPower=true;
				ItemManager.Money-=100;
			}else{
				Shop.enoughMoney=false;
				DisplayManager.onMenu=true;
				Main.stageRef.addEventListener(Event.ENTER_FRAME, Shop.buyMisc);
			}
			Main.stageRef.addEventListener(Event.ENTER_FRAME, Shop.buyingDelay);
			Main.stageRef.removeEventListener(Event.ENTER_FRAME, tempPow);
		}
		public static function chancePow(e:Event){
			if(ItemManager.Money>=100){
				Shop.enoughMoney=true;
				Shop.whereFrom="Misc2";
				if(ShopBuyMisc.getChance() == 9){
					ItemManager.chancePow=true;
				}else{
					ItemManager.chancePow=false
				}
				ItemManager.Money-=100;
			}else{
				Shop.enoughMoney=false;
				DisplayManager.onMenu=true;
				Main.stageRef.addEventListener(Event.ENTER_FRAME, Shop.buyMisc);
			}
			Main.stageRef.addEventListener(Event.ENTER_FRAME, Shop.buyingDelay);
			Main.stageRef.removeEventListener(Event.ENTER_FRAME, chancePow);
		}
		public static function getChance(){
			var chance:int=Math.round(Math.random()*9);
			return chance;
		}
	}
}