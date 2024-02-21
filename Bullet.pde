class Bullet extends Sprite {
    
    Bullet(float x, float y, PVector velocity, int team) {
        super(x, y, 17,17  ); // invoke parent constructor
        vel = velocity;
        this.team = team;
    }

    Bullet(PVector pos, PVector vel, int team) {
        // constructor chaining
        this(pos.x, pos.y, vel, team); // invoke another own constructor
        // this refers to the above on line 3
    }
        //
    void update() {
        pos.add(vel);
    }
}
