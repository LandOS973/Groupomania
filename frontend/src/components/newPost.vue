<template>
  <div class="home">
    <div class="newPost">
      <form>
        <input
          type="text"
          name="newPost"
          id="text"
          placeholder="Quoi de neuf ?"
        />
        <label for="image">Partage une image</label>
        <input
          @change="upload"
          type="file"
          id="image"
          name="image"
          accept="image/png, image/jpeg"
        />
        <button @click="addPost()">Publier</button>
      </form>
    </div>
  </div>
</template>


<script>
import axios from "axios";
export default {
  data() {
    return {
      userId: null,
      text: null,
      image: null,
      token: null,
    };
  },
  methods: {
    upload(event) {
      this.image = event.target.files[0];
    },
    addPost() {
      this.userId = document.cookie
        .split("; ")
        .find((row) => row.startsWith("userId="))
        .split("=")[1];
      this.token = document.cookie
        .split("; ")
        .find((row) => row.startsWith("user-token="))
        .split("=")[1];
      this.text = document.querySelector("#text").value;
      const fd = new FormData();
      fd.append("userId", this.userId);
      if (this.text != "") {
        fd.append("text", this.text);
      }
      if (this.image) {
        fd.append("image", this.image, "image");
      }
      if (this.text || this.image) {
        axios
          .post("http://localhost:3000/api/post", fd, {
            headers: { "Content-Type": "multipart/form-data", Authorization: `Bearer ${this.token}`},
          })
          .then(function (response) {
            console.log(response);
          })
          .catch(function (error) {
            console.log(error);
          });
      }
    },
  },
};
</script>

<style lang="scss" scoped>
.newPost {
  background-color: white;
  width: 680px;
  margin: 50px auto 50px auto;
  padding: 20px;
}
</style>