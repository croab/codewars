function even_or_odd(n: number): string {
  return (n % 2) === 0 ? 'Even' : 'Odd';
}

console.log(even_or_odd(5));
// Should return 'odd'
console.log(even_or_odd(4));
// Should return 'even'