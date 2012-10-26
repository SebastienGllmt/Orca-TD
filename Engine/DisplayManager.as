package Engine
{
	import flash.display.*;
	import flash.events.*;
	
	public class DisplayManager
	{
		public static var onMenu:Boolean=true;
		public static var timerDelay:int=0;
		
		public static function newLine(){
			var stageWidth:int = Main.stageWidth;
			var stageHeight:int = Main.stageHeight;
			var textArray:Array = TextManager.textArray;
			var highestValue:int=(stageHeight/48)+1;
			for(var i:int=stageHeight/48;i>0;i--){
				var blankCount:int=0;
				for(var j:int=stageWidth/32;j>0;j--){
					if(textArray[((i-1)*(Main.stageWidth/32)+(j-1))].text == " "){
						blankCount++;
					}
				}
				if(blankCount==stageWidth/32){
					if(i<=highestValue){
						highestValue = i;
					}
				}else{
					return highestValue;
				}
			}
			return highestValue;
		}
		
		public static function timer(delay:int, display:String):void{
			while(timerDelay<delay){
				for(var j:int=0;j<100;j++){
					//delay maker;
				}
				timerDelay++;
			}
			if(timerDelay==delay){
				TextManager.Disp(display);
			}
		}
		public static function menu(numberOfOptions:int, menuName:String, optionsArray:Array, functionsArray:Array){
			TextManager.COutput(1,menuName);
			if(TextManager.textArray[17]!="1"){
				for(var i:int=1;i<numberOfOptions+1;i++){
					TextManager.Output(1,1+i,i+": "+optionsArray[i-1]);
				}
			}
			for(var j:int=0;j<numberOfOptions;j++){
				if(KeyboardManager.keyArray[49+j][1]==true && KeyboardManager.keyDelay>=KeyboardManager.KEY_DELAY_MAX){
					KeyboardManager.keyDelay=0;
					Main.stageRef.addEventListener(Event.ENTER_FRAME, functionsArray[j]);
					return false;
				}
			}
			return true;
		}
	}
}
