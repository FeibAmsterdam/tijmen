


float nextGaussian = 0;
boolean haveNextGaussian = false;

class Random {
    int MBIG = Integer.MAX_VALUE;
    int MSEED = 161803398;

    int inext, inextp;
    int[] seedArray = new int[56];

	Random(int seed) {
        int ii;
        int mj, mk;

        if (seed == Integer.MIN_VALUE)
            mj = MSEED - abs(Integer.MIN_VALUE + 1);
        else
            mj = MSEED - abs(seed);

        seedArray[55] = mj;
        mk = 1;
        for (int i = 1; i < 55; i++)
        {  //  [1, 55] is special (Knuth)
            ii = (21 * i) % 55;
            seedArray[ii] = mk;
            mk = mj - mk;
            if (mk < 0)
                mk += MBIG;
            mj = seedArray[ii];
        }
        for (int k = 1; k < 5; k++)
        {
            for (int i = 1; i < 56; i++)
            {
                seedArray[i] -= seedArray[1 + (i + 30) % 55];
                if (seedArray[i] < 0)
                    seedArray[i] += MBIG;
            }
        }
        inext = 0;
        inextp = 31;
    }

    float sample()
    {
        int retVal;

        if (++inext >= 56) inext = 1;
        if (++inextp >= 56) inextp = 1;

        retVal = seedArray[inext] - seedArray[inextp];

        if (retVal < 0)
            retVal += MBIG;

        seedArray[inext] = retVal;

        return (float)(retVal * (1.0f / MBIG));
    }
}

class Gaussian {
	float nextGaussian;
	boolean haveNextGaussian;
	public Random rand;
	Gaussian(int seed) {
		this.nextGaussian = 0;
		this.haveNextGaussian = false;
		this.rand = new Random(seed);
	}
	float next() {
		if(this.haveNextGaussian) {
			this.haveNextGaussian = false;
			return this.nextGaussian;
		} else {
			float v1,v2,s;
			do {
				v1 = 2 * rand.sample() - 1;
				v2 = 2 * rand.sample() - 1;
				s = v1 * v1 + v2 * v2;
			} while (s >=1 || s == 0);

			float mult = sqrt(-2 * log(s) / s);
			this.nextGaussian = v2 * mult;
			this.haveNextGaussian = true;
			return v1 * mult;
		}
	}
}

class Pencil {
	int seed;
	private color strokeColor;
	private color fillColor;
	Pencil() {
		this((int)random(0,100));
	}
	Pencil(int seed) {
		this.seed = seed;
		strokeColor = color(150);
		fillColor = color(150);
	}
	void pline(PVector a, PVector b) {
		stroke(strokeColor,70);

		float w = 2;
	    float n = w*2;
	    float col = 0;

		Gaussian gauss = new Gaussian(seed);

		for(int i=0;i<n;i++) {
			// TODO: randomize current stroke
			//stroke(180+col/3+g.next()*10,col,220-col/3+g.next()*5,30);
			line( a.x+gauss.next()*w,a.y+gauss.next()*w,
				b.x+gauss.next()*w,b.y+gauss.next()*w);
		}
	}

	void circle(PVector position, float radius) {
		stroke(strokeColor,70);
        noFill();

		Gaussian gauss = new Gaussian(seed);
	    float width1 = 2;
	    float width2 = 1;
		for(int i=0;i<5;i++) {
			pushMatrix();
			{
				translate(position.x, position.y);
				rotate(gauss.next()*2*PI);
				ellipse(gauss.next()*width2,gauss.next()*width2,radius+gauss.next()*width1,radius+gauss.next()*width1);
			}
			popMatrix();
		}
	}

	void prect(PVector position, PVector halfSize) {
        PVector topleft = PVector.mult(halfSize, -1);
        PVector bottomright = halfSize;
        PVector topright = topleft.get();
        topright.x *= -1f;
        PVector bottomleft = PVector.mult(topright, -1f);

	    pushMatrix();
        {
        	translate(position.x, position.y);
	        this.pline(topleft, topright);
	        this.pline(topright, bottomright);
	        this.pline(bottomright, bottomleft);
	        this.pline(bottomleft, topleft);
	    }
        popMatrix();
	}

	void pfillrect(PVector position, PVector halfSize) {

		stroke(fillColor, 30);

		float w = 2f;
		float longSide = max(halfSize.x, halfSize.y);

		int count = (int)(longSide) * 2;

		Gaussian gauss = new Gaussian(seed);
		float angle = .1f;
		PVector proj = new PVector(0, longSide*4);
		proj.rotate(angle);
		pushMatrix();
		{
			translate(position.x, position.y);
			float step = longSide / count * 2;
			for(int i = 1; i < count+10; i++) {
				PVector top = new PVector( -halfSize.x + (i*step), -halfSize.y);
				PVector bot = PVector.add(top,proj);

				top.x = min(top.x, halfSize.x);
				bot.x = max(bot.x, -halfSize.x);
				bot.y = min(bot.y, halfSize.y);

				if(bot.x >= halfSize.x)
					break;

				line(top.x + gauss.next()*w, top.y + gauss.next()*w, bot.x + gauss.next()*w, bot.y + gauss.next()*w);
			}
		}
		popMatrix();
	}
}



// float randomGaussian() {
// 	if(haveNextGaussian) {
// 		haveNextGaussian = false;
// 		return nextGaussian;
// 	} else {
// 		float v1,v2,s;
// 		do {
// 			v1 = 2 * random() - 1;
// 			v2 = 2 * random() - 1;
// 			s = v1 * v1 + v2 * v2;
// 		} while (s >=1 || s == 0);

// 		float mult = sqrt(-2 * log(s) / s);
// 		nextGaussian = v2 * mult;
// 		haveNextGaussian = true;
// 		return v1 * mult;
// 	}
// }



