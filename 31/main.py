import time

def timer(func):
    def wrapper(*args, **kwargs):
        start = time.time()
        result = func(*args, **kwargs)
        end = time.time()
        print(f"Function '{func.__name__}' executed in {end - start:.4f} seconds")
        return result
    return wrapper

@timer
def example_function(n):
    total = 0
    for i in range(n):
        total += i
    return total

@timer
def slow_function():
    time.sleep(2)
    return "Finished"

slow_function()
result = example_function(1000000)
print(f"Result of example_function: {result}")

slow = slow_function()

print(f"Result of slow_function: {slow}")
