package
{
	import Engine.*;
	import flash.events.*;
	
	public class Drawings
	{
		public static function drawOrca():void{
			TextManager.clearHome();
			TextManager.Disp("    /----L          ");
			TextManager.Disp("   |      --L   --  ");
			TextManager.Disp("  /  O  O    --/ |  ");   
			TextManager.Disp("  |              |  ");
			TextManager.Disp("  |  __  L  |    /  ");
			TextManager.Disp("  |      |  |___/   ");
			TextManager.Disp("   L____/L  |       ");
			TextManager.Disp("          L_/       ");
		}
		public static function exitGame(e:Event):void{
			DisplayManager.onMenu=false;
			TextManager.clearHome();
			TextManager.COutput(1,"Goodbye!");
			TextManager.COutput(3,"Thank you");
			TextManager.COutput(4,"for playing!");
			TextManager.COutput(7,"Sebastien");
			TextManager.COutput(8,"@OrcaJam");
			Main.stageRef.removeEventListener(Event.ENTER_FRAME, exitGame);
		}
		public static function gameOver():void{
			TextManager.clearHome();
			TextManager.COutput(1,"Out of lives @");
			TextManager.COutput(2,"Wave: " + MonsterWaves.waveNumber);
			TextManager.COutput(3,"Thank you");
			TextManager.COutput(4,"for playing!");
			TextManager.COutput(7,"Sebastien");
			TextManager.COutput(8,"@OrcaJam");
		}
	}
}