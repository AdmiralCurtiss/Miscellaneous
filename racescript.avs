LoadPlugin("c:\HD PVR\MeGUI_1911_x86_WithoutInstaller\tools\dgavcindex\DGAVCDecode.dll")
LoadPlugin("c:\HD PVR\AvsPmod\NicAudio\NicAudio.dll")
LoadPlugin("d:\Users\Georg\Downloads\ffms-2.17\ffms2.dll")
import("d:\Users\Georg\Downloads\ffms-2.17\FFMS2.avsi")
import("d:\_svn\functions.avs")
import("d:\_svn\racefunctions.avs")

# Forum names & other meta info
p1racer = "r1"
p1iswildcard = true
p1nameontop = false
p1icon = ""

p2racer = "r2"
p2iswildcard = false
p2nameontop = true
p2icon = ""

p3racer = "r3"
p3iswildcard = false
p3nameontop = true
p3icon = ""

p4racer = "r4"
p4iswildcard = false
p4nameontop = false
p4icon = ""

p5racer = "r5"
p5iswildcard = false
p5nameontop = true
p5icon = ""

p6racer = "r6"
p6iswildcard = false
p6nameontop = true
p6icon = ""

p7racer = "r7"
p7iswildcard = false
p7icon = ""

p8racer = "r8"
p8iswildcard = false

p9racer = "r9"
p9iswildcard = false

p0racer = "r10"
p0iswildcard = true

# Find the frames the race videos start and end.
# Get them by returning a single player's video at the end of their "editing block"
p1startframe = 21833 - 340 - 1000
p1finishframe = 9999999
p2startframe = 5021
p2finishframe = 166946
p3startframe = 5073
p3finishframe = 126965
p4startframe = 4233
p4finishframe = 9999999
p5startframe = 5095
p5finishframe = 9999999
p6startframe = 21833 - 390
p6finishframe = 9999999
p7startframe = 9
p7finishframe = 9999999
p8startframe = 9
p8finishframe = 9
p9startframe = 9
p9finishframe = 9
p0startframe = 9
p0finishframe = 9

# set autocalculate to true to automatically calculate and display the finish time, otherwise set to false and manually enter what you want
p1autocalculatetime = true
p1finishtime = "45 762 frames / 12:42.700"
p2autocalculatetime = true
p2finishtime = "?"
p3autocalculatetime = true
p3finishtime = "63 708 frames / 17:41.800"
p4autocalculatetime = true
p4finishtime = "77 990 frames / 21:39.833"
p5autocalculatetime = true
p5finishtime = "59 637 frames / 16:33.950"
p6autocalculatetime = true
p6finishtime = "?"
p7autocalculatetime = true
p7finishtime = "?"
p8autocalculatetime = true
p8finishtime = "?"
p9autocalculatetime = true
p9finishtime = "?"
p0autocalculatetime = true
p0finishtime = "?"

# Honestly I'm not even sure if this is still used
namefont = "Mega Man 2"
global mugshotpath = "d:\Mega Man\mugshots\"

# don't edit this
biggeststartframe = p1startframe > p2startframe ? p1startframe : p2startframe
biggeststartframe = p3startframe > biggeststartframe ? p3startframe : biggeststartframe
biggeststartframe = p4startframe > biggeststartframe ? p4startframe : biggeststartframe
biggeststartframe = p5startframe > biggeststartframe ? p5startframe : biggeststartframe
biggeststartframe = p6startframe > biggeststartframe ? p6startframe : biggeststartframe
biggeststartframe = p7startframe > biggeststartframe ? p7startframe : biggeststartframe
biggeststartframe = p8startframe > biggeststartframe ? p8startframe : biggeststartframe
biggeststartframe = p9startframe > biggeststartframe ? p9startframe : biggeststartframe
biggeststartframe = p0startframe > biggeststartframe ? p0startframe : biggeststartframe
hours = 60*60*30
minutes = 60*30
seconds = 30
p1finishtime = p1autocalculatetime ? calculateTime(hours, minutes, seconds, p1finishframe - p1startframe) : p1finishtime
p2finishtime = p2autocalculatetime ? calculateTime(hours, minutes, seconds, p2finishframe - p2startframe) : p2finishtime
p3finishtime = p3autocalculatetime ? calculateTime(hours, minutes, seconds, p3finishframe - p3startframe) : p3finishtime
p4finishtime = p4autocalculatetime ? calculateTime(hours, minutes, seconds, p4finishframe - p4startframe) : p4finishtime
p5finishtime = p5autocalculatetime ? calculateTime(hours, minutes, seconds, p5finishframe - p5startframe) : p5finishtime
p6finishtime = p6autocalculatetime ? calculateTime(hours, minutes, seconds, p6finishframe - p6startframe) : p6finishtime
p7finishtime = p7autocalculatetime ? calculateTime(hours, minutes, seconds, p7finishframe - p7startframe) : p7finishtime
p8finishtime = p8autocalculatetime ? calculateTime(hours, minutes, seconds, p8finishframe - p8startframe) : p8finishtime
p9finishtime = p9autocalculatetime ? calculateTime(hours, minutes, seconds, p9finishframe - p9startframe) : p9finishtime
p0finishtime = p0autocalculatetime ? calculateTime(hours, minutes, seconds, p0finishframe - p0startframe) : p0finishtime

