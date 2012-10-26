package
{
	import flash.events.*;
	import Engine.*;
	
	public class Shop
	{
		private static var delay:int;
		public static var enoughMoney:Boolean=true;
		public static var whereFrom:String="a";
		
		public static function buyTowers(e:Event):void{
			if(DisplayManager.onMenu==true){
				TextManager.clearHome();
				TextManager.Output(1,8,"Money: "+ItemManager.Money);
				DisplayManager.onMenu = DisplayManager.menu(5,"What to buy?!", ["Archer Tower(1)","Jam Tower(5)","Tesla Coil(20)","Harpoon Tower(50)", "Exit Shop"], [ShopBuyTower.buyArcherTower, ShopBuyTower.buyJamTower, ShopBuyTower.buyTeslaCoil, ShopBuyTower.buyHarpoonTower, Shop.Exit]);
			}else{
				DisplayManager.onMenu=true;
				Main.stageRef.removeEventListener(Event.ENTER_FRAME, buyTowers);
			}
		}
		public static function buyMisc(e:Event):void{
			if(DisplayManager.onMenu==true){
				TextManager.clearHome();
				TextManager.Output(1,8,"Money: "+ItemManager.Money);
				DisplayManager.onMenu = DisplayManager.menu(5,"What to buy?!", ["Buy Health (5)","x2 Income("+(100*Math.pow(ItemManager.incomeMulti,2))+")","Temp +100pow(100)","10% +999(100)", "Exit Shop"], [ShopBuyMisc.buyHealth, ShopBuyMisc.buyIncome, ShopBuyMisc.tempPow, ShopBuyMisc.chancePow, Shop.Exit]);
			}else{
				DisplayManager.onMenu=true;
				Main.stageRef.removeEventListener(Event.ENTER_FRAME, buyMisc);
			}
		}
		public static function Exit(e:Event){
			DisplayManager.onMenu=true;
			TextManager.clearHome();
			Main.stageRef.addEventListener(Event.ENTER_FRAME, Main.loopFunctions);
			trace("Exited Exit");
			Main.stageRef.removeEventListener(Event.ENTER_FRAME, Exit);
		}
		
		public static function buyingDelay(e:Event){
			if(enoughMoney==true){
				if(whereFrom=="Misc2"){
					if(ItemManager.chancePow >= true){
						TextManager.COutput(7,"Lucky Orca bonus!!");
					}else{
						TextManager.COutput(7,"No luck, no bonus!");
					}
				}else{
					TextManager.COutput(7,"Bought!");
				}
			}else{
				TextManager.COutput(7,"Not enough money!");
			}
			if(delay<20){
				delay++;
			}
			if(delay>=20){
				TextManager.COutput(7,"                 ");
				delay=0;
				if(whereFrom=="Tower"){
					Main.stageRef.addEventListener(Event.ENTER_FRAME, buyTowers);
				}
				if(whereFrom=="Misc" || whereFrom=="Misc2"){
					Main.stageRef.addEventListener(Event.ENTER_FRAME, buyMisc);
				}
				Main.stageRef.removeEventListener(Event.ENTER_FRAME, buyingDelay);
			}
		}
	}
}