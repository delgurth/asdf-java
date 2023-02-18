#!/usr/bin/env xonsh

def asdf_update_java_home() -> None:
    import xonsh.platform
    import sys
    import unicodedata
    $asdf_path=$(which asdf).rstrip('\n')
    print('asdf path {}'.format($asdf_path), file=sys.stderr)
    $asdf_path=$(asdf list java).rstrip('\n')
    print('asdf list java  {}'.format($asdf_path), file=sys.stderr)
    print('----', file=sys.stderr)
    $java_path=$(asdf which java).rstrip()
    print('before java path {} after java path'.format($java_path), file=sys.stderr)
    print('----', file=sys.stderr)
    $java_path=$(asdf which java).rstrip().lstrip()
    print('before java path {} after java path 2'.format($java_path), file=sys.stderr)
    $java_path=''.join(c for c in $java_path if unicodedata.category(c)[0] != 'C')
    print('before java path {} after java path 3'.format($java_path), file=sys.stderr)
    if len($java_path) > 0:
        if xonsh.platform.ON_DARWIN:
            print('on darwin')
            if $java_path == '/usr/bin/java':
                $JAVA_HOME=$(/usr/libexec/java_home).rstrip('\n')
                print('Tried to set java home with system java {}'.format($java_path), file=sys.stderr)
            else:
                $JAVA_HOME=$(dirname $(dirname $(realpath $java_path))).rstrip('\n')
                print('Tried to set java home with normal java {}'.format($java_path), file=sys.stderr)
        else:
            print('not on darwin')
            $JAVA_HOME=$(dirname $(dirname $(realpath $java_path))).rstrip('\n')
    del $java_path

@events.on_chdir
def update_java_home_on_chdir(olddir, newdir, **kw) -> None:
    asdf_update_java_home()

@events.on_post_init
def update_java_home_on_post_init() -> None:
    asdf_update_java_home()