import falcon
import aiml
import os

os.chdir("./resource")

class MainResource(object):
    def __init__(self):
        self.ai = aiml.Kernel()
        self.ai.learn("startup.xml")
        self.ai.respond("load aiml cnask")

    def on_get(self, req, resp, sentence):
        resp.status = falcon.HTTP_200
        resp.body = self.ai.respond(sentence)


app = falcon.API()
app.add_route('/api/v1/question/{sentence}', MainResource())

if __name__ == '__main__':
    from wsgiref import simple_server

    httpd = simple_server.make_server('0.0.0.0', 8080, app)
    httpd.serve_forever()
