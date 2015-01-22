import urllib
import urllib2
import os
import json
import sys

def write_urls(outfile, m3u8, dta=False):
    outfile.write('<html><head></head><body>')
    for i, line in enumerate(m3u8):
        if line.strip() != '' and not line.startswith('#'):
            outfile.write('<a href="')
            outfile.write(baseUrl)
            outfile.write('/')
            outfile.write(line)
            outfile.write('">')
            if dta:
                outfile.write(str(i))
            else:
                outfile.write(baseUrl)
                outfile.write('/')
                outfile.write(line)
            outfile.write('</a>')
            if not dta:
                outfile.write('<br>')
            outfile.write('\n')
    outfile.write('</body></html>')
    return

def write_ffmpeg_concat(outfile, m3u8, dta=False):
    for i, line in enumerate(m3u8):
        if line.strip() != '' and not line.startswith('#'):
            outfile.write("file '")
            if dta:
                splitline = line.split('.')
                outfile.write('.'.join(splitline[:len(splitline)-1]))
                outfile.write('_')
                outfile.write(str(i))
                outfile.write('.')
                outfile.write(splitline[len(splitline)-1])
            else:
                outfile.write(line)
            outfile.write("'\n")
    return

def filecount(m3u8):
    count = 0
    for i, line in enumerate(m3u8):
        if line.strip() != '' and not line.startswith('#'):
            count += 1
    return count

def write_cleanup(outfile, m3u8, media_id):
    outfile.write('@echo off\n')
    for i, line in enumerate(m3u8):
        if line.strip() != '' and not line.startswith('#'):
            outfile.write('del "')
            splitline = line.split('.')
            outfile.write('.'.join(splitline[:len(splitline)-1]))
            outfile.write('_')
            outfile.write(str(i))
            outfile.write('.')
            outfile.write(splitline[len(splitline)-1])
            outfile.write('"\n')
            
            outfile.write('del "')
            outfile.write(line)
            outfile.write('"\n')
            
    outfile.write('del video_ffmpeg_' + str(media_id) + '.bat\n')
    outfile.write('del video_ffmpeg_' + str(media_id) + '_dta.bat\n')
    outfile.write('del video_urls_' + str(media_id) + '.html\n')
    outfile.write('del video_urls_' + str(media_id) + '_dta.html\n')
    outfile.write('del video_ffmpeg_' + str(media_id) + '.txt\n')
    outfile.write('del video_ffmpeg_' + str(media_id) + '_dta.txt\n')
    outfile.write('del video_' + str(media_id) + '.m3u8\n')
    outfile.write('del video_cleanup_' + str(media_id) + '.bat\n')
    return
    
def clean_m3u8( m3u8 ):
    cleaned = []
    for i, line in enumerate( m3u8 ):
        if line.strip() != '' and not line.startswith('#'):
            # Turns out that Twitch doesn't accept requests without the ? parameters, oh well.
            #if '?' in line:
            #    line = line[:line.index('?')]
            #if line in cleaned:
            #    continue
            cleaned.append( line )
    
    return cleaned

# most certainly not the best way but they seem to list the source quality as the first one so
def get_best_quality_m3u8_from_m3u( m3u ):
    cleaned = []
    for i, line in enumerate( m3u ):
        if line.strip() != '' and not line.startswith('#'):
            cleaned.append( line )
    return cleaned[0]
    
if len(sys.argv) < 2:
    print 'Usage: ' + sys.argv[0] + ' media_id'
    print 'media_id is the number in the video URL, http://www.twitch.tv/[username]/v/[media_id]'
    exit()

media_id = int(sys.argv[1])

url = 'https://api.twitch.tv/api/videos/v' + str(media_id)
print url
request = urllib2.Request(url)
result = urllib2.urlopen(request)
data = result.read()
video = json.loads(data)

#with open('data.txt', 'w') as outfile:
#    outfile.write(json.dumps(video, sort_keys=True, indent=4, separators=(', ', ': ')))

username = video['channel']

url = 'https://api.twitch.tv/api/vods/' + str(media_id) + '/access_token'
request = urllib2.Request(url)
result = urllib2.urlopen(request)
data = result.read()
tokendata = json.loads(data)

token = tokendata['token']
tokensig = tokendata['sig']

print 'user:         ' + username
print 'video length: ' + str(video['duration'])
#print 'access token: ' + token
#print 'token sig:    ' + tokensig
print ''

m3uurl = 'http://usher.twitch.tv/vod/' + str(media_id) + '?' + urllib.urlencode( { 'nauthsig' : tokensig, 'nauth' : token } )

request = urllib2.Request(m3uurl)
result = urllib2.urlopen(request)
data = result.read()

m3u8url = get_best_quality_m3u8_from_m3u( data.split('\n') )
print m3u8url
request = urllib2.Request(m3u8url)
result = urllib2.urlopen(request)
m3u8full = result.read()
with open('twitch_' + username + '_' + str(media_id) + '.m3u8', 'w') as outfile:
    outfile.write(m3u8full)
m3u8 = m3u8full.split('\n')
m3u8 = clean_m3u8(m3u8)

baseUrl = m3u8url[:m3u8url.rindex('/')]

# output website with links
outhtml = 'twitch_' + username + '_' + str(media_id) + '.html'
with open(outhtml, 'w') as outfile:
    write_urls(outfile, m3u8)
    
print ''
print 'split file, urls in ' + outhtml
print str(filecount(m3u8)) + ' files'
print ''
print 'combine ts files with:'
print 'copy /b *.ts ' + str(media_id) + '.ts'
print ''
print 'convert to mp4 with:'
print 'ffmpeg -i ' + str(media_id) + '.ts -codec copy -bsf:a aac_adtstoasc twitch_' + username + '_' + str(media_id) + '.mp4'
print ''

#print 'clean up this mess with video_cleanup_' + str(media_id) + '.bat'
#with open('video_cleanup_' + str(media_id) + '.bat', 'w') as outfile:
#    write_cleanup(outfile, m3u8, media_id)
    

