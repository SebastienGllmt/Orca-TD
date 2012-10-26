package Engine
{
	public class ItemManager
	{
		public static var Money:int=2;
		public static var Health:int=50;
		public static var incomeMulti:int=1;
		public static var archerTower:int=0;
		public static var jamTower:int=0;
		public static var teslaCoil:int=0;
		public static var harpoonTower:int=0;
		public static var tempPower:Boolean=false;
		public static var chancePow:Boolean=false;
		
		public static function getPlayerPow(){
			var power:int = archerTower+(jamTower*6)+(teslaCoil*30)+(harpoonTower*80);
			if(tempPower==true){
				power = power+100;
			}
			if(chancePow==true){
				power = power+999;
			}
			return power;
		}
		public static function getWaveRevenue(winBonus:int){
			var moneyGained:int;
			if(winBonus>=0){
				moneyGained = ((winBonus+MonsterWaves.waveNumber)*incomeMulti);
			}else{
				moneyGained = (MonsterWaves.waveNumber*incomeMulti);
			}
			return moneyGained;
		}
	}
}