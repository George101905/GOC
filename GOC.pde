
    SpriteManager _SM;

    void setup() {
        size(1024, 768);
        _SM = new SpriteManager();
        _SM.spawn(new Shooter(250, 100));
        _SM.spawn(new Shooter(70, 50));
        _SM.spawn(new Shooter(1, 100));
        _SM.spawn(new Shooter(150, 50));
        _SM.spawn(new Invader(250, 200));
        _SM.spawn(new Invader(70, 200));
        _SM.spawn(new Invader(1, 200));
        _SM.spawn(new Invader(150, 200));
        _SM.spawn(new Sneaky (100,50));
        _SM.spawn(new Sneaky (200,50));
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
