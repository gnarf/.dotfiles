gup() {
  cd ~/Projects/gaia/
  make clean
  DEBUG=1 make
  make test-agent-server &
  gaia-test &
}

gupl() {
  cd ~/Projects/gaia/
  make clean
  DEBUG=1 make
  make test-agent-server &
  gaia-test-latest &
}


gaia-test-latest() {
  /Applications/FirefoxNightly.app/Contents/MacOS/firefox -marionette -profile /Users/gnarf/Projects/gaia/profile-debug http://test-agent.gaiamobile.org:8080 > /dev/null 2>&1
}
gaia-test() {
  /Applications/FirefoxNightly\ 18.app/Contents/MacOS/firefox -marionette -profile /Users/gnarf/Projects/gaia/profile-debug http://test-agent.gaiamobile.org:8080 > /dev/null 2>&1
}
gaia-b2g() {
  /Applications/B2G.app/Contents/MacOS/b2g-bin -marionette -profile /Users/gnarf/Projects/gaia/profile-debug --jsconsole
}
gaia-unit() {
  gjslint --disable 210,217,220,225 `find apps/$1 -name *.js` ; make test-agent-test APP=$1
}
adb-console() {
  adb shell logcat | grep GeckoConsole
}

gpt() {
  export GAIATEST_ACKNOWLEDGED_RISKS=true
  export GAIATEST_SKIP_WARNING=true

  root=tests/python/gaia-ui-tests/gaiatest
  b2g=`find b2g -follow -name "b2g-bin" | tail -n 1`
  profile=${PROFILE:-profile}
  gaiatest="python $root/cli.py"
  tests=${1:-$root/tests/manifest.ini}
  if [ ! -e $tests ]
    then
    tests=$(find tests/python/gaia-ui-tests/gaiatest/tests/ -name "*$1*" \( -type d -o -name "*.py" \))
  fi
  shift

  $gaiatest $@ --app=b2gdesktop \
            --binary=$b2g \
            --profile=$profile \
            --type=b2g \
            --restart \
            $tests

}


adb-screen() {
  adb shell /system/bin/screencap -p /sdcard/screenshot.png  && \
  adb pull /sdcard/screenshot.png ~/Desktop/devicescreenshot.png && \
  open ~/Desktop/devicescreenshot.png
}
