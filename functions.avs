# on two synced clips c1 and c2, fades to c2 betweeen firstframe and lastframe and back again
# intended for things like picture-in-picture footage, overlays, and so on
function FadeBetween( clip c1, clip c2, int firstframe, int lastframe, int frames ) {
    out = Dissolve( c1.Trim(0, firstframe), c2.Trim(firstframe - (frames-1), lastframe + (frames-1)), c1.Trim(lastframe, 0), frames )
    return out
}

# converts YV12 3x pixel art video footage to as-clean-as-possible 2x RGB footage, to minimize color bleeding
function Point3xTo2x(clip c) {
    c = c.ConvertToRGB24()
    c = c.ShiftLeft(1).ShiftDown(1)
    c = c.PointResize(c.width/3, c.height/3)
    c = c.PointResize(c.width*2, c.height*2)
    return c
}

function TASBlend(clip c, float "ratio")  { 
        # reduces framerate to 1/2 but leaves flicker effects partly visible 
        # blends frame pairs with alternating opacity (default is 2/3+1/3;1/3+2/3) 
        # optional "ratio" is the opacity of the first frame out of the four 
        ratio    = default(ratio, 2.0 / 3) 
        opacity1 = round((1 - ratio) * 257) 
        opacity2 = round((    ratio) * 257) 
        c 
        Interleave(Layer(SelectEvery(4, 0), SelectEvery(4, 1), level=opacity1), 
        \          Layer(SelectEvery(4, 2), SelectEvery(4, 3), level=opacity2)) 
}

function Add(clip c, int frame, int count) {
    c1 = c.Trim(0, frame)
    c2 = c.Trim(frame+1, 0)
    cn = c.Trim(frame, -1)
    return c1 ++ cn.Loop(count) ++ c2
}

function Drop(clip c, int frame, int "count") {
    count = Defined(count) ? count : 1
    c1 = c.Trim(0, frame)
    c2 = c.Trim(frame+count+1, 0)
    return c1++c2
}

function Crop2(clip c) {
    return c.Crop(2, 2, -2, -2)
}

function UpscaleYoutube(clip vid, int "pixel_height") {
    new_h = Defined(pixel_height) ? pixel_height : 720
    h = height(vid)
    w = width(vid)
    return vid.Spline36Resize((w*new_h)/h, new_h)
}

function RemoveSectionUsingDissolve(clip vid, int start, int end, int dissolveframes) {
    part1 = vid.Trim(0, start+dissolveframes)
    part2 = vid.Trim(end-dissolveframes, 0)
    return Dissolve(part1, part2, dissolveframes)
}

function RemoveSectionUsingFadeIO(clip vid, int start, int end, int fadeframes) {
    part1 = vid.Trim(0, start+fadeframes)
    part2 = vid.Trim(end-fadeframes, 0)
    return part1.FadeOut(fadeframes) ++ part2.FadeIn(fadeframes)
}

function FreezeOnStart(clip vid, int frames) {
    a = vid.Trim(0, -1).Loop(frames).AmplifydB(-200)
    return a ++ vid
}

function ChangeSpeed(clip c, float factor) {
    return c.TimeStretch(tempo=100 * factor).AssumeFPS(c.FrameRate * factor).ChangeFPS(c.FrameRate)
}

function ChangeSpeedInSection(clip c, int firstframe, int lastframe, float factor) {
    p1 = c.Trim(0, firstframe-1)
    p2 = c.Trim(firstframe, lastframe).ChangeSpeed(factor)
    p3 = c.Trim(lastframe+1, 0)
    return p1++p2++p3
}

function ChangeSpeedInSection2x(clip c, int firstframe, int lastframe, float factor, float factor2) {
    p1 = c.Trim(0, firstframe-1)
    p2 = c.Trim(firstframe, lastframe).ChangeSpeed(factor).ChangeSpeed(factor2)
    p3 = c.Trim(lastframe+1, 0)
    return p1++p2++p3
}

function BlankSection(clip c, int firstframe, int lastframe, bool "blankaudio") {
    blankaudio = Default(blankaudio, false)
    p1 = c.Trim(0, firstframe-1)
    p2 = c.Trim(firstframe, lastframe).BlankClip(length=lastframe-firstframe)
    p3 = c.Trim(lastframe+1, 0)
    r = p1++p2++p3
    r = blankaudio == false ? r : r.AudioDub(c)
    return r
}

