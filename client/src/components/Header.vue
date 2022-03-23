<template>
  <section class="hero header">
    <nav class="navbar" role="navigation" aria-label="main navigation">
      <div class="navbar-brand">
        <router-link class="navbar-item reunionou" to="/"
          ><b>Reunionou</b></router-link
        >
      </div>

      <div id="navbarBasicExample" class="navbar-menu">
        <div class="navbar-start">
          <router-link class="navbar-item" to="/Accueil"><i class="fa-solid fa-calendar-check mr-2"></i>Mes évènements </router-link>
          <router-link class="navbar-item" to="/ProfilUser"><i class="fa-solid fa-user-tie mr-2"></i> Mon profil </router-link>
          <router-link class="navbar-item" to="/Invitations"><i class="fa-solid fa-bell mr-2"></i>Invitations</router-link>
        </div>

        <div class="navbar-end">
          <div class="navbar-item">
            <div class="buttons">
              <a class="button is-dark is-small"> Se déconnecter </a>
            </div>
          </div>
        </div>
      </div>
    </nav>
  </section>
</template>

<script>
export default {};
</script>

<style style="scss">
.header {
  background-color: #ffffff;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 6px -1px,
    rgba(0, 0, 0, 0.06) 0px 2px 4px -1px;
}
.reunionou {
  font-family: "Abril Fatface", sans-serif;
  font-size : 20px;
}
.navbar-item {
  color: rgb(26, 25, 25);
  margin: 0 0.8em 0 0.8em;
}

.navbar-start {
  position: absolute;
  left: 30%;
  top: 15%;
  font-family: "Poppins", sans-serif;
}
.navbar-end {
  position: absolute;
  right: 1%;
  top: 5%;
  font-family: "Poppins", sans-serif;
}
img {
  width: 80%;
}
@import url("https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Alegreya+Sans:wght@300&family=Cormorant+Garamond:wght@300;600&family=Lora:wght@500&family=Old+Standard+TT&family=Pacifico&family=Poppins&family=Roboto+Mono:wght@500&family=Roboto:wght@300;400&family=Space+Mono&display=swap");
</style>
