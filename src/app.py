from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({"message": "Welcome to Fintech App!"})

@app.route('/health')
def health_check():
    return jsonify({"status": "healthy"}), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
    
import some_module  # Ensure necessary imports are at the top


def function_one():
    pass  # Correct function definition syntax


# Add two blank lines before the next function
  

def function_two():
    pass


# Add two blank lines before the next function
  

def function_three():
    pass


# Add two blank lines at the end of the file
