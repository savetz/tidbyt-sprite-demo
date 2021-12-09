#pac man clock animation
#by Kay Savetz, Dec 8 2021

load("render.star", "render")
load("time.star", "time")

def main(config):

	timezone = config.get("timezone") or "America/Los_Angeles"
	now = time.now().in_location(timezone)
	bgColor = "#003"

	#Sprites
	#sprites from https://www.spriters-resource.com/arcade/pacman/
	# #XXX is a "see through" pixel
	#
	sprite=[]
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite0 = makeSprite(sprite,1)
	
	sprite=[]
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite1 = makeSprite(sprite,1)

	sprite=[]
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX"])
	sprite.append(["#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX"])
	sprite.append(["#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX"])
	sprite.append(["#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX"])
	sprite.append(["#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#XXX","#FF0","#FF0","#FF0","#FF0","#FF0","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite2 = makeSprite(sprite,1)

	sprite=[]
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#F00","#F00","#F00","#F00","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#F00","#F00","#F00","#DDF","#DDF","#F00","#F00","#F00","#F00","#DDF","#DDF","#F00","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#F00","#F00","#DDF","#DDF","#DDF","#DDF","#F00","#F00","#DDF","#DDF","#DDF","#DDF","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#F00","#F00","#DDF","#DDF","#22F","#22F","#F00","#F00","#DDF","#DDF","#22F","#22F","#XXX","#XXX"])
	sprite.append(["#XXX","#F00","#F00","#F00","#DDF","#DDF","#22F","#22F","#F00","#F00","#DDF","#DDF","#22F","#22F","#F00","#XXX"])
	sprite.append(["#XXX","#F00","#F00","#F00","#F00","#DDF","#DDF","#F00","#F00","#F00","#F00","#DDF","#DDF","#F00","#F00","#XXX"])
	sprite.append(["#XXX","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#XXX"])
	sprite.append(["#XXX","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#XXX"])
	sprite.append(["#XXX","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#XXX"])
	sprite.append(["#XXX","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#XXX"])
	sprite.append(["#XXX","#F00","#F00","#XXX","#F00","#F00","#F00","#XXX","#XXX","#F00","#F00","#F00","#XXX","#F00","#F00","#XXX"])
	sprite.append(["#XXX","#F00","#XXX","#XXX","#XXX","#F00","#F00","#XXX","#XXX","#F00","#F00","#XXX","#XXX","#XXX","#F00","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	ghost0 = makeSprite(sprite,1)

	sprite=[]
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#F00","#F00","#F00","#F00","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#F00","#F00","#F00","#DDF","#DDF","#F00","#F00","#F00","#F00","#DDF","#DDF","#F00","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#F00","#F00","#DDF","#DDF","#DDF","#DDF","#F00","#F00","#DDF","#DDF","#DDF","#DDF","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#F00","#F00","#DDF","#DDF","#22F","#22F","#F00","#F00","#DDF","#DDF","#22F","#22F","#XXX","#XXX"])
	sprite.append(["#XXX","#F00","#F00","#F00","#DDF","#DDF","#22F","#22F","#F00","#F00","#DDF","#DDF","#22F","#22F","#F00","#XXX"])
	sprite.append(["#XXX","#F00","#F00","#F00","#F00","#DDF","#DDF","#F00","#F00","#F00","#F00","#DDF","#DDF","#F00","#F00","#XXX"])
	sprite.append(["#XXX","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#XXX"])
	sprite.append(["#XXX","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#XXX"])
	sprite.append(["#XXX","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#XXX"])
	sprite.append(["#XXX","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#F00","#XXX"])
	sprite.append(["#XXX","#F00","#F00","#F00","#F00","#XXX","#F00","#F00","#F00","#F00","#XXX","#F00","#F00","#F00","#F00","#XXX"])
	sprite.append(["#XXX","#XXX","#F00","#F00","#XXX","#XXX","#XXX","#F00","#F00","#XXX","#XXX","#XXX","#F00","#F00","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	ghost1 = makeSprite(sprite,1)
	
	###create frames to animate the sprite
	frames=[]
	animCounter=0
	
	for i in range(-8,110,1):
		if animCounter == 0:
			animSprite = sprite0
			ghostSprite = ghost0
		elif animCounter == 1:
			animSprite = sprite1
			ghostSprite = ghost1			
		elif animCounter == 2:
			animSprite = sprite2
			ghostSprite = ghost0
		if animCounter == 3:
			animSprite = sprite0
			ghostSprite = ghost1			
		elif animCounter == 4:
			animSprite = sprite1
			ghostSprite = ghost0
		elif animCounter == 5:
			animSprite = sprite2
			ghostSprite = ghost1			

		animCounter += 1
		if animCounter==6:
			animCounter=0
			
		frames.append (
			render.Stack(
				children=[ 
					render.Box(render.Box(color=bgColor)),
					
					render.Padding( #clock
						pad=(17,12,0,0),
						child=render.Column(
							children=[
								render.Text(
									content = now.format("3:04 PM"),
	                    		),				
							],
						),
					),

					render.Padding( #mask
						pad=(i-63,11,0,0),
						child=render.Column(
							children=[
								render.Box(width=65, height=10, color=bgColor),
							],
						),
					),
										
					render.Padding( #pacman
						pad=(i,9,0,0),
						child=render.Column(
							children=animSprite,
						),
					),

					render.Padding( #ghost
						pad=(i-20,9,0,0),
						child=render.Column(
							children=ghostSprite,
						),
					),
				]
			)
		)

	print(str(len(frames)) + " frames")

	return render.Root(
		delay = 5,
		child = render.Animation(
			children=frames,
		)
	)   

def makeSprite(sprite,size):
	###turn sprite pixel colors into a widget pile
	spriterow=[]
	for i in range(len(sprite)): #change sprite pixels to Box widgets, per horiz line
		skipPixels=0
		spriterow.append([])
		for j in range(len(sprite[i])):
			if (sprite[i][j] != "#XXX"):
				spriterow[i].append (
					render.Padding(
						pad=(skipPixels,0,0,0),
						child=render.Box(
								color=sprite[i][j],
								width=size, 
								height=size,
						),
					),
				)
				skipPixels=0
			else: #See-thru pixel #XXX
				skipPixels+=1
				if skipPixels == len(sprite[i]): #if this was a whole row of see-thru pixels, force skip a line
					spriterow[i].append (
						render.Box( #invisible box (no color)
							width=1, 
							height=1, 
						),
					)

	spritecol=[]
	for i in range(len(spriterow)): #combine lines of Box widgets (the lines of the sprite) into columns of Row widgets
		spritecol.append(
			render.Row(
				children=spriterow[i],
			),
		)
	
	###that's it: we have our sprite in a widget pile in spritecol
	return spritecol
