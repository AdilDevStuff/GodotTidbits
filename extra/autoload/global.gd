extends Node

signal SumCalculated(total: int)

var total: int = 0

func sum(a: int, b: int) -> int:
	total = a + b
	SumCalculated.emit(total)
	return total
