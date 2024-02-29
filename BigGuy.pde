class BigGuy extends Sprite {
    long mark, wait = 1000; 

    BigGuy(float x, float y) {
        super(x, y,85,85,5);
        vel = new PVector(3, 0);
        mark = millis();
    }
    
    @Override
    void display(){
      fill(156, 38, 196);
      ellipse(pos.x, pos.y, size.x, size.y);
    }
    
   
    @Override
    void update(){
        super.update();
        PVector aim = new PVector(_SM.player.pos.x - this.pos.x, _SM.player.pos.y - this.pos.y);
        aim = aim.normalize().mult(8);

        if(millis() - mark > wait) {
            mark = millis();
            _SM.spawn(new BigBullet(pos, aim, team));
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
