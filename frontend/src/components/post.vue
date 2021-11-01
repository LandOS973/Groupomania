<template>
  <div>
    <div v-for="post in posts" :key="post.id" class="post">
      <p>{{ post.text }}</p>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      posts: null,
      token: null,
    };
  },
  mounted() {
    if (document.cookie) {
        this.token = document.cookie.split('; ').find(row => row.startsWith('user-token=')).split('=')[1];
    }
    const self = this;
    axios
      .get("http://localhost:3000/api/post", { headers: {"Authorization" : `Bearer ${this.token}`} })
      .then((response) => (this.posts = response.data))
      .catch(function(error){
        if (error.response && error.response.status === 401) {
          self.$router.push("/signup")
        }
      })
  },
};
</script>

<style lang="scss" scoped>
.post {
  background-color: #ffffff;
  border: 1px solid;
  width: 680px;
  margin: 50px auto 50px auto;
  border-radius: 10px;
  padding: 20px;
}
</style>