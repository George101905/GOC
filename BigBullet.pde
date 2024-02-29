class BigBullet extends Sprite {
    
    BigBullet(float x, float y, PVector velocity, int team) {
        super(x, y, 200,200,1); 
        vel = velocity;
        this.team = team;
    }

    BigBullet(PVector pos, PVector vel, int team) {
        this(pos.x, pos.y, vel, team); 
       
    }
        
    void update() {
        pos.add(vel);
    }
}
