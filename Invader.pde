class Invader extends Sprite {
    Invader(float x, float y) {
        super(x, y, 40,40, 1);
        vel = new PVector(20, 0);
    }
    

    @Override
    void update() {
        pos.add(vel);
        
        if (pos.x < 0 || pos.x > width) {
            vel.x *= -1;
        }
        if (pos.y < 0 || pos.y > height) {
            vel.y *= -1;
        }
    }
}
