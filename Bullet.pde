class Bullet extends Sprite {
    
    Bullet(float x, float y, PVector velocity, int team) {
        super(x, y, 17,17,1  ); 
        vel = velocity;
        this.team = team;
    }

    Bullet(PVector pos, PVector vel, int team) {
        this(pos.x, pos.y, vel, team);
    }
        
    void update() {
        pos.add(vel);
    }
}
