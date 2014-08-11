import urllib2
import os
import json
import sys


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

print video['video'][0]['media_user_name'] + ' playing ' + video['video'][0]['category_name']
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
        outfile.write('<html><head></head><body>')
        for line in m3u8:
            if not line.startswith('#'):
                outfile.write('<a href="')
                outfile.write(baseUrl)
                outfile.write('/')
                outfile.write(line)
                outfile.write('">')
                outfile.write(baseUrl)
                outfile.write('/')
                outfile.write(line)
                outfile.write('</a><br>\n')
        outfile.write('</body></html>')
        
    # output combine file for ffmpeg
    with open('video_ffmpeg_' + str(media_id) + '.txt', 'w') as outfile:
        for line in m3u8:
            if not line.startswith('#'):
                outfile.write("file '")
                outfile.write(line)
                outfile.write("'\n")
    
    print 'split file, urls in video_urls_' + str(media_id) + '.html'
    print 'combine with:'
    print 'ffmpeg -f concat -i video_ffmpeg_' + str(media_id) + '.txt -c copy video_combined_' + str(media_id) + '.mkv'
    
else:
    url = 'http://edge.vie.hitbox.tv/static/videos/recordings/' + filename
    print url
