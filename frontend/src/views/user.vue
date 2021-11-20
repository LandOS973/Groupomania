<template>
  <div class="home mt-5">
    <div class="container">
      <div v-if="user" class="infoUser">
        <img class="pp" v-bind:src="user.pp" alt="pp" srcset="" />
        <p class="userName">{{ user.prenom }} {{ user.nom }}</p>
      </div>
      <div v-for="post in posts" :key="post.postId" class="posts">
          {{post.text}}
      </div>
    </div>
  </div>
</template>

<style lang="scss" scoped>
.userName {
  font-size: 35px;
  padding-top: 50px;
  padding-right: 50px;
}
.infoUser {
  display: flex;
  margin-top: 60px;
  justify-content: center;
}
.pp {
  height: 200px;
  border-radius: 50%;
  margin-right: 200px;
}
</style>

<script>
import axios from "axios";

export default {
  data() {
    return {
      userId: this.$route.params.userId,
      user: null,
      posts: null,
      token: document.cookie
        .split("; ")
        .find((row) => row.startsWith("user-token="))
        .split("=")[1],
    };
  },
  methods: {
    async getUser() {
      const self = this;
      axios
        .post(
          "http://localhost:3000/api/user",
          { userId: self.userId },
          {
            headers: {
              Authorization: `Bearer ${self.token}`,
            },
          }
        )
        .then((response) => {
          this.user = response.data[0];
        })
        .catch(function (error) {
          if (error.response) {
            self.$router.push("/");
          }
        });
    },
    getPost() {
      const self = this;
      axios
        .post(
          "http://localhost:3000/api/post/byAuthor",
          { id: self.userId },
          {
            headers: {
              Authorization: `Bearer ${self.token}`,
            },
          }
        )
        .then((response) => {
          this.posts = response.data;
          console.log(this.posts);
        })
        .catch(function (error) {
          if (error.response && error.response.status === 401) {
            self.$router.push("/");
          }
        });
    },
  },
  mounted() {
    this.getUser();
    this.getPost();
    console.log(this.user);
  },
};
</script>
