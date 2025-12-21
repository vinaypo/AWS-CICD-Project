from flask import Flask, jsonify, request

def create_app() -> Flask:
    app = Flask(__name__)

    @app.route("/")
    def home():
        """Home page with instructions."""
        html = """
        <h1>Hello, world! 👋</h1>
        <p>Add your name to the URL like this:</p>
        <pre>/your-name</pre>
        <p>Check health status at <a href="/health">/health</a></p>
        """
        return html

    @app.route("/<string:name>")
    def greet(name: str):
        """Greet a user by name with a friendly message."""
        clean_name = name.strip().capitalize()
        html = f"""
        <h1>Hello, {clean_name}! 😊</h1>
        <p>Welcome to our Flask app!</p>
        <a href="/">Go back home</a>
        """
        return html

    @app.route("/health")
    def health():
        """Simple health check endpoint."""
        return jsonify(status="ok"), 200

    return app


if __name__ == "__main__":
    app = create_app()
    app.run(host="0.0.0.0", port=5000) # nosec: B104
