function dirReduc(arr) {
  const opposite = {
    "north": "south",
    "south": "north",
    "west": "east",
    "east": "west"
  }
  let noChange = false;
  let directions = arr;
  while (noChange === false) {
    const beforeLength = directions.length;
    for (let i = 1; i < directions.length; i++) {
      if (opposite[directions[i].toLowerCase()] === directions[i - 1].toLowerCase()) {
        directions.splice(i - 1, 2);
      }
    }
    const afterLength = directions.length;
    if (beforeLength === afterLength) { noChange = true };
  }
  return directions;
}
console.log(dirReduc(["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]));
