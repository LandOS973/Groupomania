<template>
  <div v-for="post in posts" :key="post.id" class="d-flex justify-content-center">
    <div class="bg-white border mt-2 mb-2 col-sm-8 col-lg-6 ">
      <div>
        <div
          class="
            d-flex
            flex-row
            justify-content-between
            align-items-center
            p-2
            border-bottom
          "
        >
          <div class="d-flex flex-row align-items-center feed-text px-2">
            <img
              class="rounded-circle pp"
              v-bind:src="post.pp"
              width="45"
            />
            <div class="d-flex flex-column flex-wrap ml-2">
              <span class="font-weight-bold nomUser"
                >{{ post.nom }} {{ post.prenom }}</span
              ><span class="text-black-50 time">Posté le {{post.date}}</span>
            </div>
          </div>
          <div class="feed-icon px-2">
            <i class="fa fa-ellipsis-v text-black-50"></i>
          </div>
        </div>
      </div>
      <div class="p-2 px-3" v-if="post.text">
        <span
          >{{post.text}}</span
        >
      </div>
      <div class="imagePost" v-if="post.imageUrl">
        <div class="feed-image p-2 px-3"><img class="img-fluid img-responsive" v-bind:src="post.imageUrl"></div>
      </div>
      <div class="d-flex justify-content-end socials p-2 py-3">
        <i class="fa fa-thumbs-up"></i><i class="fa fa-comments-o"></i
        ><i class="fa fa-share"></i>
      </div>
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
      this.token = document.cookie
        .split("; ")
        .find((row) => row.startsWith("user-token="))
        .split("=")[1];
    }
    console.log(this.token);
    const self = this;
    axios
      .get("http://localhost:3000/api/post", {
        headers: { Authorization: `Bearer ${this.token}` },
      })
      .then((response) => (this.posts = response.data))
      .catch(function (error) {
        if (error.response && error.response.status === 401) {
          self.$router.push("/connect");
        }
      });
  },
};
</script>

<style lang="scss" scoped>
.nomUser{
  font-weight: bold;
}
.pp {
  margin-right: 18px;
}

.time {
    font-size: 9px !important
}

.socials i {
    margin-right: 14px;
    font-size: 17px;
    color: #d2c8c8;
    cursor: pointer
}

.feed-image img {
    width: 100%;
    height: auto
}

</style>