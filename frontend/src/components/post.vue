<template>
  <div>
      <div v-for="post in posts" :key="post.id" class="post">
          <p>{{ post.text }}</p>
      </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      posts : null,
    };
  },
  mounted() {
    axios
      .get("http://localhost:3000/api/post")
      .then((response) => (this.posts = response.data));
  },
};

</script>

<style lang="scss" scoped>
    .post{
        background-color: #FFFFFF;
        border: 1px solid grey;
        max-width: 720px;
        margin-left: auto;
        margin-right: auto;
    }

</style>