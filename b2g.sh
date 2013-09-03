export PATH=/Applications/B2G.app/Contents/MacOS/:$PATH

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
  /Applications/FirefoxNightly.app/Contents/MacOS/firefox -profile /Users/gnarf/Projects/gaia/profile-debug http://test-agent.gaiamobile.org:8080 > /dev/null 2>&1
}
gaia-test() {
  /Applications/FirefoxNightly\ 18.app/Contents/MacOS/firefox -profile /Users/gnarf/Projects/gaia/profile-debug http://test-agent.gaiamobile.org:8080 > /dev/null 2>&1
}
gaia-b2g() {
  /Applications/B2G.app/Contents/MacOS/b2g-bin -profile /Users/gnarf/Projects/gaia/profile-debug --jsconsole
}
gaia-unit() {
  gjslint --disable 210,217,220,225 `find apps/$1 -name *.js` ; make test-agent-test APP=$1
}
adb-console() {
  adb shell logcat | grep GeckoConsole
}

adb-screen() {
  adb shell /system/bin/screencap -p /sdcard/screenshot.png  && \
  adb pull /sdcard/screenshot.png ~/Desktop/devicescreenshot.png && \
  open ~/Desktop/devicescreenshot.png
}
