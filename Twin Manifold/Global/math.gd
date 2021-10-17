extends Object

class_name math


static func weightedSum(a, wa, b, wb):
	return a * wa + b * wb


# https://www.desmos.com/calculator/ke8ha82yih
# thank you wolfram alpha
static func approach_exp(value, start, end, rate):
	return (start - end) * pow(rate, value) + end
