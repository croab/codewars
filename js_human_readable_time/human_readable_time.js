function humanReadable(seconds) {
  const hours = Math.floor(seconds / (60 * 60)).toString();
  const minutes = Math.floor((seconds % (60 * 60)) / 60).toString();
  const secs = (seconds % 60).toString();
  let time = [hours, minutes, secs];
  time.forEach((value, index) => {
    if (value.length < 2) { time[index] = "0" + value }
  });
  return time.join(":");
}

console.log(humanReadable(16485));