function SliceandAnimatedOverlay(clip base, clip new, int firstframe, int lastframe, int x1, int y1, int x2, int y2) {
    #Trim out the middle of a clip called base and add a clip called new moving from x1y1 to x2y2 between firstframe and lastframe leaving everything else untouched
    base=base.Trim(0,-firstframe)++\
    Animate(base,firstframe,lastframe,"Layer",\
    new, "add", 256, x1, y1, \
    new, "add", 256, x2, y2).Trim(firstframe,lastframe)++\
    base.Trim(lastframe+1,0)
    return base
}

function BowserLaugh100Frames(clip base, clip bowserL1, clip bowserL2, int startframe, int x1, int y1, int x2, int y2) {
    last = base
    SliceandAnimatedOverlay(bowserL1, startframe, startframe+19, x1, y1, x2, y2)
    SliceandAnimatedOverlay(bowserL2, startframe+20, startframe+39, x1, y1, x2, y2)
    SliceandAnimatedOverlay(bowserL1, startframe+40, startframe+59, x1, y1, x2, y2)
    SliceandAnimatedOverlay(bowserL2, startframe+60, startframe+79, x1, y1, x2, y2)
    SliceandAnimatedOverlay(bowserL1, startframe+80, startframe+99, x1, y1, x2, y2)
    return last
}

function BowserLaugh180Frames(clip base, clip bowserL1, clip bowserL2, int startframe, int x1, int y1, int x2, int y2) {
    last = base
    SliceandAnimatedOverlay(bowserL1, startframe, startframe+19, x1, y1, x2, y2)
    SliceandAnimatedOverlay(bowserL2, startframe+20, startframe+39, x1, y1, x2, y2)
    SliceandAnimatedOverlay(bowserL1, startframe+40, startframe+59, x1, y1, x2, y2)
    SliceandAnimatedOverlay(bowserL2, startframe+60, startframe+79, x1, y1, x2, y2)
    SliceandAnimatedOverlay(bowserL1, startframe+80, startframe+99, x1, y1, x2, y2)
    SliceandAnimatedOverlay(bowserL2, startframe+100, startframe+119, x1, y1, x2, y2)
    SliceandAnimatedOverlay(bowserL1, startframe+120, startframe+139, x1, y1, x2, y2)
    SliceandAnimatedOverlay(bowserL2, startframe+140, startframe+159, x1, y1, x2, y2)
    SliceandAnimatedOverlay(bowserL1, startframe+160, startframe+179, x1, y1, x2, y2)
    return last
}

function FadeIOAudio(clip c, int frames) { return c.AudioDub(c.FadeIO(frames)) }
function FadeInAudio(clip c, int frames) { return c.AudioDub(c.FadeIn(frames)) }
function FadeOutAudio(clip c, int frames) { return c.AudioDub(c.FadeOut(frames)) }

function LoadHDPVR(string path) {
    vid = AVCSource(path)
    aud = NicAC3Source(path + " PID 1100 2_0ch 48KHz 384Kbps DELAY -18ms.ac3")
    vid = AudioDub(vid, aud)
    return vid
}

function LoadFFmpeg59(string path) {
    FFIndex(path)
    a = FFAudioSource(path)
    vid = FFVideoSource(path, threads = 1, fpsnum = 60000, fpsden = 1001)
    vid = vid.AudioDub(a)
    return vid
}

function LoadToV(string path) {
    path = path.StrReplace(".dga", ".mkv")
    FFIndex(path)
    a = FFAudioSource(path)
    vid = FFVideoSource(path, threads = 1, fpsnum = 60000, fpsden = 1001)
    vid = vid.AudioDub(a)
    vid = Crop(vid, 0, 4, -4, 0)
    vid = AddBorders(vid, 2, 2, 2, 2)
    return vid
}