###----###
###----###
###----###
#------------------------------ACTUAL VIDEOS FROM RACERS START HERE---------------------------------
###----###
###----###
###----###

# -------------------------------------------------------- P1 ------------------------------------------------------
# Load and edit video as required
p1 = AVISource("curtiss/marioxp.avi").Trim(1000, 0)
#p1 = p1.ReplaceWithPreviousFrame(155766, 155803-155766).ReplaceWithPreviousFrame(156327, 5)
p1 = p1.PointResize(p1.width*2, p1.height*2)#.Crop(16, 0, -0, -0).AddBorders(40, 0, 40, 0, color=$000000).KillAudio()
p1 = p1.ChangeFPS(30)
p1 = p1.ConvertToYV12()

# Load bonus videos here. Do this near the end, as one of the later steps.
# The "syncframe" is the frame the bonus video starts **in the final combined video!!**; NOT in the local video here, you need to return near the bottom after inserting the audio

syncframe = 151920 - 1249 # somewhere around here
bonus = AviSource("curtiss/mariohacks.avi").Trim(2100, 0).AddBorders(64, 16, 64, 16, color=$000000) 
p1 = p1 ++ p1.Trim(p1.framecount, p1.framecount).Loop(999999) # padding
p1 = p1.Trim(0, (syncframe-1)-(biggeststartframe-p1startframe)) ++ bonus.ChangeFPS(30).ConvertToYV12()

rundowncolor = p1iswildcard ? $00ffff : $ffff00
p1status = simpleheader(p1racer, rundowncolor, p1finishtime, p1finishframe, p1.width, 28, p1nameontop, p1icon)
p1 = p1nameontop ? StackVertical(p1status, p1) : StackVertical(p1, p1status)
#return p1

# -------------------------------------------------------- P2 ------------------------------------------------------
# The other racers are identical to the first, refer to the top left block above for comments
p2 = AviSource("t/romhack.avi").AddBorders(16, 16, 16, 16, color=$000000) 
#p2 = p2.PointResize(p2.width*2, p2.height*2)
#p2 = p2.ChangeFPS(30)

#syncframe = 89672
#p2 = p2 ++ p2.Trim(p2.framecount, p2.framecount).Loop(9999999) # padding
#p2 = p2.Trim(0, (syncframe-1)-(biggeststartframe-p2startframe)) ++ AVISource("Netmonmatt/mmx2.avi").ChangeFPS(30).AudioDub(p2)

#p2 = p2 ++ p2.BlankClip

p2 = p2.ConvertToYV12()
rundowncolor = p2iswildcard ? $00ffff : $ffff00
p2status = simpleheader(p2racer, rundowncolor, p2finishtime, p2finishframe, p2.width, 28, p2nameontop, p2icon)
p2 = p2nameontop ? StackVertical(p2status, p2) : StackVertical(p2, p2status)
#return p2

# -------------------------------------------------------- P3 ------------------------------------------------------
p3 = ffvideosource("line/romhacklinebeck.mp4").AddBorders(16, 16, 16, 16, color=$000000) 
#p3 = p3.PointResize(p3.width*2, p3.height*2).Crop(16, 0, -0, -0).AddBorders(40, 0, 40, 0, color=$000000).KillAudio()
p3 = p3.ChangeFPS(30)
rundowncolor = p3iswildcard ? $00ffff : $ffff00
p3 = p3.ConvertToYV12()

#bonus = ffvideosource("greatguy/ASTraceTGGw1After.mp4").Spline36Resize(598, 448).AddBorders(0, 0, 2, 0, color=$000000)
#return bonus
#syncframe = 124765
#p3 = p3 ++ p3.Trim(p3.framecount, p3.framecount).Loop(9999999) # padding
#p3 = p3.Trim(0, (syncframe-1)-(biggeststartframe-p3startframe)) ++ bonus.ConvertToYv12()

p3status = simpleheader(p3racer, rundowncolor, p3finishtime, p3finishframe, p3.width, 28, p3nameontop, p3icon)
p3 = p3nameontop ? StackVertical(p3status, p3) : StackVertical(p3, p3status)
#return p3


# -------------------------------------------------------- P4 ------------------------------------------------------
p4 = ffvideosource("ffriend/befriend all marios.mp4").PointResize(512, 448).AddBorders(64, 16, 64, 16, color=$000000) 
#p4 = p4.PointResize(p4.width*2, p4.height*2).Crop(16, 0, -0, -0).AddBorders(40, 0, 40, 0, color=$000000)
p4 = p4.ChangeFPS(30)
rundowncolor = p4iswildcard ? $00ffff : $ffff00
p4 = p4.ConvertToYV12()

#bonus = ImageSource("volt/bszelda_ast1000.png").pointResize(512,448).Subtitle("Score screen added\nfor your convenience", font = "MegaMan 2", align=8, lsp=1).AddBorders(84, 0, 4, 0).ConvertToYV12().ChangeFPS(p4)
#syncframe = 161571
#p4 = p4 ++ p4.Trim(p4.framecount, p4.framecount).Loop(9999999) # padding
#p4 = p4.Trim(0, (syncframe-1)-(biggeststartframe-p4startframe)) ++ bonus

#p4 = p4 ++ p4.BlankClip

