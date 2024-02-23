
    SpriteManager _SM;

    void setup() {
        size(1024, 768);
        _SM = new SpriteManager();
        _SM.spawn(new Shooter(250, 300));
        _SM.spawn(new Shooter(70, 250));
        _SM.spawn(new Shooter(1, 200));
        _SM.spawn(new Shooter(150, 250));
        _SM.spawn(new Invader(250, 300));
        _SM.spawn(new Invader(70, 300));
        _SM.spawn(new Invader(1, 300));
        _SM.spawn(new Invader(150, 300));
        _SM.spawn(new Sneaky (100,50));
        _SM.spawn(new Sneaky (200,50));
        _SM.spawn(new BigGuy(200,50));
        _SM.spawn(new BigGuy(400,50));
        _SM.spawn(new BigGuy(600,50));

    }

    void draw() {
        background(0);
        _SM.manage();
    }

void keyPressed() {
    _SM.player.keyDown();
}

void keyReleased() {
    _SM.player.keyUp();
}
