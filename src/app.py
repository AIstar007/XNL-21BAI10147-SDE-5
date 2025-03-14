from flask import Flask, jsonify

# Ensure necessary imports are at the top
import some_module

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({"message": "Welcome to Fintech App!"})

@app.route('/health')
def health_check():
    return jsonify({"status": "healthy"}), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

