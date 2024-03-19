<template>
  <b-container fluid>
    <b-row>
      <b-col sm="12">
        <b-row>
          <b-col lg="12">
            <h1 style="text-align: center; font-size: 30px">
              Dirección General
            </h1>
            <br />
            <h5>Coordinación de Servicos Médicos de Alta Especialidad</h5>
            <br />
            <div
              class="iq-card-body p-0 rounded"
              :style="`background: url(${require('../../assets/images/page-img/imagenes-direccionGeneral/banner.png')}) no-repeat scroll center center; background-size: contain;  min-height: 446px;`"
            ></div>
            <br />
          </b-col>

          <div style="margin-left: auto; margin-right: auto; max-width: 1200px">
            <div style="display: flex; justify-content: space-between">
              <b-col md="4" lg="3">
                <iq-card>
                  <template v-slot:body>
                    <div
                      class="iq-card-body p-0 rounded"
                      :style="`background: url(${require('../../assets/images/page-img/imagenes-direccionGeneral/medico.jpg')}) no-repeat scroll center center; background-size: contain;  min-height: 146px;`"
                    ></div>
                    <h4 class="mb-2 mt-2" style="text-align: center">
                      Aprobación de Servicios Hospitalarios
                    </h4>
                    <div class="text-center">
                      <button
                        class="btn btn-primary"
                        onclick="window.location.href='/aprobacion-servicios-hospitalarios'"
                      >
                        Conoce Más
                      </button>
                    </div>
                  </template>
                </iq-card>
              </b-col>

              <b-col md="6" lg="3">
                <iq-card>
                  <template v-slot:body>
                    <div
                      class="iq-card-body p-0 rounded"
                      :style="`background: url(${require('../../assets/images/page-img/imagenes-direccionGeneral/servicioshospitalarios.jpg')}) no-repeat scroll center center; background-size: contain;  min-height: 146px;`"
                    ></div>
                    <h4 class="mb-2 mt-2" style="text-align: center">
                      Estructura Organica del Hospital
                    </h4>
                    <div class="text-center">
                      <button
                        class="btn btn-primary"
                        onclick="window.location.href='/estrucutura-organica-hospital'"
                      >
                        Conoce Más
                      </button>
                    </div>
                  </template>
                </iq-card>
              </b-col>

              <b-col md="6" lg="3">
                <iq-card>
                  <template v-slot:body>
                    <div
                      class="iq-card-body p-0 rounded"
                      :style="`background: url(${require('../../assets/images/page-img/imagenes-direccionGeneral/servcio.webp')}) no-repeat scroll center center; background-size: contain;  min-height: 146px;`"
                    ></div>
                    <h4 class="mb-2 mt-2" style="text-align: center">
                      Bitácora General del Hospital
                    </h4>
                    <div class="text-center">
                      <button
                        class="btn btn-primary"
                        onclick="window.location.href='/bitacora-direccion-general'"
                      >
                        Conoce Más
                      </button>
                    </div>
                  </template>
                </iq-card>
              </b-col>

              <b-col md="6" lg="3">
                <iq-card>
                  <template v-slot:body>
                    <div
                      class="iq-card-body p-0 rounded"
                      :style="`background: url(${require('../../assets/images/page-img/imagenes-direccionGeneral/EstadisitcasMedicas.jpg')}) no-repeat scroll center center; background-size: contain;  min-height: 146px;`"
                    ></div>
                    <h4 class="mb-2 mt-2" style="text-align: center">
                      Dashboard General del Hospital
                    </h4>
                    <div class="text-center">
                      <button
                        class="btn btn-primary"
                        onclick="window.location.href='/dashboard-general-hospital'"
                      >
                        Conoce Más
                      </button>
                    </div>
                  </template>
                </iq-card>
              </b-col>
            </div>
          </div>
        </b-row>
      </b-col>
    </b-row>

    <!-- --------------------------------------------------------------------------------------------------------------------------->
    <div style="margin-left: auto; margin-right: auto; max-width: 1200px">
      <div style="display: flex; justify-content: space-between">
        <b-row>
          <b-col lg="12">
            <iq-card>
              <template v-slot:headerTitle>
                <h4 class="card-title">Hospital General</h4>
              </template>
              <template v-slot:body>
                <div style="text-align: justify">
                  <p>
                    Somos una institución que cuida la salud y seguridad de
                    nuestros pacientes a través de las mejores prácticas
                    médicas. Nos distinguimos por ser solidarios e incluyentes,
                    invirtiendo recursos en acciones para mejorar la salud en
                    México, como el acceso a servicios médicos para la población
                    vulnerable.
                  </p>
                  <p>
                    En nuestro Centro de Alta Especialidad brindamos un servicio
                    seguro y de calidad, caracterizado por la orientación ala
                    paciente y por contar con una amplia gama de servicios
                    médicos y hospitalarios que están al nivel de los mejores
                    del mundo.
                  </p>
                </div>
              </template>
            </iq-card>
          </b-col>

          <b-col lg="6">
            <iq-card
              body-class="hospital-mgt"
              class="iq-card-block iq-card-height1"
            >
              <template v-slot:headerTitle>
                <h4 class="card-title">Contacto</h4>
              </template>

              <template v-slot:body>
                <div>
                  <div>
                    <p>Dirección: calle nombre hospital general #352</p>
                    <p>Xicotepec de Juárez, Puebla C.P 73080</p>
                    <hr />
                    <p>Comunicate con Nosotros</p>
                    <li>
                      <p><a href="tel:+5253558858876">(52)33 55 885 8876</a></p>
                      <p><a href="tel:+5233558858878">(52)33 55 885 8878</a></p>
                      <p>
                        <a href="tel:+5233558858870">Fax: (52)33 55 885 8870</a>
                      </p>
                    </li>
                  </div>
                </div>
              </template>
            </iq-card>
          </b-col>

          <b-col lg="6">
            <iq-card
              body-class="hospital-mgt"
              class="iq-card-block iq-card-height1"
            >
              <template v-slot:headerTitle>
                <h4 class="card-title">Enlaces</h4>
              </template>

              <template v-slot:body>
                <div>
                  <div>
                    <p>Correo Electronico</p>
                    <p>
                      <a href="mailto:direcciongeneral@hospitalgeneral.com"
                        >direcciongeneral@hospitalgeneral.com</a
                      >
                    </p>
                    <hr />
                    <iq-card>
                      <template v-slot:headerTitle>
                        <h4 class="card-title">Redes Sociales</h4>
                      </template>
                      <div style="text-align: center">
                        <link
                          rel="stylesheet"
                          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
                        />
                        <!-- Facebook -->
                        <i
                          class="fab fa-facebook-f fa-2x"
                          style="color: #3b5998; margin-right: 25px"
                        ></i>

                        <!-- Twitter -->
                        <i
                          class="fab fa-twitter fa-2x"
                          style="color: #55acee; margin-right: 25px"
                        ></i>

                        <!-- Instagram -->
                        <i
                          class="fab fa-instagram fa-2x"
                          style="color: #ac2bac; margin-right: 25px"
                        ></i>

                        <!-- Linkedin -->
                        <i
                          class="fab fa-linkedin-in fa-2x"
                          style="color: #0082ca; margin-right: 25px"
                        ></i>

                        <!-- Youtube -->
                        <i
                          class="fab fa-youtube fa-2x"
                          style="color: #ed302f; margin-right: 25px"
                        ></i>

                        <!-- Whatsapp -->
                        <i
                          class="fab fa-whatsapp fa-2x"
                          style="color: #25d366; margin-right: 25px"
                        ></i>
                      </div>
                    </iq-card>
                  </div>
                </div>
              </template>
            </iq-card>
          </b-col>
        </b-row>
      </div>
    </div>

    <!-- --------------------------------------------------------------------------------------------------------------------------->
  </b-container>
</template>

<script>
import IqCard from "../../components/xray/cards/iq-card";
import { xray } from "../../config/pluginInit";
//import CountUp from 'vue-countup-v3'
const body = document.getElementsByTagName("body");

export default {
  name: "DireccionGeneral",
  components: { IqCard },
  data() {
    return {
      config: {
        dateFormat: "Y-m-d",
        inline: true,
      },
    };
  },
  mounted() {
    xray.index();
    body[0].classList.add("sidebar-main-menu");
  },
  unmounted() {
    body[0].classList.remove("sidebar-main-menu");
  },
};
</script>
/* eslint-disable */
