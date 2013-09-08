package  
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class Shot extends Entity
	{
		[Embed(source = "../assets/shot.png")] private const SHOT:Class;
		
		public function Shot(x, y)
		{
			super(x, y);
			graphic = new Image(SHOT);
		}
		
		override public function update():void
		{
			this.y -= FP.elapsed * GVars.bSpeed;
			
			if (this.y < -80 || this.y > FP.height+80) {this.world.remove(this)}
			
			super.update();
		}
		
	}

}