extends Object

class_name cons

const INPUT_LEFT = 1    #  0001
const INPUT_RIGHT = 2   #  0010
const INPUT_UP = 4      #  0100
const INPUT_DOWN = 8    #  1000

const INPUT_CLONE = 16  # 10000

const INPUT_NONE = 0    # 00000 kind of redundant but may improve readability
const INPUT_ANY = 31    # 11111 kind of redundant but may improve readability
const INPUT_ORTH = 15   # 01111
const INPUT_SIDE = 3    #  0011
const INPUT_PRESS = 20  # 10100 for masking inputs that only activate on press
const INPUT_HOLD = 11   # 01011 for masking inputs that only activate on press
