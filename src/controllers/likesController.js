import { postsRepository } from "../repositories/postsRepository.js";
import { likesRepository } from "../repositories/likesRepository.js";

export async function getLikesByPostId(req, res) {
  const postId = req.params.id;
  console.log("postId: ", postId);

  try {
    const postSearch = await postsRepository.getPostById(postId);
    if (postSearch.rows.length === 0)
      return res.status(404).send("Post not found");

    const likesList = await likesRepository.getLikes(postId);
    console.log("likesList: ", likesList.rows);

    return res.status(200).send(likesList.rows);
  } catch {
    return res.sendStatus(500);
  }
}