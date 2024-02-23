class Shooter extends Invader {

    long mark, wait = 750 ; // ms

    Shooter(float x, float y) {
        super(x, y);
        mark = millis();     
        vel = new PVector(5, 0);
    }
    
    @Override
    void display() {
        fill(255, 8, 0 );
        ellipse(pos.x, pos.y, size.x, size.y);
    }
    @Override
    void update() {
        super.update();
        PVector aim = new PVector(_SM.player.pos.x - this.pos.x, _SM.player.pos.y - this.pos.y);
        aim = aim.normalize().mult(8); // turn this into a single unit vector, then increase its magnitude

        if(millis() - mark > wait) {
            mark = millis();
            _SM.spawn(new Bullet(pos, aim, team));
        }
    }
}
