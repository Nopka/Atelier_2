<template>
  <section class="hero is-fullheight">
    <Header />
    <div class="hero-body">
      <div class="container">
        <div class="columns is-centered">
          <div class="column is-6-tablet is-5-desktop is-10-widescreen">
            <div class="box">
              <h4 class="title is-5 has-text-centered mb-20 title-chat">
                Soirée Monopoly Chez Alice
              </h4>
              <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias
                at, pariatur quod quidem, est dolorem distinctio eius
                repellendus ullam doloribus magnam dicta, porro necessitatibus
                velit iure odit corrupti vitae modi!
              </p>
              <p><b>Date</b> : 23/03/2022</p>
              <p><b>Lieu</b> : 2Ter Bd Charlemagne, 54000 Nancy</p>
              <footer class="card-footer">
                <button class="button is-success is-light btn-footer">
                  Accepter
                </button>
                <button class="button is-danger is-light btn-footer">
                  Refuser
                </button>
              </footer>
            </div>
            <h4 class="title is-5 has-text-centered mb-20">
              Localiser l'endroit sur la MAP :
            </h4>
            <div class="box" id="map" v-if="ready">
              <template>
                <l-map
                  style="height: 500px"
                  :zoom="zoom"
                  :center="center"
                  @click="addMarker"
                >
                  <l-tile-layer
                    :url="url"
                    :attribution="attribution"
                  ></l-tile-layer>
                  <l-marker :lat-lng="markerLatLng" ref="marker">
                    <l-popup v-if="addresse">{{ addresse }}</l-popup>
                  </l-marker>
                  <l-circle
                    :lat-lng="circle.center"
                    :radius="circle.radius"
                    :color="circle.color"
                  />
                </l-map>
              </template>
            </div>
            <div class="box mt-6">
              <h4 class="title is-6 title-chat">
                Tchat de l'évènement
                <input class="input box mt-6" type="text" placeholder="Votre message">
                <div class="box mt-6">
                  <article class="media ">
                    <div class="media-left">
                      <figure class="image is-32x32 mr-2">
                        <img
                          src="https://bulma.io/images/placeholders/128x128.png"
                          alt="Image"
                        />
                      </figure>
                    </div>
                    <div class="media-content">
                      <div class="content">
                        <p>
                          Lorem ipsum dolor sit amet, consectetur adipiscing
                        </p>
                      </div>
                    </div>
                  </article>
                </div>
                <div class="box mt-6">
                  <article class="media">
                    <div class="media-left">
                      <figure class="image is-32x32  mr-2">
                        <img
                          src="https://bulma.io/images/placeholders/128x128.png"
                          alt="Image"
                        />
                      </figure>
                    </div>
                    <div class="media-content">
                      <div class="content">
                        <p>egestas. Nullam condimentum luctus turpis.</p>
                      </div>
                    </div>
                  </article>
                </div>
                <div class="box mt-6">
                  <article class="media">
                    <div class="media-left">
                      <figure class="image is-32x32  mr-2">
                        <img
                          src="https://bulma.io/images/placeholders/128x128.png"
                          alt="Image"
                        />
                      </figure>
                    </div>
                    <div class="media-content">
                      <div class="content">
                        <p>egestas. Nullam condimentum luctus turpis.</p>
                      </div>
                    </div>
                  </article>
                </div>
              </h4>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import axios from "axios";
import { LMap, LTileLayer, LMarker, LCircle, LPopup } from "vue2-leaflet";
export default {
  components: {
    LMap,
    LTileLayer,
    LMarker,
    LCircle,
    LPopup,
  },
  data() {
    return {
      url: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
      attribution:
        '&copy; <a target="_blank" href="http://osm.org/copyright">OpenStreetMap</a> contributors',
      zoom: 15,
      center: [],
      circle: {
        center: [],
        radius: 100,
        color: "red",
      },
      markerLatLng: [],
      addresse: "2Ter Bd Charlemagne, 54000 Nancy", //rendre ça dynamique
      markerLatLng: [],
      ready: false,
    };
  },
  mounted() {
    this.getCoordinateByUserIp();
    this.getCoordinateByAdresse();
  },
  methods: {
    addMarker(event) {
      this.markerLatLng = event.latlng;
      this.getAdresseByCoordinate();
    },
    getCoordinateByUserIp() {
      axios
        .get("http://ip-api.com/json/")
        .then((response) => {
          this.center = [response.data.lat, response.data.lon];
          this.markerLatLng = [response.data.lat, response.data.lon];
          this.ready = true;
          this.circle.center = [response.data.lat, response.data.lon];
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getCoordinateByAdresse() {
      if (this.addresse) {
        axios
          .get(
            `https://api.geoapify.com/v1/geocode/search?text=${this.addresse}&apiKey=feb8d3c41d7747c7a7cd3b367fb9c161`
          )
          .then((response) => {
            this.center = [
              response.data.features[0].properties.lat,
              response.data.features[0].properties.lon,
            ];
            this.markerLatLng = [
              response.data.features[0].properties.lat,
              response.data.features[0].properties.lon,
            ];
            this.ready = true;
            this.circle.center = [
              response.data.features[0].properties.lat,
              response.data.features[0].properties.lon,
            ];
            this.zoom = 17;
          })
          .catch((error) => {
            console.log(error);
          });
      }
    },
  },
};
</script>

<style lang="scss">
.title {
  color: white;
}
.title-chat {
  color: black;
}

.btn-footer {
  margin: 10px 0em 0px 15em;
  width: 5em;
}
</style>
