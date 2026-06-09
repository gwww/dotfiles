function caffeine() {
  const type = "display"
  const awake = hs.power.isSleepPrevented(type)
  if (awake) {
    hs.power.allowSleep(type)
    alert("Sleepy")
  } else {
    hs.power.preventSleep(type)
    alert("Staying AWAKE!")
  }
}
