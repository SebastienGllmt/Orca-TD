package
{
	import flash.events.*;
	import Engine.*;
	
	public class MonsterWaves
	{
		public static var waveNumber:int=1;
		public static var delay:int=0;
		
		public static function nextWave(e:Event){
			DisplayManager.onMenu=false;
			var yourPower:int=ItemManager.getPlayerPow()
			trace(Math.pow(waveNumber+5,3)-(27*waveNumber*waveNumber)+waveNumber-290);
			var theirPower:int=Math.round((Math.pow(waveNumber+5,3)-(27*waveNumber*waveNumber)+waveNumber-290));
			if(theirPower<1){
				theirPower=1;
			}
			if(delay==0){
				
				TextManager.clearHome();
				TextManager.Disp("Wave: "+waveNumber);
			}
			if(delay<500){
				delay++;
			}
			if(delay<100){
				TextManager.Output(1+(delay/10),5,"O");
				TextManager.Output(21-(delay/10),5,"|");
			}
			if(delay==200){
				if(yourPower>theirPower){
					for(var i:int=0;i<(yourPower-theirPower);i++){
						if(i<9){
							TextManager.Output(11+i,5,"O");
						}
					}
					TextManager.COutput(6,"Won "+(ItemManager.getWaveRevenue(yourPower-theirPower)+1)+" gold");
				}
				if(yourPower==theirPower){
					TextManager.COutput(7,"Tied!");
				}
				if(yourPower<theirPower){
					for(var j:int=0;j<(theirPower-yourPower);j++){
						if(j<9){
							TextManager.Output(10-j,5,"|");
						}
					}
					ItemManager.Health-=(theirPower-yourPower);
					TextManager.COutput(7,"Lost "+(theirPower-yourPower)+" health");
				}
			}
			if(delay==250){
				TextManager.COutput(2,"Your Power: "+ yourPower);
				TextManager.COutput(3,"Their Power: "+ theirPower);
				TextManager.COutput(8,ItemManager.Health+" Health left!");
			}
			
			if(delay>350){
				if(ItemManager.Health<=0){
					Drawings.gameOver();
				}else{
					delay=0;
					TextManager.clearHome();
					waveNumber++;
					DisplayManager.onMenu=true;
					ItemManager.Money = ItemManager.Money+ItemManager.getWaveRevenue(yourPower-theirPower);
					ItemManager.chancePow = false;
					ItemManager.tempPower = false;
					Main.stageRef.addEventListener(Event.ENTER_FRAME, Main.loopFunctions);
					Main.stageRef.removeEventListener(Event.ENTER_FRAME, nextWave);
				}
			}
		}
	}
}