p4status = simpleheader(p4racer, rundowncolor, p4finishtime, p4finishframe, p4.width, 28, p4nameontop, p4icon)
p4 = p4nameontop ? StackVertical(p4status, p4) : StackVertical(p4, p4status)
#return p4


# -------------------------------------------------------- P5 ------------------------------------------------------
p5 = ffvideosource("ragny/ragny_hack.mp4").AddBorders(16, 16, 16, 16, color=$000000) 
p5 = p5.ChangeFPS(30)
p5 = p5.ConvertToYV12()

rundowncolor = p5iswildcard ? $00ffff : $ffff00
p5status = simpleheader(p5racer, rundowncolor, p5finishtime, p5finishframe, p5.width, 28, p5nameontop, p5icon)
p5 = p5nameontop ? StackVertical(p5status, p5) : StackVertical(p5, p5status)

syncframe = 102275
p5 = p5.Trim(0, (syncframe-1)-(biggeststartframe-p5startframe)).FadeOut(30)

a = 2028
b = 2950
p5 = p5.Trim(0, -1).Loop(b-a-1) ++ p5.Trim(0, a) ++ p5.Trim(b, 0)

#return p5


# -------------------------------------------------------- P6 ------------------------------------------------------
p6 = p1.blankclip
#p6 = p6.PointResize(p6.width*2, p6.height*2)
#p6 = p6.ChangeFPS(30)
rundowncolor = p6iswildcard ? $00ffff : $ffff00
p6 = p6.ConvertToYV12()

#syncframe = 91150
#p6 = p6 ++ p6.Trim(p6.framecount, p6.framecount).Loop(9999999) # padding
#p6 = p6.Trim(0, (syncframe-1)-(biggeststartframe-p6startframe)) ++ ffvideosource("greatguy/ASTraceTGGw1After.mp4").ChangeFPS(30)

#p6 = p6 ++ p6.BlankClip
p6status = simpleheader(p6racer, rundowncolor, p6finishtime, p6finishframe, p6.width, 28, p6nameontop, p6icon)
p6 = p6nameontop ? StackVertical(p6status, p6) : StackVertical(p6, p6status)

#return p6

# -------------------------------------------------------- P7 ------------------------------------------------------
p7 = p1.blankclip
#p7 = p7.PointResize(p7.width*2, p7.height*2)
p7 = p7.ConvertToYV12()
#p7 = p7.ChangeFPS(30)
rundowncolor = p7iswildcard ? $00ffff : $ffff00

#bonus = ffvideosource("volt/thecropping.mp4").Crop(0, 76, -0, -76)
#bonus = bonus.AddBorders(864-bonus.width, 0, 0, 0, color=$000000)
#p7 = p7.AddBorders(864-p7.width, 0, 0, 0, color=$000000)
#syncframe = 205201
#p7 = p7 ++ p7.Trim(p7.framecount, p7.framecount).Loop(9999999) # padding
#p7 = p7.Trim(0, (syncframe-1)-(biggeststartframe-p7startframe)) ++ bonus.ChangeFPS(30).AudioDub(p7)

#p7 = p7 ++ p7.BlankClip
p7status = simpleheader(p7racer, rundowncolor, p7finishtime, p7finishframe, p7.width, 28, icon=p7icon)
p7 = StackVertical(p7, p7status)

#return p7

# -------------------------------------------------------- P8 ------------------------------------------------------
p8 = BlankClip(p1)
#p8 = p8.PointResize(p8.width*2, p8.height*2)
p8 = p8.ConvertToYV12()
#p8 = p8.ChangeFPS(30)
rundowncolor = p8iswildcard ? $00ffff : $ffff00

#syncframe =  170204
#p8 = p8 ++ p8.Trim(p8.framecount, p8.framecount).Loop(9999999) # padding
#p8 = p8.Trim(0, (syncframe-1)-(biggeststartframe-p8startframe)) ++ AVISource("ulti/Battletoads Bonus.avi").PointResize(512, 448).AddBorders(32, 0, 32, 0, color=$000000).ChangeFPS(30).AudioDub(p8).ConvertToYV12
#syncframe = 194608 #194418
#p8 = p8 ++ p8.Trim(p8.framecount, p8.framecount).Loop(9999999) # padding
#p8 = p8.Trim(0, (syncframe-1)-(biggeststartframe-p8startframe)) ++ AVISource("ulti/Battletoads Part Deux or whatever.avi").PointResize(512, 448).AddBorders(32, 0, 32, 0, color=$000000).ChangeFPS(30).AudioDub(p8).ConvertToYV12

#p7 = p7 ++ p7.BlankClip
p8status = simpleheader(p8racer, rundowncolor, p8finishtime, p8finishframe, p8.width, 28)
p8 = StackVertical(p8, p8status)

#return p8


# -------------------------------------------------------- P9 ------------------------------------------------------
p9 = BlankClip(p1)
p9 = p9.Crop(16, 0, -0, -0).AddBorders(40, 0, 40, 0, color=$000000)
p9 = p9.ConvertToYV12()
p9 = p9.ChangeFPS(30)
rundowncolor = p8iswildcard ? $00ffff : $ffff00

#bonus = 
#syncframe = 191538 # ?????
#p9 = p9 ++ p9.Trim(p7.framecount, p7.framecount).Loop(9999999) # padding
#p9 = p9.Trim(0, (syncframe-1)-(biggeststartframe-p9startframe)) ++ bonus

