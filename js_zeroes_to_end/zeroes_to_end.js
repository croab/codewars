function moveZeros(arr) {
  without_zeroes = arr.filter(value => value !== 0);
  console.log(without_zeroes);
  zeroes = arr.filter(value => value === 0);
  console.log(zeroes);

  combined = without_zeroes.concat(zeroes);
  console.log(combined);

  return combined;
}

console.log(moveZeros([false,1,0,1,2,0,1,3,"a"]));