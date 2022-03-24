import connection from "../database.js";

async function insertPost(userData, postData) {
  const author = userData.id;
  const { link, description } = postData;
  
  await connection.query(`
    INSERT INTO posts (author, link, description)
    VALUES ($1, $2, $3);
    `,
    [author, link, description]
  );
}

async function getPosts() {
  return connection.query(`
        SELECT COUNT(lp.id) AS likes, p.id, p.link, p.description, u.name AS "userName", u."profilePic" FROM posts p
          JOIN "likedPost" lp ON lp."postId" = p.id
          JOIN users u ON u.id = p.author
        GROUP BY  p.id, u.id
        ORDER BY p."createdAt" DESC
        LIMIT 20
    `);
}

export const postsRepository = {
  insertPost,
  getPosts
};