p9status = simpleheader(p9racer, rundowncolor, p9finishtime, p9finishframe, p9.width, 28)
p9 = StackVertical(p9, p9status)

#p9addon = ffvideosource("ragny/kirby_food_cam.mp4")
#p9addon = p9addon.Trim(0, -1).BlankClip ++ p9addon.Trim(1, 0)
#p9addon = p9addon.AddBorders(106, p9.height-p9addon.height - 32, 0, 32, color=$000000)
#p9 = StackHorizontal(p9addon, p9)

#return p9


# -------------------------------------------------------- P10 ------------------------------------------------------
p0 = BlankClip(p1)
p0 = p0.ConvertToYV12()
p0 = p0.ChangeFPS(30)
rundowncolor = p0iswildcard ? $00ffff : $ffff00

#syncframe = 120176
#p0 = p0 ++ p0.Trim(p0.framecount, p0.framecount).Loop(9999999) # padding
#p0 = p0.Trim(0, (syncframe-1)-(biggeststartframe-p0startframe)) ++ ffvideosource("chitlin/Chitlins stuff.mp4").Crop(16, 0, -0, -0).AddBorders(40, 0, 40, 0, color=$000000).StretchTo(268449-120176)

#p0 = p0 ++ p0.BlankClip

p0status = simpleheader(p0racer, rundowncolor, p0finishtime, p0finishframe, p0.width, 28)
p0 = StackVertical(p0, p0status)

#return p0


# don't edit this, it's automatic and syncs up the videos if you correctly filled in the start frames
# adjust races to start on the same frame
p1 = p1.Trim(0, -1).Loop(biggeststartframe-p1startframe, 0, 0) ++ p1
p2 = p2.Trim(0, -1).Loop(biggeststartframe-p2startframe, 0, 0) ++ p2
p3 = p3.Trim(0, -1).Loop(biggeststartframe-p3startframe, 0, 0) ++ p3
p4 = p4.Trim(0, -1).Loop(biggeststartframe-p4startframe, 0, 0) ++ p4
p5 = p5.Trim(0, -1).Loop(biggeststartframe-p5startframe, 0, 0) ++ p5
p6 = p6.Trim(0, -1).Loop(biggeststartframe-p6startframe, 0, 0) ++ p6
p7 = p7.Trim(0, -1).Loop(biggeststartframe-p7startframe, 0, 0) ++ p7
p8 = p8.Trim(0, -1).Loop(biggeststartframe-p8startframe, 0, 0) ++ p8
p9 = p9.Trim(0, -1).Loop(biggeststartframe-p9startframe, 0, 0) ++ p9
p0 = p0.Trim(0, -1).Loop(biggeststartframe-p0startframe, 0, 0) ++ p0

# combine the videos to one big video here, adjust as required
row1 = StackHorizontal(p5, p2, p3) #1632
row2 = StackHorizontal(p1, p4).AddBorders(176, 0, 176, 0)
combined4 = StackVertical(row1, row2)

#return combined4#.PointResize(combined4.width/2, combined4.height/2)

#add the timer
x = 1392
y = 490 
#combined4 = animate( biggeststartframe+1, combined4.framecount(), "counter", combined4, 0, x, y, combined4, combined4.framecount()-(biggeststartframe+1), x, y)
x = 1820 + 16
y = 440 
#combined4 = animate( biggeststartframe+1, combined4.framecount(), "counter", combined4, 0, x, y, combined4, combined4.framecount()-(biggeststartframe+1), x, y)





# return here to return without the audio, you can also use this return to figure out the fortress progress frame numbers below
#return combined4#.AddBorders(0, 0, 0, 210, color=$000000) # 2080x1170


# ---------------------------------------------------------- GLOBAL PROGRESS BARS AND STUFF -----------------------------------------------------------------
# ---------- USE THIS SECTION FOR ANY GLOBAL PROGRESS SUCH AS A MAP WITH MOVING ICONS ---------
# ---------- Per racer progress such as robot master kill icons should go above in each's player's section ---------
# ---------- Remove or comment out this section if not required -----------

