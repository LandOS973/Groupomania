<template>
  <header>
    <div class="navigation">
      <nav
        class="
          navbar navbar-expand-sm navbar-light
          white
          fixed-top
          nav
          d-flex
          justify-content-center
          flex-nav
        "
      >
        <a class="nav-link">
          <router-link to="/home"
            ><img
              class="homeLinkBig"
              id="nav_groupomania"
              src="../image/icon-left-font-monochrome-white.svg"
              alt="lien acceuil"
          /></router-link>
        </a>
        <a class="nav-link">
          <router-link to="/home"
            ><img
              class="homeLinkLil"
              src="../image/icon.svg"
              alt="lien acceuil"
          /></router-link>
        </a>
        <ul class="nav justify-content-center">
          <li class="nav-item" v-if="user">
            <a class="nav-link">
              <router-link :to="{ name: 'user', params: { userId: user.id } }">
                <img
                  v-bind:src="user.pp"
                  alt="pp"
                  class="userPageLink"
                  @click="refresh"
                />
              </router-link>
            </a>
          </li>
          <li class="nav-item" v-if="user">
            <a class="nav-link">
              <router-link to="/settings">
                <img
                  src="../image/user-cog-solid.svg"
                  alt="setting"
                  class="setting"
                />
              </router-link>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link">
              <router-link to="/"
                ><img
                  @click="deconnexion"
                  id="nav_groupomania"
                  src="../image/sign-out-alt-solid.svg"
                  alt="logout"
                  class="logout"
              /></router-link>
            </a>
          </li>
        </ul>
      </nav>
    </div>
  </header>
  <router-view :key="$route.fullPath" />
</template>

<style lang="scss">
a:hover{
  transition: 0.3s;
  transform: scale(1.1);
}
.userPageLink {
  height: 40px;
  width: 40px;
  margin-top: 0px;
  margin-bottom: 0px;
  margin-right: 40px;
  border-radius: 100%;
}

.homeLinkLil {
  height: 53px;
  margin-right: 20px;
}

.setting {
  height: 32px;
  margin-left: 20px;
}

.logout {
  height: 30px;
}
.navbar {
  border-bottom: 1px solid #dbdbdb;
  height: 55px;
}

.navigation {
  padding-bottom: 30px;
}

.white {
  background-color: #fff;
}

body {
  margin: 0;
  background-color: #fafafa;
  font-family: "Roboto", sans-serif;
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}

* {
  box-sizing: border-box;
}

#nav {
  background-color: #091f43;
  &_groupomania {
    width: 200px;
  }
  a {
    font-weight: bold;
    color: #2c3e50;

    &.router-link-exact-active {
      color: #d1515a;
    }
  }
}

@media only screen and (min-width: 1000px) {
  .homeLinkLil {
    display: none;
  }
}

@media only screen and (max-width: 1000px) {
  .homeLinkBig {
    display: none;
  }
  .userPageLink {
    margin: 0px;
  }
  #nav_groupomania {
    width: 30px;
  }
  .homeLinkLil {
    margin: 0px;
  }
}

@media only screen and (max-width: 570px) {
  li{
    margin-top: -15px;
  }
  .homeLinkLil {
    margin-top: -16px;
  }
}
</style>


<script>
import axios from "axios";
const CryptoJS = require("crypto-js");

export default {
  data() {
    return {
      user: null,
      token: document.cookie
        ? document.cookie
            .split("; ")
            .find((row) => row.startsWith("user-token="))
            .split("=")[1]
        : null,
      userId: document.cookie
        ? CryptoJS.AES.decrypt(
            document.cookie
              .split("; ")
              .find((row) => row.startsWith("userId="))
              .split("=")[1],
            this.$store.state.CryptoKey
          ).toString(CryptoJS.enc.Utf8)
        : null,
    };
  },
  methods: {
    refresh() {
      this.$router.push(`/user/${this.userId}`);
    },
    deconnexion() {
      document.cookie = "userId=";
      document.cookie = "user-token=";
      this.$router.go();
    },
    getCurrentUser() {
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
        .then((response) => (self.user = response.data[0]))
        .catch(function (error) {
          if (error.response && error.response.status === 403) {
            self.$router.push("/");
          }
        });
    },
  },
  mounted() {
    this.getCurrentUser();
  },
};
</script>