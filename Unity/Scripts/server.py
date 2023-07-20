
from flask import Flask, request, jsonify
import base64

app = Flask(__name__)


@app.route("/")
def hello():
    print("photo maybe")
    return "Hello World!"


@app.route('/check')
def see_image():
    return "see image"




@app.route('/image', methods=['POST'])
def receive_image():
    if 'image' not in request.files:
        return 'No image uploaded.', 400

    image_file = request.files['image']
    image_data = image_file.read()

    # Decode the image data from base64 encoding
    image_data = base64.b64decode(image_data)

    return 'Image received.', 200




users = {"richard": "Richard Lee",
         "john": "John Smith"}

@app.route('/user')
def show_user_overview():
    users_str = "<br>".join(users.values())
    return '<h1>Our users</h1><br>{}'.format(users_str)

@app.route('/user/<username>')
def show_user_profile(username):
    # show the user profile for that user
    return 'User %s' % username
app.run(port=5001)


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
