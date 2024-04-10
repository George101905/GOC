class SpriteManager {
    Player player;
    
    ArrayList<Sprite> active = new ArrayList<Sprite>();
    ArrayList<Sprite> enemies = new ArrayList<Sprite>();
    ArrayList<Sprite> goodGuys = new ArrayList<Sprite>();
    ArrayList<Sprite> destroyed = new ArrayList<Sprite>();
    
    SpriteManager() {
        player = new Player(width / 2, height - 100);
        spawn(player);
       
    }
    
    void destroy(Sprite target) {
        destroyed.add(target);
    }
    
    void spawn(Sprite obj) {
        active.add(obj);
        if(obj.team == 1){
            goodGuys.add(obj);
        }else{
            enemies.add(obj);
        }    
    }
    
    void manage() {
        moveEverything();
        checkCollisions();    
        bringOutTheDead();
        drawEverything();
        getTiers(enemies);
        getTiers(goodGuys);
    }
    
    void moveEverything() {
        for(int i = active.size() - 1; i >= 0; i--) {
            active.get(i).update();           
        }
    }
    
    void drawEverything() {
        for (Sprite s : active)
            s.display();
    }
    
    void checkCollisions() {
        for (int i = 0; i < active.size(); i++) {
            for (int j = i + 1; j < active.size(); j++) {
                Sprite a = active.get(i);
                Sprite b = active.get(j);
                if (a.team != b.team && collision(a, b)) {
                    active.get(i).handleCollision();
                    active.get(j).handleCollision();
                }
            }
        }
    }
    
    void bringOutTheDead() {
        for (int i = 0; i < destroyed.size(); i++) {
            Sprite target = destroyed.get(i);
            active.remove(target);
            destroyed.remove(target);
        }
    }
    
    boolean collision(Sprite a, Sprite b) {
        float r1 = a.size.x / 2.0;
        float r2 = b.size.x / 2.0;
        return r1 + r2 > dist(a.pos.x, a.pos.y, b.pos.x, b.pos.y);
    }

    public void getTiers(ArrayList<Sprite> list){
        textSize(25);
        int enemy = 0;
        int miniBoss = 0;
        int boss = 0;
        for(int i = 0; i < list.size(); i++){
            if(list.get(i).getTeam() == 1){
                //return "Player: 1";
                text("Player: 1", 0, 50);
                return;
            } else {
                if(list.get(i).getHp() == 1){
                    enemy += 1;
                } else if(list.get(i).getHp() == 2){
                    miniBoss += 1;
                } else if(list.get(i).getHp() == 5){
                    boss += 1;
                }
            }
        }
        //return "Enemies: " + enemy + " MiniBosses: " + miniBoss + " Bosses: " + boss;
        text("Enemies/bullets: " + enemy, 0, 100);
        text("MiniBosses: " + miniBoss, 0, 150);
        text("Bosses: " + boss, 0, 200);
    }
}