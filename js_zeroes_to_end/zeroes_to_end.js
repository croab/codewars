function moveZeros(arr) {
  arr.forEach((value, index) => {
    if (parseInt(value, 10) === 0) {
    // if (value === 0) {
      arr.splice(index, 1)
      arr.push(value);
    }
  });
  return arr;
}

console.log(moveZeros([ 1, [], [], [], 4, '9', {}, {}, [], 1, '0' ]));