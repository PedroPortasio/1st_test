package
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	
	public class MyWorld extends World
	{
		private var player:Player;
		
		public function MyWorld()
		{
			super();
			//add(new Player(FP.width/2, FP.height/3));
		}
		
		override public function begin():void 
		{
			player = new Player(FP.width / 2, FP.height/10*8);
			this.add(player);
		}
		
	}
}