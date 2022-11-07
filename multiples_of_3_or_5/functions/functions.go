package functions

import "math"

func Multiple3And5(number int) int {
	sumTotal := sumMultiplesOf(number, 3) + sumMultiplesOf(number, 5)
	return sumTotal
}

func sumMultiplesOf(number, value int) int {
	numberOfmultiples := int(number / value)
	var sum int
	for i := 0; i < numberOfmultiples; i++ {
		sum += int(math.Pow(float64(value), float64(i)))
	}
	return sum
}
