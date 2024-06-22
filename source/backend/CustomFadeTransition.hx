package backend;

import flixel.util.FlxGradient;

class CustomFadeTransition extends MusicBeatSubstate {
	public static var finishCallback:Void->Void;
	private var leTween:FlxTween = null;
	public static var nextCamera:FlxCamera;
	var isTransIn:Bool = false;
	var transBlack:FlxSprite;
	var transGradient:FlxSprite;
	var loadImage:FlxSprite;

	public function new(duration:Float, isTransIn:Bool) {
		super();
		this.isTransIn = isTransIn;
		var zoom:Float = FlxMath.bound(FlxG.camera.zoom, 0.05, 1);
		var width:Int = Std.int(FlxG.width / zoom);
		var height:Int = Std.int(FlxG.height / zoom);
		transGradient = FlxGradient.createGradientFlxSprite(1, height, (isTransIn ? [0x0, FlxColor.BLACK] : [FlxColor.BLACK, 0x0]));
		transGradient.scale.x = width;
		transGradient.updateHitbox();
		transGradient.scrollFactor.set();
		add(transGradient);

		transBlack = new FlxSprite().makeGraphic(1, height + 400, FlxColor.BLACK);
		transBlack.scale.x = width;
		transBlack.updateHitbox();
		transBlack.scrollFactor.set();
		add(transBlack);

		transGradient.x -= (width - FlxG.width) / 2;
		transBlack.x = transGradient.x;

		loadImage = new FlxSprite().loadGraphic('assets/images/funkay.png');
		loadImage.antialiasing = true;
		loadImage.setGraphicSize(Std.int(loadImage.width * 0.8));
		loadImage.updateHitbox();
		loadImage.y = loadImage.y - 20;
		loadImage.scrollFactor.set();
		loadImage.alpha = 0;

		if(isTransIn) {
			transGradient.y = transBlack.y - transBlack.height;
			loadImage.alpha = 1; // should let me transition it back to alpha 0
			add(loadImage);
			FlxTween.tween(loadImage, {alpha: 0}, 0.4, {onComplete: function(twn:FlxTween) {
						FlxTween.tween(transGradient, {y: transGradient.height + 50}, duration, {
				onComplete: function(twn:FlxTween) {
					close();
				},
			ease: FlxEase.linear});
			}, ease: FlxEase.linear});
		} else {
			transGradient.y = -transGradient.height;
			transBlack.y = transGradient.y - transBlack.height + 50;
			leTween = FlxTween.tween(transGradient, {y: transGradient.height + 50}, duration, {
				onComplete: function(twn:FlxTween) {
					add(loadImage);
					FlxTween.tween(loadImage, {alpha: 1}, 0.4, {onComplete: function(twn:FlxTween) {
						if(finishCallback != null) {
						finishCallback();
					}}, ease: FlxEase.linear});
				},
			ease: FlxEase.linear});
		}

		if(nextCamera != null) {
			transBlack.cameras = [nextCamera];
			transGradient.cameras = [nextCamera];
		}
		nextCamera = null;
	}

	override function update(elapsed:Float) {
		if(isTransIn) {
			transBlack.y = transGradient.y + transGradient.height;
		} else {
			transBlack.y = transGradient.y - transBlack.height;
		}
		super.update(elapsed);
		if(isTransIn) {
			transBlack.y = transGradient.y + transGradient.height;
		} else {
			transBlack.y = transGradient.y - transBlack.height;
		}
	}

	override function destroy() {
		if(leTween != null) {
			finishCallback();
			leTween.cancel();
		}
		super.destroy();
	}
}