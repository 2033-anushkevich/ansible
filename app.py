import os
from flask import Flask, render_template, send_from_directory, abort

app = Flask(__name__)
IMAGES_DIR = "/app/images"
port = int(os.environ.get('PORT', 5000))

@app.route("/")
def root():
    return "Start server-static"

@app.route("/images")
def list_images():
    try:
        files = [f for f in os.listdir(IMAGES_DIR) if os.path.isfile(os.path.join(IMAGES_DIR, f))]
        return render_template('index.html', files=files)
    except FileNotFoundError:
        return "Images directory not found.", 500

@app.route("/images/<filename>")
def show_image(filename):
    if not filename.endswith('.svg') or '..' in filename:
        abort(400, description='Invalid filename')
    filepath = os.path.join(IMAGES_DIR, filename)
    if not os.path.isfile(filepath):
        abort(404)
    return send_from_directory(IMAGES_DIR, filename)


if __name__ == "__main__":
    app.run(debug=False, port=port)
