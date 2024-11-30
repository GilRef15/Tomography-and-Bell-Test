import numpy as np

# Function to generate random bits with 50% probability for 0 and 1
def generate_random_bits(size):
    return np.random.choice([0, 1], size=size)


array_20 = generate_random_bits(20)


# Print the arrays
print("Array of size 10:", array_20)
