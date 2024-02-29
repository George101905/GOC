class Shooter extends Sprite {

    long mark, wait = 750 ;
     

    Shooter(float x, float y) {
        super(x, y,40,40,1);
        mark = millis();     
        vel = new PVector(5,0);
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
        aim = aim.normalize().mult(8); 

        if(millis() - mark > wait) {
            mark = millis();
            _SM.spawn(new Bullet(pos, aim, team));
        }

        pos.add(vel);
        
        if (pos.x < 0 || pos.x > width) {
            vel.x *= -1;
        }
        if (pos.y < 0 || pos.y > height) {
            vel.y *= -1;
        }
    }
    
}
