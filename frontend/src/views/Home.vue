<template>
  <div class="home">
    <Post/>
  </div>
</template>

<script>
// @ is an alias to /src
import Post from "@/components/post.vue";

export default {
  name: "Home",
  components: {
    Post,
  },
};
</script>
