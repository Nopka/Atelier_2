<template>
  <section class="hero is-fullheight">
    <Header />
    <div class="hero-body">
      <div class="container">
        <div class="columns is-centered">
          <div class="column is-6-tablet is-5-desktop is-9-widescreen">
            <h4 class="title is-5 has-text-centered mb-20">Mon profil</h4>
            <div class="card mb-6 first-card">
              <div class="card-content">
                <div class="media">
                  <div class="media-left mr-4">
                    <figure class="image is-48x48">
                      <img
                        src="https://bulma.io/images/placeholders/96x96.png"
                        alt="Placeholder image"
                      />
                    </figure>
                  </div>
                  <div class="media-content">
                    <p class="title is-4 principal">John Smith</p>
                    <p class="subtitle is-6">@johnsmith</p>
                  </div>
                </div>

                <div class="content">
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                  Phasellus nec iaculis mauris. <a>@bulmaio</a>.
                  <a href="#">#css</a> <a href="#">#responsive</a>
                  <br />
                  <time datetime="2016-1-1">11:09 PM - 1 Jan 2016</time>
                </div>
              </div>
            </div>
            <div class="card second-card">
              <div class="card-content">
                <p class="title principal is-6">Mes informations</p>
                <div class="field is-horizontal">
                    <div class=" field-label is-normal">
                        <label class="label">Username</label>
                    </div>
                    <div class="field-body">
                      <div class="field">
                        <p class="control is-expanded has-icons-left">
                          <input class="input" type="text" placeholder="Name">
                          <span class="icon is-small is-left">
                            <i class="fas fa-user"></i>
                          </span>
                        </p>
                      </div>
                    </div>
                </div>
                 <div class="field is-horizontal">
                    <div class="field-label is-normal">
                        <label class="label"> Email </label>
                    </div>
                    <div class="field-body">
                      <div class="field">
                        <p class="control is-expanded has-icons-left has-icons-right">
                          <input class="input is-success" type="email" placeholder="Email" value="alex@smith.com">
                          <span class="icon is-small is-left">
                            <i class="fas fa-envelope"></i>
                          </span>
                          <span class="icon is-small is-right">
                            <i class="fas fa-check"></i>
                          </span>
                        </p>
                      </div>
                    </div>
                 </div>
                 <div class="field is-horizontal">
                    <div class="field-label is-normal">
                      <label class="label">Sex</label>
                    </div>
                    <div class="field-body">
                      <div class="field is-narrow">
                        <div class="control">
                          <label class="radio pr-2">
                            <input type="radio" name="member">
                            Homme
                          </label>
                          <label class="radio">
                            <input type="radio" name="member">
                            Femme
                          </label>
                        </div>
                      </div>
                    </div>
                  </div>
                <div class="field is-horizontal">
                   <div class="field-label is-normal">
                        <label class="label"> Telephone </label>
                    </div>
                  <div class="field-body">
                    <div class="field is-expanded">
                      <div class="field has-addons">
                        <p class="control">
                          <a class="button is-static">
                            +33
                          </a>
                        </p>
                        <p class="control is-expanded">
                          <input class="input" type="tel" placeholder="Your phone number">
                        </p>
                      </div>
                      <p class="help">Do not enter the first zero</p>
                    </div>
                  </div>
                </div>
                <div class="field is-horizontal">
                  <div class="field-label is-normal">
                    <label class="label">Bio</label>
                  </div>
                  <div class="field-body">
                    <div class="field">
                      <div class="control">
                        <textarea class="textarea" placeholder="Ajouter une bio"></textarea>
                      </div>
                    </div>
                  </div>
                </div>
                 <div class="field is-horizontal">
                  <div class="field-label">
                  </div>
                  <div class="field-body">
                    <div class="field">
                      <div class="control">
                        <button class="button is-primary">Modifier </button>
                      </div>
                    </div>
                  </div>
                </div>
                
                <!-- <div class="content">
                    <label class="label">Sex</label>
                    <div class="control">
                      <label class="radio p-4">
                        <input type="radio" name="foobar">
                        <span> Homme </span> 
                      </label>
                      <label class="radio">
                        <input type="radio" name="foobar" checked>
                        <span> Femme </span>
                      </label>
                    </div>
                    <label class="label">Telephone</label>
                   <div class="control mb-4">
                      <input class="input" type="text" value="num.." readonly />
                    </div>
                    <label class="label">Date de naissance</label>
                  <div class="control mb-4"><input class="input" type="date" value="date de naissance" readonly/>
                  </div>
                </div> -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {};
</script>

<style lang="scss">

.title {
  color: white;
  font-family: "Poppins", sans-serif;
}
.principal {
  color: rgb(56, 54, 54);
}
.first-card {
  height: 200px;
}
.second-card {
  height: 550px;
}
.label{
  text-align: left;
}
</style>
