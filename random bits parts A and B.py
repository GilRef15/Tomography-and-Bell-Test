import numpy as np

# Function to generate random bits with 50% probability for 0 and 1
def generate_random_bits(size):
    return np.random.choice([0, 1], size=size)

# Generate arrays of sizes 10, 25, and 50
array_10 = generate_random_bits(10)
array_25 = generate_random_bits(25)
array_50 = generate_random_bits(50)

# Print the arrays
print("Array of size 10:", array_10)
print("Array of size 25:", array_25)
print("Array of size 50:", array_50)