/*

progressbar = ImageSource("progressbar.png", start=0, end=combined4.framecount-1, fps=30).ConvertToRGB32()
progressbar = progressbar.AddBorders((2080 - progressbar.width)/2, 0, (2080 - progressbar.width)/2, 0)

InitProgressIcon(ImageSource("f.png", start=0, end=combined4.framecount-1, fps=30, pixel_type="RGB24").AddBorders(1,1,1,1,color=$000000).ConvertToRGB32(), 572, 110, -9+8, -1, 30) # yoshi's house
progressbar = progressbar.MoveProgressIcon(510, 110, 22131) # m·lkippe 1
progressbar = progressbar.MoveProgressIcon(540, 140, 32207) # cape stage
progressbar = progressbar.MoveProgressIcon(572, 110, 38805, 1) # yoshi
progressbar = progressbar.MoveProgressIcon(510, 110, 40345) # m·lkippe 1
progressbar = progressbar.MoveProgressIcon(540, 140, 52884) # cape stage
progressbar = progressbar.MoveProgressIcon(572, 110, 60878) # yoshi
progressbar = progressbar.MoveProgressIcon(606, 140, 62862) # m·lkippe2
progressbar = progressbar.MoveProgressIcon(606, 92, 71828) # m·lkippe3
progressbar = progressbar.MoveProgressIcon(606, 60, 79525) # castle 1
progressbar = progressbar.MoveProgressIcon(807, 138, 83011) # fritten 1
progressbar = progressbar.MoveProgressIcon(854, 138, 95485) # green switch
progressbar = progressbar.MoveProgressIcon(807, 138, 98034) # fritten 1
progressbar = progressbar.MoveProgressIcon(807, 90, 107085) # fritten 2
progressbar = progressbar.MoveProgressIcon(727, 122, 111069) # fritten 3
progressbar = progressbar.MoveProgressIcon(696, 60, 119918) # fritten geist
progressbar = progressbar.MoveProgressIcon(744, 28, 134183) # fritten 4
progressbar = progressbar.MoveProgressIcon(775, 72, 142656) # castle 2
progressbar = progressbar.MoveProgressIcon(1123, 150, 157618) # CNaOOcS kaff
progressbar = progressbar.MoveProgressIcon(1059, 150, 163095) # CNaOOcS 1 (auto-finish)
progressbar = progressbar.MoveProgressIcon(1059, 52, 163696) # CNaOOcS Geist (auto-finish)
progressbar = progressbar.MoveProgressIcon(1027, 52, 164616) # CNaOOcS 2
#progressbar = progressbar.MoveProgressIcon(995, 52, 159657) # CNaOOcS 3
#progressbar = progressbar.MoveProgressIcon(963, 134, 162031) # CNaOOcS castle
#progressbar = progressbar.MoveProgressIcon(1351, 76, 168507) # final!
progressbar = progressbar.FinalizeProgressIcon()

InitProgressIcon(ImageSource("t.png", start=0, end=combined4.framecount-1, fps=30, pixel_type="RGB24").AddBorders(1,1,1,1,color=$000000).ConvertToRGB32(), 572, 110, -9+4, -9, 30) # yoshi's house
progressbar = progressbar.MoveProgressIcon(510, 110, 22040) # m·lkippe 1
progressbar = progressbar.MoveProgressIcon(540, 140, 25148) # cape stage
progressbar = progressbar.MoveProgressIcon(572, 110, 33235) # yoshi
progressbar = progressbar.MoveProgressIcon(606, 140, 34286) # m·lkippe2
progressbar = progressbar.MoveProgressIcon(606, 92, 41057) # m·lkippe3
progressbar = progressbar.MoveProgressIcon(606, 60, 47797) # castle 1
progressbar = progressbar.MoveProgressIcon(807, 138, 52714) # fritten 1
progressbar = progressbar.MoveProgressIcon(854, 138, 60187) # green switch
progressbar = progressbar.MoveProgressIcon(807, 138, 63017) # fritten 1
progressbar = progressbar.MoveProgressIcon(807, 90, 68004) # fritten 2
progressbar = progressbar.MoveProgressIcon(727, 122, 70734) # fritten 3
progressbar = progressbar.MoveProgressIcon(807, 138, 70800) # fritten 1
progressbar = progressbar.MoveProgressIcon(807, 90, 71108) # fritten 2
progressbar = progressbar.MoveProgressIcon(807, 138, 72818) # fritten 1
progressbar = progressbar.MoveProgressIcon(807, 90, 79735) # fritten 2
progressbar = progressbar.MoveProgressIcon(807, 138, 79946, 1) # fritten 1
progressbar = progressbar.MoveProgressIcon(807, 90, 80189) # fritten 2
progressbar = progressbar.MoveProgressIcon(807, 138, 80628, 1) # fritten 1
progressbar = progressbar.MoveProgressIcon(807, 90, 80907) # fritten 2
progressbar = progressbar.MoveProgressIcon(807, 138, 81090, 1) # fritten 1
progressbar = progressbar.MoveProgressIcon(807, 90, 81229) # fritten 2
progressbar = progressbar.MoveProgressIcon(871, 122, 88752) # hamburger world
progressbar = progressbar.MoveProgressIcon(903, 122, 94805) # fritten gratis
progressbar = progressbar.MoveProgressIcon(871, 122, 95368) # hamburger world
progressbar = progressbar.MoveProgressIcon(854, 138, 133072, 1) # green switch
progressbar = progressbar.MoveProgressIcon(871, 122, 133392, 1) # hamburger world
progressbar = progressbar.MoveProgressIcon(903, 122, 133905) # fritten gratis
progressbar = progressbar.MoveProgressIcon(871, 122, 134568) # hamburger world
progressbar = progressbar.MoveProgressIcon(871, 170, 144054) # hamburger geist
progressbar = progressbar.MoveProgressIcon(759, 106, 158645) # hamburger fortress
progressbar = progressbar.MoveProgressIcon(871, 170, 158848) # hamburger geist
progressbar = progressbar.MoveProgressIcon(903, 122, 159241) # fritten gratis
progressbar = progressbar.MoveProgressIcon(871, 170, 159929) # hamburger geist
progressbar = progressbar.MoveProgressIcon(1565, 124, 170518) # trottel baggage
progressbar = progressbar.MoveProgressIcon(1533, 124, 178765) # sound
progressbar = progressbar.MoveProgressIcon(1565, 124, 179153) # trottel baggage
progressbar = progressbar.MoveProgressIcon(1469, 172, 183275) # blue switch
progressbar = progressbar.FinalizeProgressIcon()

InitProgressIcon(ImageSource("l.png", start=0, end=combined4.framecount-1, fps=30, pixel_type="RGB24").AddBorders(1,1,1,1,color=$000000).ConvertToRGB32(), 572, 110, -1+4, -9, 30) # yoshi's house
progressbar = progressbar.MoveProgressIcon(510, 110, 22148) # m·lkippe 1
progressbar = progressbar.MoveProgressIcon(540, 140, 31007) # cape stage
progressbar = progressbar.MoveProgressIcon(572, 110, 32860) # yoshi
progressbar = progressbar.MoveProgressIcon(540, 140, 33543) # cape stage
progressbar = progressbar.MoveProgressIcon(572, 110, 47190) # yoshi
progressbar = progressbar.MoveProgressIcon(606, 140, 48566) # m·lkippe2
progressbar = progressbar.MoveProgressIcon(606, 92, 53462) # m·lkippe3
progressbar = progressbar.MoveProgressIcon(606, 60, 54874) # castle 1
progressbar = progressbar.MoveProgressIcon(807, 138, 60819) # fritten 1
progressbar = progressbar.MoveProgressIcon(854, 138, 71229) # green switch
progressbar = progressbar.MoveProgressIcon(807, 138, 74313) # fritten 1
progressbar = progressbar.MoveProgressIcon(807, 90, 80234) # fritten 2
progressbar = progressbar.MoveProgressIcon(727, 122, 85097) # fritten 3
progressbar = progressbar.MoveProgressIcon(696, 60, 89344) # fritten geist
progressbar = progressbar.MoveProgressIcon(744, 28, 99527) # fritten 4
progressbar = progressbar.MoveProgressIcon(775, 72, 105919) # castle 2
progressbar = progressbar.MoveProgressIcon(1123, 150, 119143) # CNaOOcS kaff
progressbar = progressbar.MoveProgressIcon(1059, 150, 123326) # CNaOOcS 1 (auto-finish)
progressbar = progressbar.MoveProgressIcon(1059, 52, 124212) # CNaOOcS Geist (auto-finish)
progressbar = progressbar.MoveProgressIcon(1027, 52, 125037) # CNaOOcS 2
progressbar = progressbar.MoveProgressIcon(995, 52, 130979) # CNaOOcS 3
progressbar = progressbar.MoveProgressIcon(963, 134, 137012) # CNaOOcS castle
progressbar = progressbar.MoveProgressIcon(1351, 76, 142467) # final!
progressbar = progressbar.FinalizeProgressIcon()

InitProgressIcon(ImageSource("r.png", start=0, end=combined4.framecount-1, fps=30, pixel_type="RGB24").AddBorders(1,1,1,1,color=$000000).ConvertToRGB32(), 572, 110, -1-12, -9, 30) # yoshi's house
progressbar = progressbar.MoveProgressIcon(510, 110, 22010) # m·lkippe 1
progressbar = progressbar.MoveProgressIcon(540, 140, 29277) # cape stage
progressbar = progressbar.MoveProgressIcon(572, 110, 34082) # yoshi
progressbar = progressbar.MoveProgressIcon(606, 140, 34919) # m·lkippe2
progressbar = progressbar.MoveProgressIcon(540, 140, 38309) # cape stage
progressbar = progressbar.MoveProgressIcon(606, 140, 46252) # m·lkippe2
progressbar = progressbar.MoveProgressIcon(606, 92, 48726) # m·lkippe3
progressbar = progressbar.MoveProgressIcon(606, 60, 52761) # castle 1
progressbar = progressbar.MoveProgressIcon(807, 138, 62877) # fritten 1
progressbar = progressbar.MoveProgressIcon(854, 138, 72843) # green switch
progressbar = progressbar.MoveProgressIcon(807, 138, 74608) # fritten 1
progressbar = progressbar.MoveProgressIcon(807, 90, 80660) # fritten 2
progressbar = progressbar.MoveProgressIcon(727, 122, 83030) # fritten 3
progressbar = progressbar.MoveProgressIcon(696, 60, 87464) # fritten geist
progressbar = progressbar.MoveProgressIcon(744, 28, 93719) # fritten 4
progressbar = progressbar.MoveProgressIcon(775, 72, 99399) # castle 2
progressbar = progressbar.FinalizeProgressIcon()

#progressbar = progressbar.Crop(2080-combined4.width, 0, 0, 0)
#progressbar = progressbar.AddBorders(0, 4, 0, 4, color=$000000).BlankCrop(2, 47984, 676, 4, 1300, 210, color=$000000).Crop(0, 4, 0, -4)
#progressbar = progressbar.BlankCrop(2, 78188, 1162, 22, 268, 166, color=$000000)
#progressbar = progressbar.BlankCrop(2, 110879, 1430, 22, 268, 166, color=$000000)
#progressbar = progressbar.BlankCrop(2, 120279, 938, 22, 224, 166, color=$000000)

#combined4 = StackVertical(progressbar.ConvertToYV12, StackHorizontal(p6, p6, p6, p6))
#combined4 = StackVertical(combined4, progressbar.ConvertToYV12)
#return combined4

border = 80
combined4 = combined4.AddBorders(border, 0, border, 0)
x = 8
y = 490 
combined4 = animate( biggeststartframe+1, combined4.framecount(), "counter", combined4, 0, x, y, combined4, combined4.framecount()-(biggeststartframe+1), x, y)
x = 1540+6
y = 490 
combined4 = animate( biggeststartframe+1, combined4.framecount(), "counter", combined4, 0, x, y, combined4, combined4.framecount()-(biggeststartframe+1), x, y)

# 320 px per thing
w1 = progressbar.Crop(453, 0, -1405, -0).Crop(0, 22, -0, -22)
w2 = progressbar.Crop(676, 0, -1142, -0)
w3 = progressbar.Crop(939, 0, -919, -0).Crop(0, 22, -0, -22)
w4 = progressbar.Crop(1162, 0, -652, -14).Crop(0, 32, -0, -18)
wS = progressbar.Crop(1430, 0, -454, -0).Crop(0, 22, -0, -22)
w1 = w1.AddBorders((320-w1.width)/2, 0, (320-w1.width)/2, 1)
w2 = w2.AddBorders((320-w2.width)/2, 0, (320-w2.width)/2, 1)
w3 = w3.AddBorders((320-w3.width)/2, 0, (320-w3.width)/2, 1)
w4 = w4.AddBorders((320-w4.width)/2, 0, (320-w4.width)/2, 1)
wS = wS.AddBorders((320-wS.width)/2, 0, (320-wS.width)/2, 0)
wA = StackVertical(w1, w2, w3, w4, wS)
#492

cTop = combined4.Crop(0, 0, 0, 524)
cBot = combined4.Crop(0, 524, -0, -0)
cLeft = cBot.Crop(0, 0, 1472, 0)

combined4 = StackVertical(cTop, StackHorizontal(cLeft, wA.scrollthing.converttoyv12))

#return combined4

function scrollthing(clip c) {
    c = c.Trim(0, 119144) ++ c.Trim(119145, 0).Animate(0, 30, "ShiftUp", 1, 172)
    c = c.Trim(0, 170519) ++ c.Trim(170520, 0).Animate(0, 30, "ShiftUp", 1, 210-16)

    return c.Crop(0, 0, -0, -366)
}

*/

