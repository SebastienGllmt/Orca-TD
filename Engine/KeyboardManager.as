package Engine
{
	import flash.events.*;
	
	public class KeyboardManager
	{
		public static var keyArray:Array = new Array();
		public static const KEY_DELAY_MAX:int=15;
		public static var keyDelay:int=KEY_DELAY_MAX;
		
		public static function isKeyDown(keyCode){
			return keyArray[keyCode][1];
		}
		
		public static function keyPressed(e:KeyboardEvent){
			keyArray[e.keyCode][1]=true;
		}
		public static function keyReleased(e:KeyboardEvent){
			keyArray[e.keyCode][1]=false;
		}
		public static function keyWait(e:Event):void{
			if(keyDelay>=KEY_DELAY_MAX){
				Main.stageRef.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
			}else{
				keyDelay++;
			}
			Main.stageRef.addEventListener(KeyboardEvent.KEY_UP, keyReleased);
			if(keyArray.length==0){
				for(var j:int=0;j<222;j++){
					keyArray.push([j,false]);
				}
			}
		}
	}
}