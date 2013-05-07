export PATH=/Applications/B2G.app/Contents/MacOS/:$PATH
gaia-test() {
  /Applications/FirefoxNightly.app/Contents/MacOS/firefox -profile /Users/gnarf/Projects/gaia/profile http://test-agent.gaiamobile.org:8080 > /dev/null 2>&1
}
gaia-b2g() {
  /Applications/B2G.app/Contents/MacOS/b2g-bin -profile /Users/gnarf/Projects/gaia/profile http://test-agent.gaiamobile.org:8080
}
gaia-unit() {
  gjslint --nojsdoc `find apps/$1 -name *.js` ; make test-agent-test APP=$1
}
adb-console() {
  adb shell logcat | grep GeckoConsole
}

adb-screen() {
  adb shell /system/bin/screencap -p /sdcard/screenshot.png  && \
  adb pull /sdcard/screenshot.png ~/Desktop/devicescreenshot.png && \
  open ~/Desktop/devicescreenshot.png
}
