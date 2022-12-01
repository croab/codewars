import { workerData } from "worker_threads";

function duplicateEncode(word: string){
  const wordLower: string = word.toLowerCase();
  interface Letters {
    [key: string]: number
  }
  let newWord: string = "";
  let letters: Letters = {};
  for (let i = 0; i < wordLower.length; i++) {
    letters[wordLower.charAt(i)] ? letters[wordLower.charAt(i)] += 1 : letters[wordLower.charAt(i)] = 1;
    letters[wordLower.charAt(i)] > 1 ? newWord.charAt(i) = '(' : newWord.charAt(i) = ')';
  }
  return letters;
}

console.log(duplicateEncode('Hello there'));