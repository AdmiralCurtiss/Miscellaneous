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
    return
    
if len(sys.argv) < 2:
    print 'Usage: ' + sys.argv[0] + ' media_id'
    print 'media_id is the number in the video URL, www.hitbox.tv/video/[media_id]'
    exit()

media_id = int(sys.argv[1])

url = 'http://api.hitbox.tv/media/video/' + str(media_id);
print url
request = urllib2.Request(url)
result = urllib2.urlopen(request)
data = result.read()
video = json.loads(data)

#with open('data.txt', 'w') as outfile:
#    outfile.write(json.dumps(video, sort_keys=True, indent=4, separators=(', ', ': ')))

profiles = json.loads(video['video'][0]['media_profiles'])
filename = profiles[0]['url']
username = video['video'][0]['media_user_name']

print username + ' playing ' + video['video'][0]['category_name']
print video['video'][0]['media_title']
print 'Date/Time: ' + video['video'][0]['media_date_added']
print 'Length:    ' + video['video'][0]['media_duration_format']

if filename.endswith('m3u8'):
    # for some reason some files are stored as a giant collection of *.ts files, fun
    m3u8url = 'http://edge.bf.hitbox.tv/static/videos/vods' + filename
    request = urllib2.Request(m3u8url)
    result = urllib2.urlopen(request)
    m3u8 = result.read().split('\n')
    
    baseUrl = m3u8url[:m3u8url.rindex('/')]
    
    # output website with links
    with open('video_urls_' + str(media_id) + '.html', 'w') as outfile:
        write_urls(outfile, m3u8)
    with open('video_urls_' + str(media_id) + '_dta.html', 'w') as outfile:
        write_urls(outfile, m3u8, dta=True)
        
    # output combine file for ffmpeg
    with open('video_ffmpeg_' + str(media_id) + '.txt', 'w') as outfile:
        write_ffmpeg_concat(outfile, m3u8)
    with open('video_ffmpeg_' + str(media_id) + '_dta.txt', 'w') as outfile:
        write_ffmpeg_concat(outfile, m3u8, dta=True)
    
    print 'split file, urls in video_urls_' + str(media_id) + '.html'
    print 'combine with video_ffmpeg_' + str(media_id) + '.bat'
    with open('video_ffmpeg_' + str(media_id) + '.bat', 'w') as outfile:
        outfile.write('ffmpeg -f concat -i video_ffmpeg_' + str(media_id) + '.txt -c copy video_' + username + '_' + str(media_id) + '.mkv')
    with open('video_ffmpeg_' + str(media_id) + '_dta.bat', 'w') as outfile:
        outfile.write('ffmpeg -f concat -i video_ffmpeg_' + str(media_id) + '_dta.txt -c copy video_' + username + '_' + str(media_id) + '.mkv')
    
    print 'clean up this mess with video_cleanup_' + str(media_id) + '.bat'
    with open('video_cleanup_' + str(media_id) + '.bat', 'w') as outfile:
        write_cleanup(outfile, m3u8, media_id)
    
else:
    url = 'http://edge.vie.hitbox.tv/static/videos/recordings/' + filename
    print url
