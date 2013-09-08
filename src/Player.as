package
{
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP

	public class Player extends Entity
	{
		
		[Embed(source = "../assets/player.png")] private const PLAYER:Class;
		
		public function Player(x, y)
		{
			super(x, y);
			graphic = new Image (PLAYER);
			
			setHitbox (20, 20, 12, 0); 
			
			
			Input.define("MoveUp", Key.W);
			Input.define("MoveDown", Key.S);
			Input.define("MoveRight", Key.A);
			Input.define("MoveLeft", Key.D);
			
			Input.define("ShootUp", Key.UP);
			Input.define("ShootDown", Key.DOWN);
			Input.define("ShootRight", Key.RIGHT);
			Input.define("ShootLeft", Key.LEFT);
			
			Input.define("PlusSSPD", Key.K);
			Input.define("LessSSPD", Key.L);
			
			
		}

		override public function update():void
		{
			if (x <= 0) x = 0;
			if (x >= FP.width - 2*this.width) x = FP.width- 2*this.width;
			if (y <= 0) y = 0;
			if (y >= FP.height - this.height) y = FP.height - this.height;
			
			if (Input.check("PlusSSPD")) { GVars.bSpeed += 20; }
			if (Input.check("LessSSPD")) { GVars.bSpeed -= 20; }
			
			if (Input.check("MoveUp")) { y -= GVars.pSpeed; }
			if (Input.check("MoveDown")) { y += GVars.pSpeed; }
			if (Input.check("MoveRight")) { x -= GVars.pSpeed; }
			if (Input.check("MoveLeft")) { x += GVars.pSpeed; }
			
			if (Input.pressed("ShootUp"))
			{
				this.world.add(new Shot(this.x + this.width / 2 -12, this.y + this.height / 2-10))
				this.world.add(new Shot(this.x + this.width / 2 +3, this.y + this.height / 2 - 25))
				this.world.add(new Shot(this.x + this.width / 2 +20, this.y + this.height / 2-10))
				GVars.sSpeed = 0;
			}
			
			if (Input.check("ShootUp")) 
			{
				GVars.sSpeed += 1;
				if (GVars.sSpeed >= 16)
				{
				this.world.add(new Shot(this.x + this.width / 2 -12, this.y + this.height / 2-10))
				this.world.add(new Shot(this.x + this.width / 2 +3, this.y + this.height / 2 - 25))
				this.world.add(new Shot(this.x + this.width / 2 +20, this.y + this.height / 2-10))
				GVars.sSpeed = 0;
				}
			}
		
			super.update();
		}
	}
}