function LoadToVForScreenshots(string path) {
    path = path.StrReplace(".dga", ".mkv")
    FFIndex(path)
    a = FFAudioSource(path)
    vid = FFVideoSource(path, threads = 1, fpsnum = 60000, fpsden = 1001)#.ChangeFPS("ntsc_double")
    vid = vid.AudioDub(a)
    vid = Crop(vid, 0, 4, -4, 0)
    return vid
}
function LoadToVSS(string path) {
    return LoadToVForScreenshots(path)
}


function tovtext(clip c, clip img, int start, int end, int x, int y, bool croptop, bool "fade") {
    img = img.ConvertToRGB32()
    end = start > end ? start : end 
    img = croptop ? img.Crop(0,43,0,0) : img
    img = Defined(fade) && !fade ? img : img.FadeIn(7, color=$FDFFFD).Trim(1, 0)
    p1 = c.Trim(0, start-1)
    p2 = c.Trim(start, end).Layer(img, op="add", level=256, x=x, y=y)
    p3 = c.Trim(end+1, 0)
    return start == 0 ? p2++p3 : p1++p2++p3
}

function SwitchForAWhile(clip c, clip d, int firstframe, int lastframe, int dissolveframes) {
    v1 = c.Trim(0, firstframe+dissolveframes-1)
    v2 = d.Trim(firstframe, lastframe)
    v3 = c.Trim(lastframe-dissolveframes+1, 0)
   
   return Dissolve(v1, v2, v3, dissolveframes)
}
function SwitchViewAt(clip c, clip d, int frame, int dissolveframes) {
    v1 = c.Trim(0, frame+dissolveframes-1)
    v2 = d.Trim(frame, 0)
   
   return Dissolve(v1, v2, dissolveframes)
}
function ReplaceWithPreviousFrame(clip clip, int StartFrame, int AmountOfFrames) {
    start = clip.Trim(0, StartFrame)
    mid = clip.Trim(StartFrame, -1)
    end = clip.Trim(StartFrame + AmountOfFrames + 1, 0)
    mid = mid.Loop(AmountOfFrames, 0, 0)
    
    total = start ++ mid ++ end
    
    return clip.HasAudio ? AudioDub(total, clip) : total
}
function ReplaceWithNextFrame(clip clip, int StartFrame, int AmountOfFrames) {
    start = clip.Trim(0, StartFrame - 1)
    mid = clip.Trim(StartFrame + AmountOfFrames, -1)
    end = clip.Trim(StartFrame + AmountOfFrames, 0)
    mid = mid.Loop(AmountOfFrames, 0, 0)
    
    total = start ++ mid ++ end
    
    return clip.HasAudio ? AudioDub(total, clip) : total
}

function OverdubSection(clip c, clip audio, int firstframe, int lastframe) {
    p1 = c.Trim(0, firstframe-1)
    p2 = c.Trim(firstframe, lastframe).AudioDub(audio)
    p3 = c.Trim(lastframe+1, 0)
    return p1++p2++p3
}

function RemoveFrames(clip c, int firstframe, int lastframe) {
    return c.Trim(0, firstframe-1) ++ c.Trim(lastframe+1, 0)
}

# time to frames
function ttf(clip c, int hours, int minutes, int seconds, int msec) {
    fps = c.framerate()
    frames = hours * fps*60*60 + minutes * fps*60 + seconds * fps + (msec*fps)/1000
    return int(frames)
}

