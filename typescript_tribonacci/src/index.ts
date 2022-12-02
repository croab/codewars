function tribonacci([a, b, c]: [number, number, number], n: number): number[] {
  const finalArray: number[] = [a, b, c];
  if (finalArray.length >= n) return finalArray.slice(0, n);
  while (finalArray.length < n) {
    let currentItemIndex: number = finalArray.length - 1;
    const nextItem: number = finalArray
      .slice(currentItemIndex - 2, currentItemIndex + 1)
      .reduce((a, b) => a + b, 0);
    finalArray.push(nextItem);
  }
  return finalArray;
}
console.log(tribonacci([1, 1, 1], 0));

// console.log(tribonacci([1, 1, 1], 10));
// [1, 1, 1, 3, 5, 9, 17, 31, 57, 105]