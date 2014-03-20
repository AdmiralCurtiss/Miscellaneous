# first bunch of functions by Phiggle

#1. the counter() function
#This function adds the clock to the middle.
#All the user specifies in the counter line in the script proper
#is the frame when the timer pops in.
#Optional: within this function, adjust x= and y= in the last line if you want the timer to be elsewhere
#Optional: within this function, adjust anything else in the subtitle line to change font, size, etc.
function counter(clip clip, int n)
{
  n = n / clip.framerate()
  day = int(n / 86400)
  days = string(day)
  days = strlen(days) < 2 ? "0" + days : days
  n = n - day * 86400
  hour = int(n / 3600)
  hours = string(hour)
  hours = strlen(hours) < 2 ? "0" + hours : hours
  n = n - hour * 3600
  min = int(n / 60)
  mins = string(min)
  mins = strlen(mins) < 2 ? "0" + mins : mins
  n = n - min * 60
  sec = int(n)
  secs = string(sec)
  secs = strlen(secs) < 2 ? "0" + secs : secs
  ms = string(int(1000 * (n - sec)))
  ms = strlen(ms) < 2 ? "0" + ms : ms
  ms = strlen(ms) < 3 ? "0" + ms : ms
    clip.subtitle(hours + ":" + mins + ":" + secs, align=7, x=(clip.width/2)-88, y=(clip.height/2)-13,  font="Megaman 2", size=24, text_color=$ffffff, first_frame=1)
  #clip.subtitle(hours + ":" + mins + ":" + secs, align=7, x=(clip.width/2)-80, y=(clip.height/2)-21,  font="Upheaval TT (BRK)", size=32, text_color=$ffffff, first_frame=1)
}
function counter(clip clip, int n, int x, int y)
{
  n = n / clip.framerate()
  day = int(n / 86400)
  days = string(day)
  days = strlen(days) < 2 ? "0" + days : days
  n = n - day * 86400
  hour = int(n / 3600)
  hours = string(hour)
  hours = strlen(hours) < 2 ? "0" + hours : hours
  n = n - hour * 3600
  min = int(n / 60)
  mins = string(min)
  mins = strlen(mins) < 2 ? "0" + mins : mins
  n = n - min * 60
  sec = int(n)
  secs = string(sec)
  secs = strlen(secs) < 2 ? "0" + secs : secs
  ms = string(int(1000 * (n - sec)))
  ms = strlen(ms) < 2 ? "0" + ms : ms
  ms = strlen(ms) < 3 ? "0" + ms : ms
  #  clip.subtitle(hours + ":" + mins + ":" + secs, align=7, x=(clip.width/2)-88, y=(clip.height/2)-13,  font="Megaman 2", size=24, text_color=$ffffff, first_frame=1)
  clip.subtitle(hours + ":" + mins + ":" + secs, align=7, x=x, y=y,  font="Megaman 2", size=32, text_color=$ffffff, first_frame=1)
}
function counterFortress(clip clip, int n)
{
  n = n / clip.framerate()
  day = int(n / 86400)
  days = string(day)
  days = strlen(days) < 2 ? "0" + days : days
  n = n - day * 86400
  hour = int(n / 3600)
  hours = string(hour)
  hours = strlen(hours) < 2 ? "0" + hours : hours
  n = n - hour * 3600
  min = int(n / 60)
  mins = string(min)
  mins = strlen(mins) < 2 ? "0" + mins : mins
  n = n - min * 60
  sec = int(n)
  secs = string(sec)
  secs = strlen(secs) < 2 ? "0" + secs : secs
  ms = string(int(1000 * (n - sec)))
  ms = strlen(ms) < 2 ? "0" + ms : ms
  ms = strlen(ms) < 3 ? "0" + ms : ms
  clip.subtitle(hours + ":" + mins + ":" + secs, align=7, x=30, y=0, lsp=1, font="Megaman 2", size=40, text_color=$ffffff, first_frame=1)
}

