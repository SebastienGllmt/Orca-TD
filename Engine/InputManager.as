package Engine
{
	import flash.display.*;
	import flash.events.*;
	
	public class InputManager
	{	
		public static var keyArray:Array = new Array();

		public static function Input(Question:String):void{
			var furthestLine = DisplayManager.newLine();
			if(furthestLine == 9){
				trace("No room for input deciding the '" + Question+"'");
			}else{
				TextManager.Output(1,furthestLine,Question);
				/*
				
				*TODO
				
				*/
				//TextManager.Output(Question.length, furthestLine, String.fromCharCode(e.keyCode));
			}
		}
		
	}
}
