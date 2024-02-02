class Shooter extends Invader {

    long mark, wait = 1500; // ms

    Shooter(float x, float y) {
        super(x, y);
        mark = millis();
        vel = new PVector(10 , 0);
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