#2. the robotmasters() function
#This function adds the boss pictures and the Xs over them when they're killed.
#All the user specifies is the frame when the boss is killed.
#open their video up in virtualdub, find that frame, punch it in.
function robotmasters(int "blizzardout", int "windout", int "flameout", int "plantout", int "tomahawkout",\
int "yamatoout", int "knightout", int "centaurout")
{
blizzard=ImageSource(mugshotpath + "blizzard.png", pixel_type="RGB32", fps=30).AddBorders(6,6,6,6).Loop(-1)
blizzard=blizzard.Subtitle("/", align=2, font="Megaman 2", size=48, text_color=$ff0000, halo_color=$ff000000,  first_frame=blizzardout)
blizzard=blizzard.Subtitle("\", align=2, font="Megaman 2", size=48, text_color=$ff0000, halo_color=$ff000000,  first_frame=blizzardout)
wind=ImageSource(mugshotpath + "wind.png", pixel_type="RGB32", fps=30).AddBorders(6,6,6,6).Loop(-1)
wind=wind.Subtitle("/", align=2, font="Megaman 2", size=48, text_color=$ff0000, halo_color=$ff000000,  first_frame=windout)
wind=wind.Subtitle("\", align=2, font="Megaman 2", size=48, text_color=$ff0000, halo_color=$ff000000,  first_frame=windout)
flame=ImageSource(mugshotpath + "flame.png", pixel_type="RGB32", fps=30).AddBorders(6,6,6,6).Loop(-1)
flame=flame.Subtitle("/", align=2, font="Megaman 2", size=48, text_color=$ff0000, halo_color=$ff000000,  first_frame=flameout)
flame=flame.Subtitle("\", align=2, font="Megaman 2", size=48, text_color=$ff0000, halo_color=$ff000000,  first_frame=flameout)
plant=ImageSource(mugshotpath + "plant.png", pixel_type="RGB32", fps=30).AddBorders(6,6,6,6).Loop(-1)
plant=plant.Subtitle("/", align=2, font="Megaman 2", size=48, text_color=$ff0000, halo_color=$ff000000,  first_frame=plantout)
plant=plant.Subtitle("\", align=2, font="Megaman 2", size=48, text_color=$ff0000, halo_color=$ff000000,  first_frame=plantout)
tomahawk=ImageSource(mugshotpath + "tomahawk.png", pixel_type="RGB32", fps=30).AddBorders(6,6,6,6).Loop(-1)
tomahawk=tomahawk.Subtitle("/", align=2, font="Megaman 2", size=48, text_color=$ff0000, halo_color=$ff000000,  first_frame=tomahawkout)
tomahawk=tomahawk.Subtitle("\", align=2, font="Megaman 2", size=48, text_color=$ff0000, halo_color=$ff000000,  first_frame=tomahawkout)
yamato=ImageSource(mugshotpath + "yamato.png", pixel_type="RGB32", fps=30).AddBorders(6,6,6,6).Loop(-1)
yamato=yamato.Subtitle("/", align=2, font="Megaman 2", size=48, text_color=$ff0000, halo_color=$ff000000,  first_frame=yamatoout)
yamato=yamato.Subtitle("\", align=2, font="Megaman 2", size=48, text_color=$ff0000, halo_color=$ff000000,  first_frame=yamatoout)
knight=ImageSource(mugshotpath + "knight.png", pixel_type="RGB32", fps=30).AddBorders(6,6,6,6).Loop(-1)
knight=knight.Subtitle("/", align=2, font="Megaman 2", size=48, text_color=$ff0000, halo_color=$ff000000,  first_frame=knightout)
knight=knight.Subtitle("\", align=2, font="Megaman 2", size=48, text_color=$ff0000, halo_color=$ff000000,  first_frame=knightout)
centaur=ImageSource(mugshotpath + "centaur.png", pixel_type="RGB32", fps=30).AddBorders(6,6,6,6).Loop(-1)
centaur=centaur.Subtitle("/", align=2, font="Megaman 2", size=48, text_color=$ff0000, halo_color=$ff000000,  first_frame=centaurout)
centaur=centaur.Subtitle("\", align=2, font="Megaman 2", size=48, text_color=$ff0000, halo_color=$ff000000,  first_frame=centaurout)
robotmasters=StackVertical(blizzard, wind, flame, plant, tomahawk, yamato, knight, centaur)
robotmasters
}

#3. the letters() function
#This function adds the letters for beat, and if beat is collected,
#it makes the YOU GOT BEAT animation where he gobbles up the letters.
#The user specifies is the frame when the letter is collected.
function letters(int "b", int "e", int "a", int "t")
{ 
beat = ImageSource(mugshotpath + "beat.png", pixel_type="RGB32", fps=30).PointResize(32,32).AddBorders(6,6,6,6).Loop(-1)
beatB = ImageSource(mugshotpath + "beat-b.png", pixel_type="RGB32", fps=30).PointResize(32,32).AddBorders(6,6,6,6).Loop(-1)
beatE = ImageSource(mugshotpath + "beat-e.png", pixel_type="RGB32", fps=30).PointResize(32,32).AddBorders(6,6,6,6).Loop(-1)
beatA = ImageSource(mugshotpath + "beat-a.png", pixel_type="RGB32", fps=30).PointResize(32,32).AddBorders(6,6,6,6).Loop(-1)
beatT = ImageSource(mugshotpath + "beat-t.png", pixel_type="RGB32", fps=30).PointResize(32,32).AddBorders(6,6,6,6).Loop(-1)

all = b > e ? b : e
all = a > all ? a : all
all = t > all ? t : all

gravityletter=beatB
letterblank=BlankClip(gravityletter).Loop(-1)
gravityletter=letterblank.Trim(0,-b)+gravityletter.Trim(b,all)+\
(gravityletter.Trim(0,-20)+letterblank.Trim(0,-10)).Loop(5)+\
beat.Trim(0,-10)+\
letterblank

waveletter=beatE
waveletter=letterblank.Trim(0,-e)+waveletter.Trim(e,all)+\
(waveletter.Trim(0,-20)+letterblank.Trim(0,-10)).Loop(5)+\
waveletter.Trim(all+120,-10)+\
beat.Trim(0,-10)+\
letterblank

stoneletter=beatA
stoneletter=letterblank.Trim(0,-a)+stoneletter.Trim(a,all)+\
(stoneletter.Trim(0,-20)+letterblank.Trim(0,-10)).Loop(5)+\
stoneletter.Trim(all+120,-20)+\
beat.Trim(0,-10)+\
letterblank

gyroletter=beatT
gyroletter=letterblank.Trim(0,-t)+gyroletter.Trim(t,all)+\
(gyroletter.Trim(0,-20)+letterblank.Trim(0,-10)).Loop(5)+\
gyroletter.Trim(all+120,-30)+\
beat.Trim(0,-10)+\
letterblank

lettersblock=StackVertical(Gravityletter,Waveletter,Stoneletter,Gyroletter)
lettersblock=StackVertical(Blankclip(lettersblock), lettersblock)

lettersblock
}

#These are images common to every script for the status block (lives, game overs, etc.).
#they're not functions, they just name the images and add black to the right
#for the counter numbers to appear in.

/*
oneup=ImageSource("1up.png", pixel_type="RGB32", fps=30).PointResize(32,32).AddBorders(0,0,56,0).Loop(-1)
etank=ImageSource("etank.png", pixel_type="RGB32", fps=30).PointResize(32,32).AddBorders(0,0,56,0).Loop(-1)
mtank=ImageSource("mtank.png", pixel_type="RGB32", fps=30).PointResize(32,32).AddBorders(0,0,56,0).Loop(-1)
skull=ImageSource("skull.png", pixel_type="RGB32", fps=30).PointResize(32,32).AddBorders(0,0,56,0).Loop(-1)
multiskull=ImageSource("skull.png", pixel_type="RGB32", fps=30)
multiskull=stackvertical(stackhorizontal(multiskull,multiskull),multiskull.AddBorders(8,0,8,0))
multiskull=multiskull.AddBorders(0,0,56,0).Loop(-1)
beat=ImageSource("beat.png", pixel_type="RGB32", fps=30).PointResize(32,32).AddBorders(0,0,56,0).Loop(-1)
*/

#4. The AddStatusNumber() function
#This changes the various numbers for death counters.
########################
#I really recommend not bothering with this - it is incredibly work-intensive for little benefit.
########################
#It calls 'clip' - which could be oneup, skull, etc. from above,
#Then replaces the number next to that icon with the number you specify at frame 'start'.
#Example for someone whose number of lives changes to 1 life left at frame 44000:
#topleftoneups=topleftoneup.AddStatusNumber("01",44000)
/*
function AddStatusNumber(clip clip, string number, int start)
{
clip=clip.Trim(0,-start)+\
clip.Trim(start,0).Crop(0,0,32,32).AddBorders(0,0,56,0).Subtitle(number,font="megaman 2",align=1,size=16,text_color=$ffffff,x=50,y=25)
clip
}
*/

#PROGRESS MAP FUNCTIONS

#2. The mrxprogress() function
#Usage: 
#topside=mrxprogress(topside,bottomrighticon,   40,40,   3882,8708,14754,18508,20132)

#The first parameter should always be topside. (The icon is going around the TOP map.)
#The second parameter is the racer's icon.
#Next: WHAT DO ALL THESE NUMBERS MEAN?!
#The first two numbers set the icon's position relative to other icons and the "dots" that represent stages.
#They are x and y coordinates, of sorts.
#For the top left racer, these numbers will be around 0.
#For the "right" racers (top right and bottom right squares), set the first number to about 40.
#For the "bottom" racers (bottom left and bottom right squares), set the second number to about 40.
#Increase and decrease as needed until it looks pleasing to the eye.
#The next 5 numbers are frame numbers:
#Death of the first Mr. X boss,
#Death of the second Mr. X boss,
#Death of the third Mr. X boss,
#Death of the fourth Mr. X boss,
#Disappearance of the Wily ship (the icon will zip off to the right starting on this frame).


function mrxprogress(clip base, clip icon, int right, int down, int "mrx1down", int "mrx2down", int "mrx3down", int "mrx4down", int "wilyship")
{
base=ApplyRange(base,0,mrx1down,"Overlay",icon,-1+right,247+down,icon.ShowAlpha("rgb32")).Trim(0,-mrx1down)+\
Animate(base, mrx1down, mrx1down+60, "Overlay",\
icon, -1+right, 247+down, icon.ShowAlpha("yuy2"), 1, "blend", \
icon, 70+right, 217+down, icon.ShowAlpha("yuy2"), 1, "blend").Trim(mrx1down,mrx2down-1)+\
Animate(base, mrx2down, mrx2down+60, "Overlay",\
icon, 70+right, 217+down, icon.ShowAlpha("yuy2"), 1, "blend", \
icon, 150+right, 207+down, icon.ShowAlpha("yuy2"), 1, "blend").Trim(mrx2down,mrx3down-1)+\
Animate(base, mrx3down, mrx3down+60, "Overlay",\
icon, 150+right, 207+down, icon.ShowAlpha("yuy2"), 1, "blend", \
icon, 220+right, 177+down, icon.ShowAlpha("yuy2"), 1, "blend").Trim(mrx3down,mrx4down-1)+\
Animate(base, mrx4down, mrx4down+60, "Overlay",\
icon, 220+right, 177+down, icon.ShowAlpha("yuy2"), 1, "blend", \
icon, 260+right, 117+down, icon.ShowAlpha("yuy2"), 1, "blend").Trim(mrx4down,wilyship-1)+\
Animate(base, wilyship, wilyship+60, "Overlay",\
icon, 260+right, 117+down, icon.ShowAlpha("yuy2"), 1, "blend", \
icon, 260+1000+right, 117+down, icon.ShowAlpha("yuy2"), 1, "blend").Trim(wilyship,-0)
base
}



#2. The wilyprogress() function
#Usage: 
#bottomside=wilyprogress(bottomside,bottomrighticon,   40,40,   3882,8708,14754,18508,20132,     0,0)

#The first parameter should always be bottomside. (The icon is going around the BOTTOM map.)
#The second parameter is the racer's icon.
#Next: WHAT DO ALL THESE NUMBERS MEAN?!
#The first two numbers set the icon's position relative to other icons and the "dots" that represent stages.
#They are x and y coordinates, of sorts.
#For the top left racer, these numbers will be around 0.
#For the "right" racers (top right and bottom right squares), set the first number to about 40.
#For the "bottom" racers (bottom left and bottom right squares), set the second number to about 40.
#Increase and decrease as needed until it looks pleasing to the eye.
#The next 5 numbers are frame numbers:
#Disappearance of the Wily ship (the icon will start zipping up into place starting a bit after this frame),
#Death of the first Wily boss,
#Death of the second Wily boss,
#Death of the third Wily boss,
#Death of final Wily (this will move the icon to the last dot and make it hop).
#The last two numbers are just "fudge factors" in case the icon doesn't look like it's hopping in the right spot.
#They should almost always be 0, but make them negative or positive to re-spot the icon's hopping.

function wilyprogress(clip base, clip icon, int right, int down, int ff_x, int ff_y, int "wilyship", int "wily1down", int "wily2down", int "wily3down", int "wily4down")
{
ffx=ff_x - 2
ffy=ff_y + 34
base=\
Animate(base, wilyship+160, wilyship+210, "Overlay",\
icon, 20+right, 227+1000+down, icon.ShowAlpha("yuy2"), 1, "blend", \
icon, 20+right, 227+down, icon.ShowAlpha("yuy2"), 1, "blend").Trim(0,wily1down-1)+\
Animate(base, wily1down, wily1down+60, "Overlay",\
icon, 20+right, 227+down, icon.ShowAlpha("yuy2"), 1, "blend", \
icon, 60+right, 317+down, icon.ShowAlpha("yuy2"), 1, "blend").Trim(wily1down,wily2down-1)+\
Animate(base, wily2down, wily2down+60, "Overlay",\
icon, 60+right, 317+down, icon.ShowAlpha("yuy2"), 1, "blend", \
icon, 130+right, 267+down, icon.ShowAlpha("yuy2"), 1, "blend").Trim(wily2down,wily3down-1)+\
Animate(base, wily3down, wily3down+60, "Overlay",\
icon, 130+right, 267+down, icon.ShowAlpha("yuy2"), 1, "blend", \
icon, 190+right, 257+down, icon.ShowAlpha("yuy2"), 1, "blend").Trim(wily3down,wily4down-1)+\
Animate(base, wily4down, wily4down+29, "Overlay",\
icon, 190+right, 257+down, icon.ShowAlpha("yuy2"), 1, "blend", \
icon, 270+ffx, 250+ffy, icon.ShowAlpha("yuy2"), 1, "blend").Trim(wily4down,wily4down+29)+\
Animate(base, wily4down+30, wily4down+34, "Overlay",\
icon, 270+ffx, 250+ffy, icon.ShowAlpha("yuy2"), 1, "blend", \
icon, 270+ffx, 250-10+ffy, icon.ShowAlpha("yuy2"), 1, "blend").Trim(wily4down+30,-5)+\
Animate(base, wily4down+35, wily4down+39, "Overlay",\
icon, 270+ffx, 250-10+ffy, icon.ShowAlpha("yuy2"), 1, "blend", \
icon, 270+ffx, 250+ffy, icon.ShowAlpha("yuy2"), 1, "blend").Trim(wily4down+35,-5)+\
Animate(base, wily4down+40, wily4down+44, "Overlay",\
icon, 270+ffx, 250+ffy, icon.ShowAlpha("yuy2"), 1, "blend", \
icon, 270+ffx, 250-10+ffy, icon.ShowAlpha("yuy2"), 1, "blend").Trim(wily4down+40,-5)+\
Animate(base, wily4down+45, wily4down+49, "Overlay",\
icon, 270+ffx, 250-10+ffy, icon.ShowAlpha("yuy2"), 1, "blend", \
icon, 270+ffx, 250+ffy, icon.ShowAlpha("yuy2"), 1, "blend").Trim(wily4down+45,-5)+\
Animate(base, wily4down+50, wily4down+54, "Overlay",\
icon, 270+ffx, 250+ffy, icon.ShowAlpha("yuy2"), 1, "blend", \
icon, 270+ffx, 250-10+ffy, icon.ShowAlpha("yuy2"), 1, "blend").Trim(wily4down+50,-5)+\
Animate(base, wily4down+55, wily4down+59, "Overlay",\
icon, 270+ffx, 250-10+ffy, icon.ShowAlpha("yuy2"), 1, "blend", \
icon, 270+ffx, 250+ffy, icon.ShowAlpha("yuy2"), 1, "blend").Trim(wily4down+55,-5)+\
Animate(base, wily4down+60, wily4down+99, "Overlay",\
icon, 270+ffx, 250+ffy, icon.ShowAlpha("yuy2"), 1, "blend", \
icon, 270+ffx, 250+ffy, icon.ShowAlpha("yuy2"), 1, "blend").Trim(wily4down+60,-40)+\
Animate(base, wily4down+100, wily4down+160, "Overlay",\
icon, 270+ffx, 250+ffy, icon.ShowAlpha("yuy2"), 1, "blend", \
icon, 270+ffx+500, 250+ffy, icon.ShowAlpha("yuy2"), 1, "blend").Trim(wily4down+100,0)
base
}

#4. The AddDeath function

#You may want to keep up the tradition of icons flashing when a player dies.
#If you are crazy enough to do this, the usage is really simple:
#toplefticon=toplefticon.AddDeath(10000)
#where 10000 is whatever frame the guy died on.

function AddDeath(clip icon, int deathframe)
{
icon=icon.Trim(0,-deathframe)+\
icon.Trim(deathframe,-5).INVERT("RGB")+\
icon.Trim(deathframe+5,-5)+\
icon.Trim(deathframe+10,-5).INVERT("RGB")+\
icon.Trim(deathframe+15,-5)+\
icon.Trim(deathframe+20,-5).INVERT("RGB")+\
icon.Trim(deathframe+25,-5)+\
icon.Trim(deathframe+30,-5).INVERT("RGB")+\
icon.Trim(deathframe+35,-5)+\
icon.Trim(deathframe+40,-5).INVERT("RGB")+\
icon.Trim(deathframe+45,-5)+\
icon.Trim(deathframe+50,-5).INVERT("RGB")+\
icon.Trim(deathframe+55,-5)+\
icon.Trim(deathframe+60,0)
icon
}



#5. The soundtrackID() function
#This makes a black box containing a subtitle fade in and out at a specific spot on the screen.
#I use this for popping in soundtrack info.
#You specify the frame you want the subtitle to start fading in
#and how many seconds you want the sub to be on screen.
#it also specifies a width of the box to put the subtitle in so you don't cover anything up with song info.
#Usage: video=video.soundtrackID("The Song's Title - The Song's Artist", 100000, 20, 760)
#Example: 
#video=video.soundtrackID(\
#"The Song's Title - Artist",
#30*60*30 + 15*30, 20, 760)
#This makes that subtitle appear at 30:15 (because you can do math to specify a frame).
function soundtrackID(clip clip, string description, int trackstart, int screentime, int bgwidth, int "fontsize")
{
 round2progress = true
 #bgwidth = round2progress ? 360 : bgwidth
 bgheight = round2progress ? 70 : 32
 description = round2progress ? description : StrReplace(description, "\n", " - ")
 soundtrackfontsize = Defined(fontsize) ? fontsize : round2progress ? 16 : 24
 background=BlankClip(clip).PointResize(bgwidth, bgheight).Loop(-1)
 background=background.Subtitle(description,first_frame=trackstart,last_frame=trackstart+screentime*30,font="times square",size=soundtrackfontsize, text_color=$ffffff, halo_color=$ff000000, align=8, lsp=24).Trim(trackstart,trackstart+screentime*30).FadeIO(60)
 clip1 = clip.Trim(0,-trackstart)
 
 
 
 clip2 = clip.Trim(trackstart,trackstart+screentime*30-1)#.Overlay(background, x=(clip.width()-bgwidth), y=(clip.height()-bgheight))
 c2t = clip2.Crop(0, 0, 0, -bgheight)
 c2b = clip2.Crop(0, clip2.height-bgheight, 0, 0)
 c2l = c2b.Crop(0, 0, -bgwidth, 0)
 c2r = c2b.Crop(c2b.width-bgwidth, 0, 0, 0)
 clip2 = StackVertical(c2t, StackHorizontal(c2l, background))
 
 
 
 clip3 = clip.Trim(trackstart+screentime*30,0)
 c = clip1 + clip2 + clip3
 c = c.AudioDub(clip)
 return c
}

function soundtrackBL(clip clip, string description, int trackstart, int screentime, int bgwidth, int "fontsize")
{
 round2progress = true
 #bgwidth = round2progress ? 360 : bgwidth
 bgheight = round2progress ? 80 : 32
 description = round2progress ? description : StrReplace(description, "\n", " - ")
 soundtrackfontsize = Defined(fontsize) ? fontsize : round2progress ? 16 : 24
 background=BlankClip(clip).PointResize(bgwidth, bgheight).Loop(-1)
 background=background.Subtitle(description,first_frame=trackstart,last_frame=trackstart+screentime*30,font="times square",size=soundtrackfontsize, text_color=$ffffff, halo_color=$ff000000, align=8, lsp=24).Trim(trackstart,trackstart+screentime*30)
 
 
 clip1 = clip.Trim(0,-trackstart)
 c1t = clip1.Crop(0, 0, 0, -bgheight)
 c1b = clip1.Crop(0, clip1.height-bgheight, 0, 0)
 c1l = c1b.Crop(0, 0, bgwidth, 0)
 c1r = c1b.Crop(bgwidth, 0, 0, 0)
 clip1 = StackVertical(c1t, StackHorizontal(c1l.FadeOut(60), c1r))
 
 clip2 = clip.Trim(trackstart,0)#.Overlay(background, x=(clip.width()-bgwidth), y=(clip.height()-bgheight))
 c2t = clip2.Crop(0, 0, 0, -bgheight)
 c2b = clip2.Crop(0, clip2.height-bgheight, 0, 0)
 c2l = c2b.Crop(0, 0, bgwidth, 0)
 c2r = c2b.Crop(bgwidth, 0, 0, 0)
 clip2 = StackVertical(c2t, StackHorizontal(background.FadeIn(60), c2r))
 
 
 
 #clip3 = clip.Trim(trackstart+screentime*30,0)
 c = clip1 + clip2 #+ clip3
 c = c.AudioDub(clip)
 return c
}

function soundtrackIDTR(clip clip, string description, int trackstart, int screentime, int bgwidth, int "fontsize")
{
 round2progress = true
 #bgwidth = round2progress ? 360 : bgwidth
 bgheight = round2progress ? 80 : 32
 description = round2progress ? description : StrReplace(description, "\n", " - ")
 soundtrackfontsize = Defined(fontsize) ? fontsize : round2progress ? 16 : 24
 background=BlankClip(clip).PointResize(bgwidth, bgheight).Loop(-1)
 background=background.Subtitle(description,first_frame=trackstart,last_frame=trackstart+screentime*30,font="times square",size=soundtrackfontsize, text_color=$ffffff, halo_color=$ff000000, align=8, lsp=24).Trim(trackstart,trackstart+screentime*30).FadeIO(60)
 clip1 = clip.Trim(0,-trackstart)
 clip2 = round2progress ? Overlay(clip.Trim(trackstart,trackstart+screentime*30-1),background, x=(clip.width()-bgwidth), y=8) : Overlay(clip.Trim(trackstart,trackstart+screentime*30-1),background, x=(clip.width()-bgwidth)/2, y=8)
 clip3 = clip.Trim(trackstart+screentime*30,0)
 c = clip1 + clip2 + clip3
 c = c.AudioDub(clip)
 return c
}

function soundtrackLeft(clip clip, string description, int trackstart, int screentime, int bgwidth, int "fontsize")
{
 round2progress = true
 #bgwidth = round2progress ? 360 : bgwidth
 bgheight = round2progress ? 60 : 32
 description = round2progress ? description : StrReplace(description, "\n", " - ")
 soundtrackfontsize = Defined(fontsize) ? fontsize : round2progress ? 16 : 24
 background = clip.Crop(0, 0, 80, 0)
 c = clip.Crop(80, 0, 0, 0)
 background = background.TurnRight()
 backgroundSub = background.Subtitle(description,first_frame=trackstart,last_frame=trackstart+screentime*30,font="times square",size=soundtrackfontsize, text_color=$ffffff, halo_color=$ff000000, align=5, lsp=24)
 background = background.TRim(0, trackstart-1) + backgroundSub.Trim(trackstart,trackstart+screentime*30).FadeIO(60) + background.Trim(trackstart+screentime*30+1, 0)
 background = background.TurnLeft()
 
 c = StackHorizontal(background, c)
 c = c.AudioDub(clip)
 return c
}

function calculateTime(int hours, int minutes, int seconds, int frames) {
    h = frames / hours
    m = ( frames / minutes ) % 60
    s = ( frames / seconds ) % 60
    
    hstr = h.string
    mstr = m > 9 ? m.string : "0" + m.string
    sstr = s > 9 ? s.string : "0" + s.string
    
    returnstring = h > 0 ? hstr + ":" + mstr + ":" + sstr : mstr + ":" + sstr
    return returnstring
}

function simpleheader( string name, int color, string fintime, int finframe, int w, int h, bool "rev", string "icon" ) {
    rev = Default(rev, false)
    icon = Default(icon, "")
    icongfx = icon != "" ? ImageSource(icon, pixel_type="RGB32", fps=30).ConvertToRGB32 : false
 
 
    lxp = w/4
    c = BlankClip(length=1999999, width=w, height=h+2, fps=30, pixel_type="RGB32")
    c = icon != "" ? Layer(c, icongfx, op="add", level=256, x=lxp-(icongfx.width/2), y=0) : c
    c = icon != "" ? Layer(c, icongfx, op="add", level=256, x=(c.width-lxp)-(icongfx.width/2), y=0) : c
    
    c = c.Subtitle(name, x=w/2, y= rev ? 16 : 1, first_frame=0, last_frame=finframe-1, font="MegaMan 2", size=12, text_color=$FFFFFF, halo_color=$000000, align=8, spc=0, lsp=0)
    c = c.Subtitle(name, x=w/2, y= rev ? 16 : 1, first_frame=finframe, last_frame=c.framecount-1, font="MegaMan 2", size=12, text_color=color, halo_color=$000000, align=8, spc=0, lsp=0)
    c = c.Subtitle(fintime, x=w/2, y=rev ? 1 : 14, first_frame=finframe, last_frame=c.framecount-1, font="MegaMan 2", size=14, text_color=color, halo_color=$000000, align=8, spc=0, lsp=0)
    c = c.Crop(0, 2, 0, 0)

    return c.ConvertToYV12()
}

function simpleheadersideways( string name, int color, string fintime, int finframe, bool left ) {
    c = BlankClip(length=1999999, width=360, height=30, fps=30)

    c = c.Subtitle(name, x=180, y=0, first_frame=0, last_frame=finframe-1, font="MegaMan 2", size=12, text_color=$FFFFFF, halo_color=$000000, align=8, spc=0, lsp=0)
    c = c.Subtitle(name, x=180, y=0, first_frame=finframe, last_frame=c.framecount-1, font="MegaMan 2", size=12, text_color=color, halo_color=$000000, align=8, spc=0, lsp=0)
    c = c.Subtitle(fintime, x=180, y=13, first_frame=finframe, last_frame=c.framecount-1, font="MegaMan 2", size=14, text_color=color, halo_color=$000000, align=8, spc=0, lsp=0)

    c = left ? c.TurnLeft : c.TurnRight
    
    return c.ConvertToYV12()
}

function vvvvvv( string name, string fintime, int "start", int "space1", int "space2", int "tower", int "inter1", int "lab", int "inter2", int "warp", int "sad", int "outerspace") {
bx = 6
by = 4

warps = ImageSource(mugshotpath + "v/Verdigris saved.png", pixel_type="RGB32", fps=30).Crop(16, 0, 20, 0).AddBorders(bx, by, bx, by).Loop(-1)
warpu = ImageSource(mugshotpath + "v/Verdigris unsaved.png", pixel_type="RGB32", fps=30).Crop(0, 0, 20, 0).AddBorders(bx, by, bx, by).Loop(-1)
towers = ImageSource(mugshotpath + "v/Vermillion saved.png", pixel_type="RGB32", fps=30).Crop(16, 0, 20, 0).AddBorders(bx, by, bx, by).Loop(-1)
toweru = ImageSource(mugshotpath + "v/Vermillion unsaved.png", pixel_type="RGB32", fps=30).Crop(0, 0, 20, 0).AddBorders(bx, by, bx, by).Loop(-1)
labs = ImageSource(mugshotpath + "v/Victoria saved.png", pixel_type="RGB32", fps=30).Crop(16, 0, 20, 0).AddBorders(bx, by, bx, by).Loop(-1)
labu = ImageSource(mugshotpath + "v/Victoria unsaved.png", pixel_type="RGB32", fps=30).Crop(0, 0, 20, 0).AddBorders(bx, by, bx, by).Loop(-1)
space1s = ImageSource(mugshotpath + "v/Violet saved.png", pixel_type="RGB32", fps=30).Crop(16, 0, 20, 0).AddBorders(bx, by, bx, by).Loop(-1)
space1u = ImageSource(mugshotpath + "v/Violet unsaved.png", pixel_type="RGB32", fps=30).Crop(0, 0, 20, 0).AddBorders(bx, by, bx, by).Loop(-1)
selfs = ImageSource(mugshotpath + "v/Viridian saved.png", pixel_type="RGB32", fps=30).Crop(16, 0, 20, 0).AddBorders(bx, by, bx, by).Loop(-1)
selfu = ImageSource(mugshotpath + "v/Viridian unsaved.png", pixel_type="RGB32", fps=30).Crop(0, 0, 20, 0).AddBorders(bx, by, bx, by).Loop(-1)
space2s = ImageSource(mugshotpath + "v/Vitellary saved.png", pixel_type="RGB32", fps=30).Crop(16, 0, 20, 0).AddBorders(bx, by, bx, by).Loop(-1)
space2u = ImageSource(mugshotpath + "v/Vitellary unsaved.png", pixel_type="RGB32", fps=30).Crop(0, 0, 20, 0).AddBorders(bx, by, bx, by).Loop(-1)

vself = selfs.Trim(0, sad-1) ++ selfu.Trim(sad, outerspace-1) ++ selfs.Trim(outerspace, 0)
vspace1 = space1s.Trim(0, start-1) ++ space1u.Trim(start, space1-1) ++ space1s.Trim(space1, 0)
vlab = labs.Trim(0, start-1) ++ labu.Trim(start, lab-1) ++ labs.Trim(lab, 0)
vtower = towers.Trim(0, start-1) ++ toweru.Trim(start, tower-1) ++ towers.Trim(tower, 0)
vspace2 = space2s.Trim(0, start-1) ++ space2u.Trim(start, space2-1) ++ space2s.Trim(space2, 0)
vwarp = warps.Trim(0, start-1) ++ warpu.Trim(start, warp-1) ++ warps.Trim(warp, 0)

crew = StackHorizontal(vself, vspace1, vspace2, vtower, vwarp, vlab)
crew = crew.AddBorders(640-crew.width, 10, 0, 0)

fhue = 155

timeclip = vvvvvvtime(fintime)
crew = crew.Trim(0, outerspace-1) ++ crew.Layer(timeclip, x = 640/2 - timeclip.width/2, y = 40).Trim(outerspace, 0)
nameclip = ImageSource(name, pixel_type="RGB32", fps=30).Loop(-1)
nameclip = nameclip.PointResize(nameclip.width*2, nameclip.height*2)
crew = crew.Layer(nameclip, x = 16, y = 56 - nameclip.height).Trim(0, outerspace-1) ++ crew.Layer(nameclip, x = 16, y = 56 - nameclip.height).Trim(outerspace, 0)

crew = crew.Trim(0, outerspace + 100)

return crew.ConvertToYV12()
}

/*
global v0 = ImageSource("imgs/0.png", pixel_type="RGB32", fps=30)
global v1 = ImageSource("imgs/1.png", pixel_type="RGB32", fps=30)
global v2 = ImageSource("imgs/2.png", pixel_type="RGB32", fps=30)
global v3 = ImageSource("imgs/3.png", pixel_type="RGB32", fps=30)
global v4 = ImageSource("imgs/4.png", pixel_type="RGB32", fps=30)
global v5 = ImageSource("imgs/5.png", pixel_type="RGB32", fps=30)
global v6 = ImageSource("imgs/6.png", pixel_type="RGB32", fps=30)
global v7 = ImageSource("imgs/7.png", pixel_type="RGB32", fps=30)
global v8 = ImageSource("imgs/8.png", pixel_type="RGB32", fps=30)
global v9 = ImageSource("imgs/9.png", pixel_type="RGB32", fps=30)
global vcolon = ImageSource("imgs/colon.png", pixel_type="RGB32", fps=30)
*/

function vvvvvvtime(string fintime) {
len = fintime.strlen()
vvvvvvchar(fintime.substrsingle(1)).Loop(-1)
len >= 2 ? StackHorizontal(last, vvvvvvchar(fintime.substrsingle(2)).Loop(-1)) : last
len >= 3 ? StackHorizontal(last, vvvvvvchar(fintime.substrsingle(3)).Loop(-1)) : last
len >= 4 ? StackHorizontal(last, vvvvvvchar(fintime.substrsingle(4)).Loop(-1)) : last
len >= 5 ? StackHorizontal(last, vvvvvvchar(fintime.substrsingle(5)).Loop(-1)) : last
len >= 6 ? StackHorizontal(last, vvvvvvchar(fintime.substrsingle(6)).Loop(-1)) : last
len >= 7 ? StackHorizontal(last, vvvvvvchar(fintime.substrsingle(7)).Loop(-1)) : last
len >= 8 ? StackHorizontal(last, vvvvvvchar(fintime.substrsingle(8)).Loop(-1)) : last
len >= 9 ? StackHorizontal(last, vvvvvvchar(fintime.substrsingle(9)).Loop(-1)) : last
len >= 10 ? StackHorizontal(last, vvvvvvchar(fintime.substrsingle(10)).Loop(-1)) : last

PointResize(width*2, height*2)
}

function vvvvvvchar(string c) {
    ret = v0
    
    ret = c == "0" ? v0 : ret
    ret = c == "1" ? v1 : ret
    ret = c == "2" ? v2 : ret
    ret = c == "3" ? v3 : ret
    ret = c == "4" ? v4 : ret
    ret = c == "5" ? v5 : ret
    ret = c == "6" ? v6 : ret
    ret = c == "7" ? v7 : ret
    ret = c == "8" ? v8 : ret
    ret = c == "9" ? v9 : ret
    ret = c == ":" ? vcolon : ret
    
    return ret
}

function substrsingle(string str, int loc) {
mid = str.midstr(loc, 1)
return mid
}
function substrfilename(string str, int loc) {
mid = str.midstr(loc, 1)
mid = mid == ":" ? "colon" : mid
return mid
}



function soundtrackIDimg(clip clip, string track, string game, string artist, int trackstart, int screentime)
{
 
 bgwidth = 320
 bgheight = 24
 background=BlankClip(clip).PointResize(bgwidth, bgheight).Loop(-1)
 #background=background.Subtitle(description,first_frame=trackstart,last_frame=trackstart+screentime*30,font="times square",size=soundtrackfontsize, text_color=$ffffff, halo_color=$ff000000, align=8, lsp=24).Trim(trackstart,trackstart+screentime*30).FadeIO(60)
 
 background = background.ConvertToRGB32()
 itr = ImageSource(track, pixel_type="RGB32", fps=30)
 igm = ImageSource(game, pixel_type="RGB32", fps=30)
 iar = ImageSource(artist, pixel_type="RGB32", fps=30)
 background = background.Layer(itr, x=background.width/2 - itr.width/2, y=0)
 background = background.Layer(igm, x=background.width/2 - igm.width/2, y=8)
 background = background.Layer(iar, x=background.width/2 - iar.width/2, y=16)
 background = background.Trim(trackstart, trackstart+screentime*30-1).FadeIO(60)
 background = background.ConvertToYV12()
 
 clip1 = clip.Trim(0,-trackstart)
 clip2 = Overlay(clip.Trim(trackstart,trackstart+screentime*30-1), background, x=(clip.width()-bgwidth), y=(clip.height()-bgheight))
 clip3 = clip.Trim(trackstart+screentime*30,0)
 c = clip1 + clip2 + clip3
 c = c.AudioDub(clip)
 return c
}



function counterImage(clip clip, int n)
{
  n = n / clip.framerate()
  day = int(n / 86400)
  days = string(day)
  days = strlen(days) < 2 ? "0" + days : days
  n = n - day * 86400
  hour = int(n / 3600)
  hours = string(hour)
  #hours = strlen(hours) < 2 ? "0" + hours : hours
  n = n - hour * 3600
  min = int(n / 60)
  mins = string(min)
  mins = strlen(mins) < 2 ? "0" + mins : mins
  n = n - min * 60
  sec = int(n)
  secs = string(sec)
  secs = strlen(secs) < 2 ? "0" + secs : secs
  ms = string(int(1000 * (n - sec)))
  ms = strlen(ms) < 2 ? "0" + ms : ms
  ms = strlen(ms) < 3 ? "0" + ms : ms
  #  clip.subtitle(hours + ":" + mins + ":" + secs, align=7, x=(clip.width/2)-88, y=(clip.height/2)-13,  font="Megaman 2", size=24, text_color=$ffffff, first_frame=1)

  t = vvvvvvtime(hours + ":" + mins + ":" + secs)
  t = t.PointResize(t.width*2, t.height*2)
  clip = clip.Overlay(t.ConvertToYV12(), mask=t.ShowAlpha("RGB32"), x=320-t.width, y=(clip.height/2)+8)
  clip = clip.Overlay(t.ConvertToYV12(), mask=t.ShowAlpha("RGB32"), x=640*3+320+8, y=(clip.height/2)+8)
  #clip = clip.Overlay(t.ConvertToYV12(), mask=t.ShowAlpha("RGB32"), x=(clip.width/2)-t.width/2, y=(clip.height/2)-t.height/2)
  clip
}

function starfox64planet(int start, string name, int end, int score, int color) {
    planet = ImageSource(mugshotpath + "sf64/" + name + ".png", pixel_type="RGB32", fps=30).Loop(-1)
    empty = name == "ve" ? planet : ImageSource(mugshotpath + "sf64/empty.png", pixel_type="RGB32", fps=30).Loop(-1)
    whiteline = BlankClip(color=$FFFFFF).PointResize(32, 4)
    colorline = BlankClip(color=color).PointResize(32, 4)
    planet = planet.AddBorders(32, 0, 0, 12, color=$000000).Overlay(colorline, x=0, y=22)
    empty = empty.AddBorders(32, 0, 0, 12, color=$000000).Overlay(whiteline, x=0, y=22)
    p = empty.Trim(0, start-1) ++ planet.Trim(start, 0)
    p = p.Subtitle(string(score), x=32+24, y=48, first_frame=end, last_frame=p.framecount-1, font="MegaMan 2", size=10, text_color=$FFFF00, halo_color=$000000, align=8, spc=0, lsp=0)
    
    return p
}

function starfox64( string name, bool right, string "path", \
int "p1start", string "p1name", int "p1end", int "p1score", \
int "p2start", string "p2name", int "p2end", int "p2score", \
int "p3start", string "p3name", int "p3end", int "p3score", \
int "p4start", string "p4name", int "p4end", int "p4score", \
int "p5start", string "p5name", int "p5end", int "p5score", \
int "p6start", string "p6name", int "p6end", int "p6score", \
int "p7start", string "p7name", int "p7end", int "p7score" \
) {
pathcol =$FFFFFF
p1 = starfox64planet(p1start, p1name, p1end, p1score, pathcol)
pathcolid = midstr(path, 1, 1)
pathcol = pathcolid == "r" ? $FF0000 : pathcolid == "y" ? $FFCC00 : pathcolid == "b" ? $3271FF : $FFFFFF
p2 = starfox64planet(p2start, p2name, p2end, p2score, pathcol)
pathcolid = midstr(path, 2, 1)
pathcol = pathcolid == "r" ? $FF0000 : pathcolid == "y" ? $FFCC00 : pathcolid == "b" ? $3271FF : $FFFFFF
p3 = starfox64planet(p3start, p3name, p3end, p3score, pathcol)
pathcolid = midstr(path, 3, 1)
pathcol = pathcolid == "r" ? $FF0000 : pathcolid == "y" ? $FFCC00 : pathcolid == "b" ? $3271FF : $FFFFFF
p4 = starfox64planet(p4start, p4name, p4end, p4score, pathcol)
pathcolid = midstr(path, 4, 1)
pathcol = pathcolid == "r" ? $FF0000 : pathcolid == "y" ? $FFCC00 : pathcolid == "b" ? $3271FF : $FFFFFF
p5 = starfox64planet(p5start, p5name, p5end, p5score, pathcol)
pathcolid = midstr(path, 5, 1)
pathcol = pathcolid == "r" ? $FF0000 : pathcolid == "y" ? $FFCC00 : pathcolid == "b" ? $3271FF : $FFFFFF
p6 = starfox64planet(p6start, p6name, p6end, p6score, pathcol)
pathcolid = midstr(path, 6, 1)
pathcol = pathcolid == "r" ? $FF0000 : pathcolid == "y" ? $FFCC00 : pathcolid == "b" ? $3271FF : $FFFFFF
p7 = starfox64planet(p7start, p7name, p7end, p7score, pathcol)

planets = StackHorizontal(p1, p2, p3, p4, p5, p6, p7).Crop(32, 0, 0, 0)

pw = planets.width
planets = planets.AddBorders(640-planets.width, 0, 0, 0, color=$000000)
planets = planets.Subtitle(name, x=55, y=0, first_frame=0, last_frame=p7end-1, font="MegaMan 2", size=12, text_color=$FFFFFF, halo_color=$000000, align=8, spc=0, lsp=0)
planets = planets.Subtitle(name, x=55, y=0, first_frame=p7end, last_frame=planets.framecount-1, font="MegaMan 2", size=12, text_color=$FFFF00, halo_color=$000000, align=8, spc=0, lsp=0)
planets = planets.Subtitle("0", x=55, y=28, first_frame=0, last_frame=p1end-1, font="MegaMan 2", size=24, text_color=$FFFFFF, halo_color=$000000, align=8, spc=0, lsp=0)
planets = planets.Subtitle(string(p1score), x=55, y=28, first_frame=p1end, last_frame=p2end-1, font="MegaMan 2", size=24, text_color=$FFFFFF, halo_color=$000000, align=8, spc=0, lsp=0)
planets = planets.Subtitle(string(p1score+p2score), x=55, y=28, first_frame=p2end, last_frame=p3end-1, font="MegaMan 2", size=24, text_color=$FFFFFF, halo_color=$000000, align=8, spc=0, lsp=0)
planets = planets.Subtitle(string(p1score+p2score+p3score), x=55, y=28, first_frame=p3end, last_frame=p4end-1, font="MegaMan 2", size=24, text_color=$FFFFFF, halo_color=$000000, align=8, spc=0, lsp=0)
planets = planets.Subtitle(string(p1score+p2score+p3score+p4score), x=55, y=28, first_frame=p4end, last_frame=p5end-1, font="MegaMan 2", size=24, text_color=$FFFFFF, halo_color=$000000, align=8, spc=0, lsp=0)
planets = planets.Subtitle(string(p1score+p2score+p3score+p4score+p5score), x=55, y=28, first_frame=p5end, last_frame=p6end-1, font="MegaMan 2", size=24, text_color=$FFFFFF, halo_color=$000000, align=8, spc=0, lsp=0)
planets = planets.Subtitle(string(p1score+p2score+p3score+p4score+p5score+p6score), x=55, y=28, first_frame=p6end, last_frame=p7end-1, font="MegaMan 2", size=24, text_color=$FFFFFF, halo_color=$000000, align=8, spc=0, lsp=0)
planets = planets.Subtitle(string(p1score+p2score+p3score+p4score+p5score+p6score+p7score), x=55, y=28, first_frame=p7end, last_frame=planets.framecount-1, font="MegaMan 2", size=24, text_color=$FFFF00, halo_color=$000000, align=8, spc=0, lsp=0)

planets = right == true ? planets.Crop(640-pw,0,0,0).StackHorizontal(planets.Crop(0,0,640-pw,0)) : planets

return planets.ConvertToYV12()
}




global global_progressicon_icon = blankclip # stores the player icon
global global_progressicon_xoffs = 0 # stores the x offset of the player icon, that is: all x/y variables used later will be offset by this value; this can be used to use the same location values for multiple players without having the icons overlap
global global_progressicon_yoffs = 0 # stores the y offset of the player icon, see above
global global_progressicon_lastx = 0 # stores the current x location of the player icon
global global_progressicon_lasty = 0 # stores the current y location of the player icon
global global_progressicon_lastframe = 0 # stores the frame the player icon was moved last
global global_progressicon_transtime = 0 # stores the default transition framecount from one location to the other
# this initializes the above variables
# icon: the player icon
# x/y: the location the player starts on the map
# xoffs/yoffs: values all other x/y values will be offset by, see the comment on global_progressicon_xoffs above
# transtime: the default transition framecount from one location to the other
function InitProgressIcon(clip icon, int x, int y, int xoffs, int yoffs, int transtime) {
    global global_progressicon_icon = icon
    global global_progressicon_xoffs = xoffs
    global global_progressicon_yoffs = yoffs
    global global_progressicon_lastx = x
    global global_progressicon_lasty = y
    global global_progressicon_lastframe = 0
    global global_progressicon_transtime = transtime
}

# this moves the player icon from one place to the other
# c: the "map" clip the icon should be placed and moved on
# x/y: location the icon should move to
# frame: frame the icon should start moving to the new location
# override_transtime: if you need a custom transition time rather than the default initialized above, put it here
function MoveProgressIcon(clip c, int x, int y, int frame, int "override_transtime") {
    ttime = Default(override_transtime, global_progressicon_transtime)

    # add the static image before the requested move
    layered = global_progressicon_lastframe == 0 ? \
        c.Layer(global_progressicon_icon, op="add", level=256, x = global_progressicon_lastx + global_progressicon_xoffs, y = global_progressicon_lasty + global_progressicon_yoffs).Trim(0, frame-1) ++ c.Trim(frame, 0) : \
        c.Trim(0, global_progressicon_lastframe - 1) ++ c.Layer(global_progressicon_icon, op="add", level=256, x = global_progressicon_lastx + global_progressicon_xoffs, y = global_progressicon_lasty + global_progressicon_yoffs).Trim(global_progressicon_lastframe, frame-1) ++ c.Trim(frame, 0)

    # add the move
    layeredmove = c.Animate(frame, frame + ttime, "Layer",\
                                  global_progressicon_icon, "add", 256, global_progressicon_lastx + global_progressicon_xoffs, global_progressicon_lasty + global_progressicon_yoffs, \
                                  global_progressicon_icon, "add", 256, x + global_progressicon_xoffs, y + global_progressicon_yoffs)
    out = layered.Trim(0, frame-1) ++ layeredmove.Trim(frame, frame + ttime) ++ c.Trim(frame+ttime+1, 0)
    
    #re-set the globals
    global global_progressicon_lastx = x
    global global_progressicon_lasty = y
    global global_progressicon_lastframe = frame + ttime + 1
        
    #return with this
    return out
}

# this finalizes the last movement so the icon doesn't disappear from the map at the end of the last movement
# c: the "map" clip
function FinalizeProgressIcon(clip c) {
    layered = global_progressicon_lastframe == 0 ? \
        c.Layer(global_progressicon_icon, op="add", level=256, x = global_progressicon_lastx + global_progressicon_xoffs, y = global_progressicon_lasty + global_progressicon_yoffs) : \
        c.Trim(0, global_progressicon_lastframe - 1) ++ c.Layer(global_progressicon_icon, op="add", level=256, x = global_progressicon_lastx + global_progressicon_xoffs, y = global_progressicon_lasty + global_progressicon_yoffs).Trim(global_progressicon_lastframe, 0)
    return layered
}