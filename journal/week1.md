# Week 1 — App Containerization
References
Good Article for Debugging Connection Refused https://pythonspeed.com/articles/docker-connection-refused/

### VSCode Docker Extension
Docker for VSCode makes it easy to work with Docker

https://code.visualstudio.com/docs/containers/overview

Gitpod is preinstalled with theis extension

### Containerize Backend

Run Python

```
cd backend-flask
export FRONTEND_URL="*"
export BACKEND_URL="*"
python3 -m flask run --host=0.0.0.0 --port=4567
cd ..
```

make sure to unlock the port on the port tab
open the link for 4567 in your browser


![PORT RUNNING 4567](https://user-images.githubusercontent.com/75420964/221658444-89938ef9-af7b-4b92-ad7b-61a379d20be2.png)

append to the url to `/api/activities/home`

you should get back json
![JSON](https://user-images.githubusercontent.com/75420964/221658534-6c74e018-a39d-4c08-b444-60835ff339ac.png)


### Add Dockerfile

Create a file here: backend-flask/Dockerfile
```
FROM python:3.10-slim-buster

WORKDIR /backend-flask

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

ENV FLASK_ENV=development

EXPOSE ${PORT}
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=4567"]

``` 

![dockerfile](https://user-images.githubusercontent.com/75420964/221670921-c18ccc54-84c4-41b6-96a1-5ee434eeb74d.png)


### Build Container

```
docker build -t  backend-flask ./backend-flask
``` 

![docker build backend 1](https://user-images.githubusercontent.com/75420964/221670997-89ff3cfb-53f6-43eb-a891-dc690ce6281a.png)
![docker images](https://user-images.githubusercontent.com/75420964/221671543-919ea44c-507f-49b3-8a74-33e0df2701b5.png)

### Run Container

Run
```
docker run --rm -p 4567:4567 -it backend-flask
```
![docker run 1](https://user-images.githubusercontent.com/75420964/221671471-a5750ae4-ec93-4547-96a2-223a801acbe1.png)
```
FRONTEND_URL="*" BACKEND_URL="*" docker run --rm -p 4567:4567 -it backend-flask
export FRONTEND_URL="*"
export BACKEND_URL="*"
docker run --rm -p 4567:4567 -it -e FRONTEND_URL='*' -e BACKEND_URL='*' backend-flask
docker run --rm -p 4567:4567 -it  -e FRONTEND_URL -e BACKEND_URL backend-flask
unset FRONTEND_URL="*"
unset BACKEND_URL="*"
```

### Run in background
```
docker container run --rm -p 4567:4567 -d backend-flask
```

Return the container id into an Env Vat

```
CONTAINER_ID=$(docker run --rm -p 4567:4567 -d backend-flask)
```

docker container run is idiomatic, docker run is legacy syntax but is commonly used.

Get Container Images or Running Container Ids
```
docker ps
docker images
```
### Send Curl to Test Server
```
curl -X GET http://localhost:4567/api/activities/home -H "Accept: application/json" -H "Content-Type: application/json"
```

### Check Container Logs
```
docker logs CONTAINER_ID -f
docker logs backend-flask -f
docker logs $CONTAINER_ID -f
```

### Debugging adjacent containers with other containers
```
docker run --rm -it curlimages/curl "-X GET http://localhost:4567/api/activities/home -H \"Accept: application/json\" -H \"Content-Type: application/json\""
```

busybosy is often used for debugging since it install a bunch of thing

`docker run --rm -it busybosy`

Gain Access to a Container

`docker exec CONTAINER_ID -it /bin/bash`

You can just right click a container and see logs in VSCode with Docker extension

### Delete an Image
```
docker image rm backend-flask --force
docker rmi backend-flask is the legacy syntax, you might see this is old docker tutorials and articles.
```

There are some cases where you need to use the --force

Overriding Ports

```
FLASK_ENV=production PORT=8080 docker run -p 4567:4567 -it backend-flask
```

Look at Dockerfile to see how ${PORT} is interpolated

Containerize Frontend
Run NPM Install
We have to run NPM Install before building the container since it needs to copy the contents of node_modules

cd frontend-react-js
npm i
Create Docker File
Create a file here: frontend-react-js/Dockerfile
```
FROM node:16.18

ENV PORT=3000

COPY . /frontend-react-js
WORKDIR /frontend-react-js
RUN npm install
EXPOSE ${PORT}
CMD ["npm", "start"]
```
Build Container


`docker build -t frontend-react-js ./frontend-react-js`

Run Container

`docker run -p 3000:3000 -d frontend-react-js`

Multiple Containers

Create a docker-compose file

Create docker-compose.yml at the root of your project.
```
version: "3.8"
services:
  backend-flask:
    environment:
      FRONTEND_URL: "https://3000-${GITPOD_WORKSPACE_ID}.${GITPOD_WORKSPACE_CLUSTER_HOST}"
      BACKEND_URL: "https://4567-${GITPOD_WORKSPACE_ID}.${GITPOD_WORKSPACE_CLUSTER_HOST}"
    build: ./backend-flask
    ports:
      - "4567:4567"
    volumes:
      - ./backend-flask:/backend-flask
  frontend-react-js:
    environment:
      REACT_APP_BACKEND_URL: "https://4567-${GITPOD_WORKSPACE_ID}.${GITPOD_WORKSPACE_CLUSTER_HOST}"
    build: ./frontend-react-js
    ports:
      - "3000:3000"
    volumes:
      - ./frontend-react-js:/frontend-react-js
```
# the name flag is a hack to change the default prepend folder
# name when outputting the image names

```
networks: 
  internal-network:
    driver: bridge
    name: cruddur
```

### Add the notification feature for the backend and frontend
kindly watch this [video](https://www.youtube.com/watch?v=k-_o0cCpksk&list=PLBfufR7vyJJ7k25byhRXJldB5AiwgNnWv&index=27) for proper implementation
At the backend files open the openapi-3.0.yml file
and after the /api/Messages add this

```
  /api/activities/notifications:
    get:
      description: 'Return a feed of activity for all the people i follow'
      tags:
        - activities
        
      parameters: []
      responses:
        '200':
          description: Returns an array of activities
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/Activity'
 ```
at the back end open services 
create a notification_activities.py file and add the following code, you can edit the message and handle part if you like
```
from datetime import datetime, timedelta, timezone
class NotificationsActivities:
  def run():
    now = datetime.now(timezone.utc).astimezone() 
    results = [{
      'uuid': '68f126b0-1ceb-4a33-88be-d90fa7109eee',
      'handle':  'coco',
      'message': 'i am a red corn!',
      'created_at': (now - timedelta(days=2)).isoformat(),
      'expires_at': (now + timedelta(days=5)).isoformat(),
      'likes_count': 5,
      'replies_count': 1,
      'reposts_count': 0,
      'replies': [{
        'uuid': '26e12864-1c26-5c3a-9658-97a10f8fea67',
        'reply_to_activity_uuid': '68f126b0-1ceb-4a33-88be-d90fa7109eee',
        'handle':  'Worf',
        'message': 'This post has no honor!',
        'likes_count': 0,
        'replies_count': 0,
        'reposts_count': 0,
        'created_at': (now - timedelta(days=2)).isoformat()
      }],
    },
   
    ]
    return results
```
![notification_activities backend](https://user-images.githubusercontent.com/75420964/222570881-c08af545-cb2f-4c8a-8da5-ca4887d2c7cf.png)
do a docker compose to check if its working and add a /api/activities/notifications 

![working backend](https://user-images.githubusercontent.com/75420964/222571498-b24fb6e4-7deb-4fd8-aea1-cf1f5a36b30c.png)

for the frontend

open the frontend_react_js file ,open the src folder,open the app.js file and edit the contents to include the notification parameters
```
import './App.css';

import HomeFeedPage from './pages/HomeFeedPage';
import NotificationsFeedPage from './pages/NotificationsFeedPage';
import UserFeedPage from './pages/UserFeedPage';
import SignupPage from './pages/SignupPage';
import SigninPage from './pages/SigninPage';
import RecoverPage from './pages/RecoverPage';
import MessageGroupsPage from './pages/MessageGroupsPage';
import MessageGroupPage from './pages/MessageGroupPage';
import ConfirmationPage from './pages/ConfirmationPage';
import React from 'react';
import {
  createBrowserRouter,
  RouterProvider
} from "react-router-dom";

const router = createBrowserRouter([
  {
    path: "/",
    element: <HomeFeedPage />
  },
  {
    path: "/notifications",
    element: <NotificationsFeedPage />
  },
  {
    path: "/@:handle",
    element: <UserFeedPage />
  },
  {
    path: "/messages",
    element: <MessageGroupsPage />
  },
  {
    path: "/messages/@:handle",
    element: <MessageGroupPage />
  },
  {
    path: "/signup",
    element: <SignupPage />
  },
  {
    path: "/signin",
    element: <SigninPage />
  },
  {
    path: "/confirm",
    element: <ConfirmationPage />
  },
  {
    path: "/forgot",
    element: <RecoverPage />
  }
]);

function App() {
  return (
    <>
      <RouterProvider router={router} />
    </>
  );
}

export default App;
```
open the src and pages folder and create the NotificationsFeedPage.js and NotificationFeedPage.css and copy the codes from the HomeFeedPage.js into the latter 
 and make the necessary edits after that refresh or do a docker compose after signing up 
![red corn](https://user-images.githubusercontent.com/75420964/222575382-81e9eb2f-fb2f-479c-b782-920ce5a3bc69.png)

Adding DynamoDB Local and Postgres

We are going to use Postgres and DynamoDB local in future labs We can bring them in as containers and reference them externally


Lets integrate the following into our existing docker compose file:
```
Postgres
services:
  db:
    image: postgres:13-alpine
    restart: always
    environment:
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=password
    ports:
      - '5432:5432'
    volumes: 
      - db:/var/lib/postgresql/data
volumes:
  db:
    driver: local
```  
 
To install the postgres client into Gitpod.yml

```
  - name: postgres
    init: |
      curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/postgresql.gpg
      echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list
      sudo apt update
      sudo apt install -y postgresql-client-13 libpq-dev
```
      
### DynamoDB Local

```
services:
  dynamodb-local:
    # https://stackoverflow.com/questions/67533058/persist-local-dynamodb-data-in-volumes-lack-permission-unable-to-open-databa
    # We needed to add user:root to get this working.
    user: root
    command: "-jar DynamoDBLocal.jar -sharedDb -dbPath ./data"
    image: "amazon/dynamodb-local:latest"
    container_name: dynamodb-local
    ports:
      - "8000:8000"
    volumes:
      - "./docker/dynamodb:/home/dynamodblocal/data"
    working_dir: /home/dynamodblocal
    
```    
attach the posgre to the gitod.yml file and connect 
![post gre connect](https://user-images.githubusercontent.com/75420964/222574876-f0f5d093-039e-4f76-a812-4c248d285b7c.png)

Example of using DynamoDB local https://github.com/100DaysOfCloud/challenge-dynamodb-local

Volumes
directory volume mapping

```
volumes: 
- "./docker/dynamodb:/home/dynamodblocal/data"
named volume mapping
```
```
volumes: 
  - db:/var/lib/postgresql/data
```
```
volumes:
  db:
    driver: local
```