# -------------------------------------------------------- SOUND ------------------------------------------------------
# Load your sound here, adjust it as neccessary, then Audiodub() it over combined4 into finalfour.
# Probably easiest to just edit it in Audacity and then load it, but you can also mix it together here if you want

#callgraph = WAVSource("DemonTrigger (Host)/round1groupsomething callgraph.wav")
#callgraphhost = callgraph.GetChannel(1).DelayAudio(0.6).Amplifydb(-3)
#callgraphothers = callgraph.GetChannel(2)
#callgraph = MixAudio(callgraphhost, callgraphothers, 1.0, 1.0)
#callgraph = callgraph.SSRC(44100) # match sample rate of soundtrack
#callgraph = MergeChannels(callgraph, callgraph) # convert to stereo

# Adjust the calculation to the right to match the "GO!" at the start of the race
# ie in this case, the GO occurs 3 minutes and 18.224 seconds into the audio loaded above
#callgraph = callgraph.DelayAudio((float(biggeststartframe)/combined4.framerate)-(float(3*60)+18.224))

#commentary = NicMPG123Source("kirbyrace.mp3").SSRC(44100)
commentary = WAVSource("d:\_\orld2-commentary-final-probably.wav")
#commentary = MergeChannels(commentary, commentary)

# manually fill in audiostart as the time where the race starts in the audio, may need some minor adjustment in either direction
videostart = biggeststartframe / combined4.framerate
audiostart = 11*60+40.500
#combined4 = combined4.subtitle(string(videostart))
commentary = commentary.DelayAudio( ((videostart)-(audiostart)) )


