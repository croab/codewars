function duplicateEncode(word: string){
  const wordLower: string = word.toLowerCase();
  interface Letters {
    [key: string]: number
  }
  let newWord: Array<string> = [];
  let letters: Letters = {};
  for (let i = 0; i < wordLower.length; i++) {
    letters[wordLower.charAt(i)] ? letters[wordLower.charAt(i)] += 1 : letters[wordLower.charAt(i)] = 1;
  }
  for (let i = 0; i < wordLower.length; i++) {
    letters[wordLower.charAt(i)] > 1 ? newWord[i] = ')' : newWord[i] = '(';
  }
  return newWord.join('');
  // return letters;
}

console.log(duplicateEncode('Hello there'));