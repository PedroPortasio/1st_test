package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import flash.display.Sprite;
	
	public class Main extends Engine
	{
		public function Main()
		{
			super(800, 600, 60, false);
			FP.world = new MyWorld;
			FP.screen.color = 0xFFFFFF;
			
		}
	}
}