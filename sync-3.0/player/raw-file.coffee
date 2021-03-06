codecToMimeType = (codec) ->
    switch codec
        when 'mov/h264', 'mov/av1' then 'video/mp4'
        when 'flv/h264' then 'video/flv'
        when 'matroska/vp8', 'matroska/vp9', 'matroska/av1' then 'video/webm'
        when 'ogg/theora' then 'video/ogg'
        when 'mp3' then 'audio/mp3'
        when 'vorbis' then 'audio/ogg'
        when 'aac' then 'audio/aac'
        when 'opus' then 'audio/opus'
        else 'video/flv'

window.FilePlayer = class FilePlayer extends VideoJSPlayer
    constructor: (data) ->
        if not (this instanceof FilePlayer)
            return new FilePlayer(data)

        data.meta.direct =
            480: [{
                contentType: codecToMimeType(data.meta.codec)
                link: data.id
            }]
        super(data)

    load: (data) ->
        data.meta.direct =
            480: [{
                contentType: codecToMimeType(data.meta.codec)
                link: data.id
            }]
        super(data)
