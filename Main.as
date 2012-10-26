package
{
	import flash.display.*;
	import flash.events.*;
	import Engine.*;
	
	public class Main extends MovieClip
	{
		public static var stageRef;
		public static var stageHeight;
		public static var stageWidth;
		private static var delay:int=1;
		
		public function Main() {
			trace("Starting...");
			Main.stageRef=this;
			stageHeight = stage.stageHeight;
			stageWidth = stage.stageWidth;
			
			TextManager.createTextField();
			TextManager.addTextArray();
			
			Main.stageRef.addEventListener(Event.ENTER_FRAME, gameLoaded);
		}
		
		public function gameLoaded(e:Event):void{
			var timerArray:Array = new Array(50,100,150,200,250);
			var textArray:Array = new Array("WAKE UP!","The Orca is under   attack!","By giant enemy crabs", "...","DEFEND THE ORCA!");
			if((delay%60)==0){
				DisplayManager.timer(timerArray[(delay/60)-1],textArray[(delay/60)-1]);
			}
			if(delay==360){
				Drawings.drawOrca();
			}
			if(delay==480){
				TextManager.clearHome();
				Main.stageRef.addEventListener(Event.ENTER_FRAME, KeyboardManager.keyWait);
				Main.stageRef.addEventListener(Event.ENTER_FRAME, loopFunctions);
				Main.stageRef.removeEventListener(Event.ENTER_FRAME, gameLoaded);
			}
			delay++;
		}
		
		public static function loopFunctions(e:Event):void{
			if(DisplayManager.onMenu==true){
				TextManager.clearHome();
				TextManager.Output(1,8,"Money: "+ItemManager.Money);
				DisplayManager.onMenu = DisplayManager.menu(4,"# To Select", ["Next Wave!","Buy Towers","Buy Misc.","Exit"], [MonsterWaves.nextWave, Shop.buyTowers, Shop.buyMisc, Drawings.exitGame]);
			}else{
				trace("Exited loopFunctions");
				DisplayManager.onMenu=true;
				Main.stageRef.removeEventListener(Event.ENTER_FRAME, loopFunctions);
			}
		}
	}
}