function ShiftUp(clip c, int px, int "color", bool "copy") {
    col = Default(color, $FFFFFF)
    cp = Default(copy, false)
    c2 = cp ? StackVertical(c.Crop(0,px,0,0), c.Crop(0, c.height-px, 0, 0)) : c.Crop(0,px,0,0).AddBorders(0, 0, 0, px, color=col)
    return c2
}
function ShiftUp(clip c, int start, int end, int px) {
    c1 = c.Trim(0, start-1)
    c2 = c.Trim(start, end).Crop(0,px,0,0).AddBorders(0, 0, 0, px, color=$FFFFFF)
    c3 = c.Trim(end+1, 0)
    return c1++c2++c3
}
function ShiftLeft(clip c, int px, int "color", bool "copy") {
    px = (px/2) * 2
    col = Default(color, $0)
    cp = Default(copy, false)
    c2 = cp ? StackHorizontal(c.Crop(px,0,0,0), c.Crop(c.width-px,0,0,0)) : c.Crop(px,0,0,0).AddBorders(0, 0, px, 0, color=col)
    return c2
}
function ShiftLeft(clip c, int start, int end, int px) {
    c1 = c.Trim(0, start-1)
    c2 = c.Trim(start, end).Crop(px,0,0,0).AddBorders(0, 0, px, 0, color=$FFFFFF)
    c3 = c.Trim(end+1, 0)
    return c1++c2++c3
}
function ShiftRight(clip c, int px, int "color", bool "copy") {
    col = Default(color, $FFFFFF)
    cp = Default(copy, false)
    c2 = cp ? StackHorizontal(c.Crop(0, 0, px, 0), c.Crop(0,0,-px,0)) : c.Crop(0,0,-px,0).AddBorders(px, 0, 0, 0, color=col)
    return c2
}
function ShiftRight(clip c, int start, int end, int px) {
    c1 = c.Trim(0, start-1)
    c2 = c.Trim(start, end).Crop(0,0,-px,0).AddBorders(px, 0, 0, 0, color=$FFFFFF)
    c3 = c.Trim(end+1, 0)
    return c1++c2++c3
}
function ShiftDown(clip c, int px, bool "copy") {
    cp = Default(copy, false)
    c2 = cp ? StackVertical(c.Crop(0, 0, 0, px), c.Crop(0,0,0,-px)) : c.Crop(0,0,0,-px).AddBorders(0, px, 0, 0, color=$FFFFFF)
    return c2
}
function ShiftDown(clip c, int start, int end, int px) {
    c1 = c.Trim(0, start-1)
    c2 = c.Trim(start, end).Crop(0,0,0,-px).AddBorders(0, px, 0, 0, color=$FFFFFF)
    c3 = c.Trim(end+1, 0)
    return c1++c2++c3
}

function MatchVideoToAudio(clip v) {
    return MatchVideoToAudio(v, v)
}
function MatchVideoToAudio(clip video, clip audio) {
    samplerate = AudioRate(audio)
    samples = AudioLength(audio)
    seconds = samples/float(samplerate)
    return video.StretchTo(int(seconds * video.framerate))
}

function StretchTo(clip c, int number_of_frames) {
    ratio = float(number_of_frames) / float(c.FrameCount)
    return c.ChangeFPS(c.FrameRate * ratio).AssumeFPS(c.FrameRate)
}
function breakVideo(clip c) {
    topleft = c.Crop(0, 0, -c.width/2, -c.height/2)
    topright = c.Crop(c.width/2, 0, -c.width/2, -c.height/2)
    bottomleft = c.Crop(0, c.height/2, -c.width/2, -c.height/2)
    bottomright = c.Crop(c.width/2, c.height/2, -c.width/2, -c.height/2)
    
    return StackHorizontal(bottomright, bottomleft).StackVertical( StackHorizontal(topright, topleft) )
}
function BlankCrop(clip c, int firstframe, int lastframe, int x, int y, int w, int h, int "color") {
    color = Default(color, $FFFFFF)
    w = w < 0 ? c.width - (x-w) : w 
    h = h < 0 ? c.height - (y-h) : h
        
    l = c.Crop(0, 0, x, 0)
    m = c.Crop(x, 0, w, 0)
    r = c.Crop(x + w, 0, 0, 0)
    
    t = m.Crop(0, 0, 0, y)
    b = m.Crop(0, y + h, 0, 0)
    m = m.Crop(0, y, 0, h).BlankClip(color=color)
    
    vertstack = StackVertical(t, m, b)
    cmod = StackHorizontal(l, vertstack, r)
    c = c.Trim(0, firstframe-1) ++ cmod.Trim(firstframe, lastframe) ++ c.Trim(lastframe+1, 0)
    return c
}

