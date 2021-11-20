<template>
  <header>
    <div class="navigation">
      <nav
        class="
          navbar navbar-expand-lg navbar-light
          white
          fixed-top
          nav
          justify-content-center
        "
      >
        <ul class="nav justify-content-center">
          <li class="nav-item">
            <a class="nav-link">
              <router-link to="/home"
                ><img
                  id="nav_groupomania"
                  src="../image/icon-left-font-monochrome-white.svg"
                  alt="lien acceuil"
              /></router-link>
            </a>
          </li>
          <li class="nav-item" v-if="user">
            <a class="nav-link">
              <router-link :to="{ name: 'user', params: { userId: user.id}}">
                <img v-bind:src="user.pp" alt="pp" class="userPageLink"/>
              </router-link>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link">
              <router-link to="/"
                ><img @click="deconnexion"
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
  <router-view />
</template>

<style lang="scss">
.userPageLink{
  height: 40px;
  margin-top: 0px;
  margin-bottom: 0px;
  margin-left: 50px;
  margin-right: 40px;
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
  font-family: 'Roboto', sans-serif;
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
  padding: 30px;
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
</style>


<script>
import axios from "axios";

export default {
  data() {
    return {
      user: null,
      token: document.cookie ? document.cookie
        .split("; ")
        .find((row) => row.startsWith("user-token="))
        .split("=")[1] : null,
      userId: document.cookie ? document.cookie
        .split("; ")
        .find((row) => row.startsWith("userId="))
        .split("=")[1] : null,
    };
  },
  methods: {
    deconnexion(){
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