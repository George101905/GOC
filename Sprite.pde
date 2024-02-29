class Sprite {
    PVector pos, vel, size;
    int team = 2;
    int hp;
    
    Sprite(float x, float y, float w, float h, int hp) {
        pos = new PVector(x, y);
        vel = new PVector(0, 0);
        size = new PVector(w, h);
        this.hp = hp;
    }
    
    int getHp(){
        return hp;
    }
    
    void update() {
        
    }
    
    void display() {
        fill(252, 252, 252);
        ellipse(pos.x, pos.y, size.x, size.y);
    }
    
    void handleCollision() {
        hp -= 1;
        if(hp <= 0){
           _SM.destroy(this);
        }
    }
}
