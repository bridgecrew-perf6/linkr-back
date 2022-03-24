CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    "profilePic" TEXT NOT NULL
);

CREATE TABLE links(
    id SERIAL PRIMARY KEY,
    link TEXT NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    image TEXT NOT NULL
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    author INTEGER NOT NULL REFERENCES users(id),
    description TEXT NOT NULL,
    "linkId" INTEGER NOT NULL REFERENCES links(id),
    "createdAt" TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE sessions(
    id SERIAL PRIMARY KEY,
    "userId" INTEGER NOT NULL REFERENCES users(id),
    token TEXT NOT NULL,
    "expiresAt" TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE "likedPost"(
    id SERIAL PRIMARY KEY,
    "postId" INTEGER NOT NULL REFERENCES posts(id),
    "likeAuthor" INTEGER NOT NULL REFERENCES users(id)
);

CREATE TABLE topics(
    id SERIAL PRIMARY KEY,
    topic TEXT NOT NULL UNIQUE
);

CREATE TABLE "postsTopics"(
    id SERIAL PRIMARY KEY,
    "postId" INTEGER NOT NULL REFERENCES posts(id),
    "topicId" INTEGER NOT NULL REFERENCES topics(id)
);