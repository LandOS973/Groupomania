<template>
  <div class="home">
    <NewPost />
    <Post />
  </div>
</template>

<style lang="scss" scoped>
</style>

<script>
// @ is an alias to /src
import Post from "@/components/post.vue";
import NewPost from "../components/newPost.vue";

export default {
  name: "Home",
  components: {
    Post,
    NewPost,
  },
};
</script>
