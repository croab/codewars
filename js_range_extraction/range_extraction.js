function solution(list){
  let nums = list.reduce(function (nums, currentNum) {
    let firstNumInRange = null;
    let previousNum = null;
    if (nums.length > 0 && nums[nums.length - 1].includes("€")) {
      firstNumInRange = nums[nums.length - 1].split("€")[0];
      previousNum = nums[nums.length - 1].split("€")[1];
    } else {
      firstNumInRange = nums[nums.length - 1]
      previousNum = nums[nums.length - 1];
    }
    if (previousNum === (currentNum - 1).toString()) {
      nums.pop();
      nums.push(`${firstNumInRange}€${currentNum}`);
    } else {
      nums.push(`${currentNum}`);
    }
    return nums;
  }, []);
  nums = nums.map((elem => elem.replace("€", "-")));
  return nums.join(",");
}

console.log(solution([-10, -9, -8, -6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]));