package Engine
{
	public class PlayerManager
	{
		public static var xStartPos:int=Math.round((Main.stageWidth/32)/2);
		public static var yStartPos:int=Math.round((Main.stageHeight/48)/2);
		public static var playerX:int=xStartPos;
		public static var playerY:int=yStartPos;
		
		public static function playerMove():void{
			TextManager.Output(playerX,playerY,"O");
			var playerPosition:int = playerInList();
			if(KeyboardManager.keyDelay==8){
				if(KeyboardManager.keyArray[40][1]==true && playerY<8 && TextManager.textArray[playerPosition+16].text ==" "){
					playerMoveEffect();
					playerY++;
				} else if(KeyboardManager.keyArray[38][1]==true && playerY>1 && TextManager.textArray[playerPosition-16].text ==" "){
					playerMoveEffect();
					playerY--;
				}
				else if(KeyboardManager.keyArray[39][1]==true && playerX<16 && TextManager.textArray[playerPosition+1].text ==" "){
					playerMoveEffect();
					playerX++;
				}
				else if(KeyboardManager.keyArray[37][1]==true && playerX>1 && TextManager.textArray[playerPosition-1].text ==" "){
					playerMoveEffect();
					playerX--;
				}
			}
		}
		public static function playerMoveEffect():void{
			TextManager.Output(playerX,playerY," ");
			KeyboardManager.keyDelay=0;
		}
		
		public static function playerInList(){
			return (((playerY-1)*16)+playerX-1);
		}
	}
}