function ClipCrop(clip c, int firstframe, int lastframe, int x, int y, clip other) {
    color = $FFFFFF
    w = other.width
    h = other.height
    w = w < 0 ? c.width - (x-w) : w 
    h = h < 0 ? c.height - (y-h) : h
        
    l = c.Crop(0, 0, x, 0)
    m = c.Crop(x, 0, w, 0)
    r = c.Crop(x + w, 0, 0, 0)
    
    t = m.Crop(0, 0, 0, y)
    b = m.Crop(0, y + h, 0, 0)
    m = m.Crop(0, y, 0, h).BlankClip(color=color)
    m = other
    
    vertstack = StackVertical(t, m, b)
    cmod = StackHorizontal(l, vertstack, r)
    c = (c.Trim(0, firstframe-1) ++ cmod.Trim(firstframe, lastframe) ++ c.Trim(lastframe+1, 0)).AudioDub(c)
    #
    return c
}


function StrReplace(string s, string find, string replace) {
        i = s.FindStr(find)
        return (i == 0 ? s : s.LeftStr(i-1)+replace+s.RightStr(StrLen(s)-Strlen(find)-i+1).StrReplace(find, replace))
}

function SyncToPoints( clip c, int vsync1, int vsync2, int async1, int async2 ) {
	vdiff = vsync2 - vsync1
	adiff = async2 - async1
	ratio = float(adiff) / float(vdiff)
	c = c.ChangeFPS(c.FrameRate * ratio).AssumeFPS( c )
	
	vsync1adj = float(vsync1) * ratio # the new location of vsync1
	
	# if ( vsync1adj < async1 ) mash a blankclip in front of the clip to match the audio sync point
	padding = c.BlankClip().Trim(0, -1).Loop( async1 - int(vsync1adj) )
	# else delay audio to match the video sync point
	apadding = ( vsync1adj - float( async1 ) ) / c.FrameRate
	c = vsync1adj < async1 ? (padding ++ c).AudioDub( c ) : c.DelayAudio( apadding )
	
	return c
}


function SubtitleLetterByLetter( clip c, string text, int firstFrame, int lastFrame ) {
text = "This is a text that appears on screen letter by letter"
letterNum = strlen(text)

return c.Animate(firstFrame, lastFrame, "progressiveText",
                                                \ text, 0, 
                                                \ text, letterNum)
}
function progressiveText(clip c, string text, int letterNum)
{
    return c.Subtitle(leftstr(text, letterNum))
}




function BatmanDissolve(clip a, clip b, clip image, int frames, float "speed") {
    speed = Default(speed, 200.0)
    c = a ++ b
    startframe = a.framecount - frames
    endframe = a.framecount + frames
    mod = c
    
    # animate the rotation in the background
    mod = Animate(mod, startframe, endframe, "BatmanDissolveRotationHelper", \
                           speed, 0, \
                           speed, frames)

    # blur the video
    mod = mod.TemporalSoften(10,255,255,0,2)
    
    # figure out required scaling values
    wscalemax = float(c.width) / float(image.width)
    hscalemax = float(c.height) / float(image.height)
    scalemax = wscalemax > hscalemax ? wscalemax : hscalemax
    
    # scale the image over the rotating background
    mod1 = Animate(mod, startframe, a.framecount-1, "BatmanDissolveOverlayHelper", \
                           image, 0.0, image, scalemax)
    mod2 = Animate(mod, a.framecount, endframe, "BatmanDissolveOverlayHelper", \
                           image, scalemax, image, 0.0)
                           
    # put everything together
    return (c.Trim(0, startframe - 1) ++ mod1.Trim(startframe, a.framecount - 1) ++ mod2.Trim(a.framecount, endframe) ++ c.Trim(endframe + 1, 0)).AudioDub(c)
}
function BatmanDissolveRotationHelper(clip c, float speed, int current_frame) {
    return c.Rotate(speed * current_frame)
}
function BatmanDissolveOverlayHelper(clip c, clip img, float current_scale) {
    w = int(current_scale * img.width)
    h = int(current_scale * img.height)
    w = w < 8 ? 8 : w
    h = h < 8 ? 8 : h
    return c.OverlayExactMid(img.Spline36Resize(w, h))
}
function OverlayExactMid(clip c, clip img) {
    x = (c.width - img.width) / 2
    y = (c.height - img.height) / 2
    return c.Overlay(img, x=x, y=y, mask=img.ShowAlpha)
}
function AlignInt(int Number, int Alignment) {
    diff = Number % Alignment
    return diff == 0 ? Number : ( Number + ( Alignment - diff ) )
}