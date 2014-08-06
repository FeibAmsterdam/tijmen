
import java.lang.reflect.*;

class Spawner extends GameObject {

	Constructor ctor;

	GameObject last;

	public Spawner() {
	}

	void parseArgs(String args) {
		println("Spawner parseArgs", args);
		try {
			Class cl = Class.forName("tijmen$" + args);
			java.lang.reflect.Constructor[] ctors = cl.getDeclaredConstructors();
			this.ctor = ctors[0];
		} catch(Exception e) {
				//this.destroyed = true;
		}
	}
	GameObject spawn() {
		try {
			return (GameObject)this.ctor.newInstance(new Object[] { tijmen.this });
		} catch(Exception e) {
			return null;
		}
	}
	@Override
	void update(float timeStep) {
		if(last == null) {
			println("Spawn!");
			last = spawn();
			println(last);
			last.position = this.position;
			if(last != null) {
				currentLevel.add(last);
			} else {
				//this.destroyed = true;
			}
		}
	}
}

class Entrance extends Spawner
{
	Entrance() {
		Class cl = Player.class;
		java.lang.reflect.Constructor[] ctors = cl.getDeclaredConstructors();
		this.ctor = ctors[0];
	}
	void parseArgs(String args) {
		println("Entrance parseArgs", args);
	}
	GameObject spawn() {
		Player p = (Player)super.spawn();
		player = p;
		return p;
	}
}
