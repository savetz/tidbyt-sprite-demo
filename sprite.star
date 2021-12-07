#create and move a sprite on Tidbyt
#by Kay Savetz, Dec 7 2021

load("render.star", "render")

def main():

	#here's the sprite itself
	#right side padding is only necessary if you'll be flipping the sprite horizontally
	# #XXX is a "see through" pixel
	#ship based on https://opengameart.org/content/1616-ship-collection
	sprite=[]
	sprite.append(["#05A","#05A","#05A","#05A","#05A","#05A","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#05A","#0AA","#0AA","#0AA","#0AA","#05A","#0B6","#0B6","#0B6","#0B6","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#05A","#0C0","#0C0","#0C0","#0C0","#05A","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#05A","#0C0","#0C0","#0C0","#0C0","#05A","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#05A","#0AA","#0AA","#0AA","#0AA","#0AA","#05A","#05A","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#05A","#0AA","#0AA","#029","#029","#0B6","#0B6","#0B6","#05A","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#05A","#0AA","#XXX","#029","#029","#0B6","#0B6","#0B6","#05A"])
	sprite.append(["#XXX","#XXX","#XXX","#XXX","#05A","#0AA","#XXX","#XXX","#029","#0B6","#0B6","#0B6","#05A"])
	sprite.append(["#XXX","#XXX","#XXX","#05A","#0AA","#0AA","#XXX","#XXX","#0B6","#0B6","#0B6","#05A","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#05A","#0AA","#0AA","#0AA","#0AA","#0AA","#05A","#05A","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#XXX","#05A","#0C0","#0C0","#0C0","#0C0","#05A","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#XXX","#05A","#0C0","#0C0","#0C0","#0C0","#05A","#XXX","#XXX","#XXX","#XXX","#XXX"])
	sprite.append(["#XXX","#05A","#0AA","#0AA","#0AA","#0AA","#05A","#0B6","#0B6","#0B6","#0B6","#XXX","#XXX"])
	sprite.append(["#05A","#05A","#05A","#05A","#05A","#05A","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX","#XXX"])

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
								width=1,  #change this to 2 to double the width of the sprite
								height=1, #change this to 2 to double the height of the sprite
						),
					),
				)
				skipPixels=0
			else: #See-thru pixel #XXX
				skipPixels+=1

	spritecol=[]
	for i in range(len(spriterow)): #combine lines of Box widgets (the lines of the sprite) into columns of Row widgets
		spritecol.append(
			render.Row(
				children=spriterow[i],
			),
		)
	
	###that's it: we have our sprite in a widget pile in spritecol
	spriteR = spritecol
	

	###let's make a version with the sprite horizontally flipped
	spriterow=[]
	for i in range(len(sprite)):
		skipPixels=0
		spriterow.append([])
		for j in range(len(sprite[i])-1,-1,-1):	#this range flips the sprite horizontally
			if (sprite[i][j] != "#XXX"):
				spriterow[i].append (
					render.Padding(
						pad=(skipPixels,0,0,0),
						child=render.Box(
								color=sprite[i][j],
								width=1,
								height=1,
						),
					),
				)
				skipPixels=0
			else: #See-thru pixel #XXX
				skipPixels+=1

	spritecol=[]
	for i in range(len(spriterow)):
		spritecol.append(
			render.Row(
				children=spriterow[i],
			),
		)
	###that's it: we have our sprite in a widget pile in spritecol
	spriteL = spritecol

	
	###create frames to animate the sprite
	frames=[]
	
	for i in range(-13,64): #left to right. you can use padding to start offscreen
		frames.append (
			render.Stack(
				children=[ 
					render.Box(render.Box(color="#300")), #dark red background
					render.Padding(
						pad=(17,1,0,0), #center the circle
						child=render.Circle(
							color="#666",
							diameter=30,
							child=render.Circle(color="#c00", diameter=10),
						),
					),
					render.Padding( #place the sprite
						pad=(i,5,0,0),
						child=render.Column(
							children=spriteR,
						),
					),
				]
			)
		)

	for i in range(64,-13,-1): #move right to left
		frames.append (
			render.Stack(
				children=[ 
					render.Box(render.Box(color="#300")),
					render.Padding(
						pad=(17,1,0,0),
						child=render.Circle(
							color="#666",
							diameter=30,
							child=render.Circle(color="#c00", diameter=10),
						),
					),
					render.Padding(
						pad=(i,11,0,0),
						child=render.Column(
							children=spriteL,
						),
					),
				]
			)
		)

	print(str(len(frames)) + " frames")

	return render.Root(
		delay = 0,
		child = render.Animation(
			children=frames,
		)
	)   
