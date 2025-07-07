import logging
import mathops 

def setup_logging():
    """Set up logging configuration."""
    logging.basicConfig(
        level=logging.DEBUG,
        format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
        handlers=[
            logging.FileHandler("app.log"),
            logging.StreamHandler()
        ]
    )
"""This part setups the logging configuration to log messages to both a file and the console. Also displays the time, logger name, and log level in each message."""
setup_logging()
logging.debug("Debugging information")
logging.info("Informational message")
logging.warning("Warning: Something might be wrong")
logging.error("Error: Something went wrong")
logging.critical("Critical error: Immediate attention needed")

"""Error handling example with math operations"""
x = input("Enter first number: ")
y = input("Enter second number: ")
try:
    mathops.divide(x, y)
except ZeroDivisionError as e:
    logging.error("Attempted to divide by zero: %s", e)
except Exception as e:
    logging.error("An unexpected error occurred: %s", e)
else:
    logging.info("Division successful: %s / %s = %s", x, y, result)



input("was the error handled? (yes/no): ")