combined4 = combined4 ++ combined4.Trim(combined4.framecount, combined4.framecount).Loop(999999)
finalfour=AudioDub(combined4, commentary) 

# -------------------------------------------------------- RETURN HERE TO GET BONUS VIDEO START FRAMES ------------------------------------------------------

#return finalfour
#return finalfour.Trim(0, 250000)

#-------------------------------------------------------- FINAL VERSION --------------------------------------------------------


# Adjust trim values to the frames where you want your video to start and end
finalfour = finalfour.Trim(0, 250000)
finalfour = finalfour.Trim(16175, 0)
finalfour = finalfour.Trim(0, 168160).DelayAudio(1.5)
#finalfour = finalfour.PointResize(finalfour.width/2, finalfour.height/2)
#finalfour = finalfour.Spline36Resize(finalfour.width/2, finalfour.height/2-1)
#return finalfour # return without soundtrack

# add soundtrack
#soundtrack = WAVSource("soundtrack.wav")
soundtrack = WAVSource("d:\_\orld2-soundtrack-fixed.wav")
finalfour = MixAudio(finalfour, soundtrack, clip1_factor=1.0, clip2_factor=0.13) # adjust clip2_factor as needed to change soundtrack volume
#return finalfour

# add soundtrack info
finalfour = finalfour.soundtrackBL("Soundtrack selection by\nAdmiral H. Curtiss", 1, 20, 256)
finalfour = finalfour.soundtrackBL("Mad Forest\nCastlevania Best Music Collection\nCastlevania Judgment\nKonami Kukeiha Club", 0*minutes + 10*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Prologue (Start BGM)\nCastlevania Best Music Collection\nCastlevania\nKonami Kukeiha Club", 3*minutes + 27*seconds, 10, 256)
finalfour = finalfour.soundtrackBL("Vampire Killer\nCastlevania Best Music Collection\nCastlevania\nKonami Kukeiha Club", 3*minutes + 37*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("An Empty Tome\nCastlevania: Order of Ecclesia\nMichiru Yamane, Yasuhiro Ichihashi", 4*minutes + 54*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Bloody Tears (Stage 10 Clock Tower)\nCastlevania Best Music Collection\nSuper Castlevania IV\nKonami Kukeiha Club", 7*minutes + 53*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Slash\nCastlevania Best Music Collection\nCastlevania: Dracula X Chronicles\nKonami Kukeiha Club", 10*minutes + 2*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Stage Clear (Stage Clear)\nCastlevania Best Music Collection\nSuper Castlevania IV\nKonami Kukeiha Club", 12*minutes + 24*seconds, 10, 256)
finalfour = finalfour.soundtrackBL("Beginning\nCastlevania Best Music Collection\nSymphony of the Night (Saturn)\nKonami Kukeiha Club", 12*minutes + 37*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Ghost Ship Painting (Stage 5 Normal)\nCastlevania Best Music Collection\nCastlevania: Rondo of Blood\nKonami Kukeiha Club", 15*minutes + 52*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Lost Painting\nCastlevania: Symphony of the Night\nMichiru Yamane", 18*minutes + 32*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Praying Hands (Cloud Castle BGM)\nCastlevania Best Music Collection\nCastlevania II: Belmont's Revenge\nKonami Kukeiha Club", 20*minutes + 13*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Blood Relations of Heaven and Earth\nCastlevania Best Music Collection\nCastlevania: Rondo of Blood\nKonami Kukeiha Club", 23*minutes + 25*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Crucifix Held Close\nCastlevania: Portrait of Ruin\nMichiru Yamane", 26*minutes + 46*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Cemetery (Stage 3 Other Side BGM)\nCastlevania Best Music Collection\nCastlevania: Rondo of Blood\nKonami Kukeiha Club", 31*minutes + 31*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Simon Belmont's Theme (Stage 1-2)\nCastlevania Best Music Collection\nSuper Castlevania IV\nKonami Kukeiha Club", 34*minutes + 12*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Iron Blue Intention\nCastlevania: Portrait of Ruin\nMichiru Yamane", 37*minutes + 54*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("STAGE CLEAR\nCastlevania Best Music Collection\nCastlevania: The Arcade\nKonami Kukeiha Club", 42*minutes + 39*seconds, 10, 256)
finalfour = finalfour.soundtrackBL("LOADING\nCastlevania Best Music Collection\nCastlevania: Dracula X Chronicles\nKonami Kukeiha Club", 42*minutes + 49*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Heart of Fire\nCastlevania Best Music Collection\nCastlevania\nKonami Kukeiha Club", 46*minutes + 34*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Wandering the Crystal Blue\nCastlevania: Order of Ecclesia\nMichiru Yamane, Yasuhiro Ichihashi", 48*minutes + 48*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Clock Work\nCastlevania Best Music Collection\nCastlevania Judgment\nKonami Kukeiha Club", 51*minutes + 24*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Sinking Old Sanctuary (Greek Temple)\nCastlevania Best Music Collection\nCastlevania: Bloodlines\nKonami Kukeiha Club", 54*minutes + 39*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Wicked Child (Outdoors BGM)\nCastlevania Best Music Collection\nCastlevania\nKonami Kukeiha Club", 56*minutes + 44*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Marble Gallery\nCastlevania: Symphony of the Night\nMichiru Yamane", 58*minutes + 52*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Castlevania Medley\nUnknown Artist", 60*minutes + 16*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Op.13 (Stage 5 Other Side BGM)\nCastlevania Best Music Collection\nCastlevania: Rondo of Blood\nKonami Kukeiha Club", 67*minutes + 38*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Dracula's Castle\nCastlevania: Symphony of the Night\nMichiru Yamane", 69*minutes + 6*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Wandering Ghosts (Remix)\nUnknown Artist", 70*minutes + 59*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Emerald Mist\nCastlevania: Order of Ecclesia\nMichiru Yamane, Yasuhiro Ichihashi", 76*minutes + 18*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Tachismystic Construction: Beginning\nCastlevania Best Music Collection\nDracula the Immortal\nKonami Kukeiha Club", 80*minutes + 20*seconds, 20, 256)
finalfour = finalfour.soundtrackBL("Ballad for a Gorgeous Heroine\nCastlevania Best Music Collection\nDracula the Immortal\nKonami Kukeiha Club", 89*minutes + 32*seconds, 20, 256)#return finalfour.Crop(2240, 540, -0, -0)

#finalfour = finalfour.Crop(0, 936, 256, -0)
#finalfour = finalfour.PointResize(finalfour.width/2, finalfour.height/2)

# match video and audio duration
(finalfour ++ finalfour).Trim(0, finalfour.framecount-1)

return finalfour

# if you need to split the video into multiple parts for some reason do it here

splitframe = 197970
pt1 = Trim(0, splitframe)
pt2 = Trim(splitframe+1, 0)
#pt1
#pt2

last
__END__