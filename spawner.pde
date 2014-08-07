
import java.lang.reflect.*;

class Spawner extends GameObject {

	Constructor ctor;

	GameObject last;

	public Spawner() {
	}

    @Override
    boolean collidesWith(GameObject other) {
        return false;
    }

	void parseArgs(String args) {
		println("Spawner parseArgs", args);
		try {
			Class cl = Class.forName("tijmen$" + args);
			java.lang.reflect.Constructor[] ctors = cl.getDeclaredConstructors();
			this.ctor = ctors[0];
		} catch(Exception e) {
			this.destroyed = true;
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
		if(last == null || last.destroyed) {
			last = spawn();
			last.position = this.position.get();
			if(last != null) {
				currentLevel.add(last);
			} else {
				this.destroyed = true;
			}
		}
	}
}

class Entrance extends Spawner {
	Entrance() {
		Class cl = Player.class;
		java.lang.reflect.Constructor[] ctors = cl.getDeclaredConstructors();
		this.ctor = ctors[0];
	}

	void parseArgs(String args) {
	}

	GameObject spawn() {
		Player p = (Player)super.spawn();
		player = p;
		return p;
	}

	void draw(){

	}
}

class Exit extends GameObject {

	String filename;
	Pencil pencil;
	Exit() {
		this.pencil = new Pencil();
	}

	void parseArgs(String args) {
		filename = "./levels/"+args;
	}

    @Override
    boolean collidesWith( GameObject other ) {
        return false;
    }

	void overlaps( GameObject other ) {
		if(other == player) {
			switchLevel = filename;
		}
	}

	void draw() {
		this.pencil.strokeColor = color(100, 255, 100);
		this.pencil.fillColor = color(100, 255, 100);

		pushMatrix();
		{
			translate(this.position.x, this.position.y);
			this.pencil.circle(new PVector(0,0), 40);
			this.pencil.pfillrect(new PVector(0,0), new PVector(16, 16));
			this.pencil.pline(new PVector(-5,-4), new PVector(0,5));
			this.pencil.pline(new PVector(12,-9), new PVector(0,5));
		}
		popMatrix();
	}
}
