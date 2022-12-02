function findEvenIndex(arr: number[]): number {
  for (let i = 0; i < arr.length; i++) {
    const leftSide: number = arr.slice(0, i).reduce((a,b) => a + b, 0);
    const rightSide: number = arr.slice(i + 1, arr.length).reduce((a,b) => a + b, 0);
    if (leftSide === rightSide) return i;
  }
  return -1;
}

console.log(findEvenIndex([1, 2, 3, 4, 3, 2, 1]));