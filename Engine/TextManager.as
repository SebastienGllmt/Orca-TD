package Engine
{
	import flash.display.*;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.describeType;
	import flash.text.AntiAliasType;
	
	public class TextManager extends MovieClip
	{
		public static var textArray:Array = new Array();
		//[Embed(source="C:/Windows/Fonts/ProggySquareTTSZRegular.ttf", fontName="ProggySquareTTSZ", mimeType="application/x-font-truetype")]
		//public static const FONT_ProggySquareTTSZ:String;
		
		public static function createTextField():void	{
			var stageWidth:int = Main.stageWidth;
			var stageHeight:int = Main.stageHeight;
			for(var tileY:int=0;tileY<stageHeight/48;tileY++){
				for(var tileX:int=0;tileX<stageWidth/32;tileX++){
					var textSlot:TextField = new TextField();
					textSlot.defaultTextFormat = textFieldFormat();
					textSlot.text = " ";
					textSlot.height = 48;
					textSlot.x = tileX * 32;
					textSlot.y = tileY * 48;
					//textSlot.embedFonts= true;
					textSlot.selectable = false;
					TextManager.textArray.push(textSlot);
				}
			}
		}
		
		public static function addTextArray():void	{
			for(var i:int;i<TextManager.textArray.length;i++){
				Main.stageRef.addChild(TextManager.textArray[i]);
			}
		}
		
		public static function textFieldFormat():TextFormat {
			var r:TextFormat = new TextFormat(); 
			r.font = "ProggySquareTTSZ";
			r.color=0x000000;
			r.size = 64;
			return r;
		}
		
		public static function Output(positionX:int, positionY:int, displayText:String):void{
			for(var i:int;i<displayText.length;i++){
				TextManager.textArray[((positionY-1)*(Main.stageWidth/32))+positionX-1+i].text = displayText.substring(i,i+1);
			}
		}
		public static function COutput(positionY:int, displayText:String):void{
			for(var i:int;i<displayText.length;i++){
				TextManager.textArray[((positionY-1)*(Main.stageWidth/32))+Math.floor(((Main.stageWidth/32)-displayText.length)/2)+i].text = displayText.substring(i,i+1);
			}
		}
		public static function Disp(displayText:String):void{
			var positionY:int = DisplayManager.newLine();
			if(positionY!=(Main.stageHeight/48)+1){
				for(var i:int;i<displayText.length;i++){
					TextManager.textArray[((positionY-1)*(Main.stageWidth/32))+i].text = displayText.substring(i,i+1);
				}
			}else{
				trace("No room for Disp of "+displayText);
			}
		}
		
		public static function clearHome():void{
			for(var i:int;i<TextManager.textArray.length;i++){
				TextManager.textArray[i].text = " ";
				Main.stageRef.addChild(TextManager.textArray[i]);
			}
		}
	}
}