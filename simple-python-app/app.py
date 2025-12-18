from flask import Flask

def create_app():
    app = Flask(__name__)

    @app.route("/")
    def home():
        return (
            "Hello, world! 👋<br>"
            "Add your name to the URL like this:<br>"
            "<b>/your-name</b>"
        )

    @app.route("/<string:name>")
    def greet(name):
        return f"Hello, world! This is <b>{name.capitalize()}</b> 😊"
    
    @app.route("/health")
    def health():
        return {"status": "ok"}, 200

    return app

if __name__ == "__main__":
    app = create_app()
    app.run(host="0.0.0.0", port=5000)  # nosec: B104
