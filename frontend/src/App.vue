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
          <li class="nav-item" v-if="user">
            <a class="nav-link">
              <router-link to="/"
                ><img
                  @click="deconnexion"
                  src="../image/sign-out-alt-solid.svg"
                  alt="logout"
                  class="logout"
              /></router-link>
            </a>
          </li>
          <li class="nav-item">
            <img
              @click="appRecherche"
              class="loupe"
              src="../image/search.svg"
              alt=""
            />
          </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" v-if="user">
          <div class="flex_input">
            <input
              class="form-control mr-sm-2 inputsearch"
              type="search"
              placeholder="   Chercher un utilisateur"
              aria-label="Search"
              @keyup="search"
              @click="stopSearch"
              @blur="stopSearch"
            />
            <img
              @click="dispRecherche"
              class="cross"
              src="../image/times-solid.svg"
              alt=""
            />
          </div>
          <div class="results" v-if="userSearch && research != ''">
            <div v-for="result in userSearch" :key="result.id" class="result">
              <router-link
                :to="{ name: 'user', params: { userId: result.id } }"
              >
                <img
                  class="imgSearch"
                  v-bind:src="result.pp"
                  alt=""
                  srcset=""
                />
                <span class="nameSearch"
                  >{{ result.prenom }} {{ result.nom }}</span
                >
              </router-link>
            </div>
          </div>
        </form>
      </nav>
    </div>
  </header>
  <router-view :key="$route.fullPath" />
</template>

<style lang="scss">
.loupe {
  height: 35px;
  margin-top: 7px;
  margin-left: 10px;
  &:hover {
    transition: 0.3s;
    transform: scale(1.1);
  }
}
.inputsearch {
  background-color: #f0f2f5;
  border-radius: 20px;
  text-align: center;
}
.nameSearch {
  text-decoration: none;
  color: #091f43;
}
a:link {
  text-decoration: none;
}
.imgSearch {
  object-fit: cover;
  height: 45px;
  width: 45px;
  margin: 10px;
  border-radius: 100%;
}
.results {
  position: absolute;
}
.result {
  width: 221px;
  border: 1px solid #dbdbdb;
  background-color: white;
  &:hover {
    background-color: #90b3d6;
  }
}
a:hover {
  transition: 0.3s;
  transform: scale(1.1);
}
.userPageLink {
  object-fit: cover;
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
  width: 80px;
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
  .loupe {
    display: none;
  }
  .cross {
    display: none;
    height: 35px;
    position: absolute;
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
  .inputsearch {
    display: none;
  }
  .cross {
    height: 35px;
    margin-left: 20px;
    display: none;
  }
  .flex_input {
    display: flex;
  }
}

@media only screen and (max-width: 570px) {
  li {
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
      research: "",
      userSearch: null,
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
    appRecherche() {
      document.querySelector(".inputsearch").style.display = "block";
      document.querySelector(".cross").style.display = "block";
    },
    dispRecherche() {
      document.querySelector(".inputsearch").style.display = "none";
      document.querySelector(".cross").style.display = "none";
    },
    stopSearch() {
      const self = this;
      setTimeout(function () {
        self.research = null;
        self.userSearch = null;
      }, 100);
    },
    search(event) {
      this.research = event.target.value;
      const self = this;
      axios
        .post(
          "http://localhost:3000/api/user/getAs",
          { nom: self.research },
          {
            headers: {
              Authorization: `Bearer ${self.token}`,
            },
          }
        )
        .then((response) => {
          self.userSearch = response.data;
        })
        .catch(function (error) {
          if (error.response && error.response.status === 403) {
            self.$router.push("/");
          }
        });
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
          if (error.response && error.response.status === 400) {
            document.cookie = "userId=";
            document.cookie = "user-token=";
            self.$router.push("/");
          }
        });
    },
  },
  mounted() {
    this.getCurrentUser();
    this.stopSearch();
  },
};
</script>