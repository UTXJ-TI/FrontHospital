<template>
  <b-container fluid>
    <b-row>
      <b-col sm="12">
        <h1 style="text-align: center; font-size: 30px">
          Bitácora de Dirección del Hospital
        </h1>

        <b-row sm="12">
          <div style="margin-left: auto; margin-right: auto; max-width: 1200px">
            <div class="d-flex flex-wrap justify-content-between">
              <!-- Utilizamos flex-wrap y justify-content-center para centrar los elementos y permitir que se envuelvan en pantallas más pequeñas -->
              <b-col
                md="6"
                lg="3"
                v-for="(category, index) in categories"
                :key="index"
              >
                <iq-card body-class="rounded">
                  <template v-slot:body>
                    <div
                      class="d-flex align-items-center justify-content-between"
                    >
                      <div class="text-center">
                        <h4 class="mb-2 mt-2">{{ category.title }}</h4>
                        <h3 class="mb-0 line-height">
                          <span
                            ><count-up
                              :end-val="category.value"
                              duration="5"
                            ></count-up
                          ></span>
                        </h3>
                      </div>
                      <div
                        :class="
                          'rounded-circle iq-card-icon ' + category.iconBg
                        "
                      >
                        <i :class="category.icon"></i>
                      </div>
                    </div>
                  </template>
                </iq-card>
              </b-col>
            </div>
          </div>
        </b-row>
      </b-col>

      <!-- Encabezados -->

      <b-col lg="12">
        <iq-card>
          <template v-slot:headerTitle>
            <!--                 
              <div style="margin-left: auto; margin-right: auto; max-width: 1200px">
                <div class="row">

                  <b-col md="6" lg="6">
                    <iq-card>
                      <template v-slot:body>
                        <div class="text-center">
                          <button style="margin: 0 auto; max-width: 200px;" class="btn btn-primary" onclick="window.location.href='/estrucutura-organica-hospital2'">Servicios Medicos</button>
                        </div>
                      </template>
                    </iq-card>
                  </b-col>
                </div>
              </div> -->

            <!-- --------------------------------------------------------- -->
            <nav class="navbar navbar-expand-lg navbar-light p-0">
              <div class="iq-search-bar">
                <form action="#" class="searchbox">
                  <input
                    type="text"
                    class="text search-input"
                    title="searchField"
                    placeholder="Buscar"
                    v-model="searchInput"
                  />
                  <a class="search-link" href="#"
                    ><i class="ri-search-line"></i
                  ></a>
                </form>
              </div>
              <b-navbar-toggle target="nav">
                <i class="ri-menu-3-line"></i>
              </b-navbar-toggle>
              <div class="iq-menu-bt align-self-center">
                <div class="wrapper-menu" @click="miniSidebar">
                  <div class="main-circle"><i class="ri-more-fill"></i></div>
                  <div class="hover-circle"><i class="ri-more-2-fill"></i></div>
                </div>
              </div>
              <b-collapse id="nav-collapse" is-nav>
                <slot name="responsiveRight" />
              </b-collapse>
              <slot name="right" />
            </nav>

            <!-- <database-website-component :entries="dataset" :columns="dataColumns" :filter-key="searchInput">
                </database-website-component> -->

            <!-- --------------------------------------------------------- -->
          </template>

          <template v-slot:body>
            <div class="table-responsive mb-5">
              <table class="table mb-3 table-borderless table-hover">
                <thead>
                  <tr style="text-align: center">
                    <th scope="col">N°</th>
                    <th scope="col">Tabla</th>
                    <th scope="col">Usuario</th>
                    <th scope="col">Operación</th>
                    <th scope="col">Descripción</th>
                    <th scope="col">Fecha</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="(bitacora, id) in paginatedData" :key="id">
                    <td>{{ bitacora.id }}</td>
                    <td>{{ bitacora.nombre_tabla }}</td>
                    <td>{{ bitacora.usuario }}</td>
                    <td>
                      <div
                        v-if="bitacora.operacion === 'Insert'"
                        class="text-center"
                      >
                        <a class="iq-icons-list" target="_self">
                          <div
                            data-icon="S"
                            class="icon"
                            style="color: green"
                          ></div>
                          <span style="color: green">Agregado</span>
                        </a>
                      </div>
                      <div
                        v-else-if="bitacora.operacion === 'Update'"
                        class="text-center"
                      >
                        <a class="iq-icons-list" target="_self">
                          <div
                            data-icon="Z"
                            class="icon"
                            style="color: orange"
                          ></div>
                          <span style="color: orange">Actulizado</span>
                        </a>
                      </div>
                      <div
                        v-else-if="bitacora.operacion === 'Delete'"
                        class="text-center"
                      >
                        <a class="iq-icons-list" target="_self">
                          <div
                            data-icon="&#xe053;"
                            class="icon"
                            style="color: red"
                          ></div>
                          <span style="color: red">Eliminado</span>
                        </a>
                      </div>
                      <div
                        v-else-if="bitacora.operacion === 'Read'"
                        class="text-center"
                      >
                        <a class="iq-icons-list" href="#" target="_self">
                          <div
                            data-icon="("
                            class="icon"
                            style="color: black"
                          ></div>
                          <span style="color: black">Lectura</span>
                        </a>
                      </div>
                      <div v-else class="col-12 col-md-6 col-lg-3">
                        {{ bitacora.operacion }}
                      </div>
                    </td>
                    <td>{{ formatearDescripcion(bitacora.descripcion) }}</td>
                    <td>{{ formatearFecha(bitacora.fecha_hora) }}</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="pagination">
              <button
                class="btn btn-primary"
                @click="previousPage"
                :disabled="currentPage === 1"
              >
                Anterior
              </button>
              <button
                class="btn btn-primary"
                @click="nextPage"
                :disabled="currentPage === totalPages"
              >
                Siguiente
              </button>
            </div>
          </template>
        </iq-card>
      </b-col>
    </b-row>

    <b-row>
      <b-col md="4" lg="4">
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

      <b-col md="4" lg="4">
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

      <b-col md="4" lg="4">
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
    </b-row>
  </b-container>
</template>

<script>
import iqCard from "../../components/xray/cards/iq-card.vue";
//   import MapAmChart from '../../components/xray/charts/MapAmChart.vue'
import { xray } from "../../config/pluginInit";
// Swiper
//   import { Swiper, SwiperSlide } from 'swiper/vue'
import { Navigation } from "swiper/modules";
import CountUp from "vue-countup-v3";
import "swiper/css";
import "swiper/scss";
import "swiper/css/navigation";
import axios from "axios";
import moment from "moment";

export default {
  name: "EstruOrgaHospital",
  components: { iqCard, CountUp },
  setup() {
    return {
      modules: [Navigation],
    };
  },
  mounted() {
    xray.index();
    console.log("DOM is rendered");
    console.log(Object.keys(this.currentBitacora).length);
  },

  created() {
    console.log("DOM is created");
    this.getBitacoras();
    this.fetchData();
  },

  methods: {
    getBitacoras() {
      axios
        .get(this.api + "/v1BitacoraDG/")
        .then((response) => {
          console.log(response.data);
          this.bitacoras = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },

    previousPage() {
      if (this.currentPage > 1) {
        this.currentPage--;
      }
    },

    nextPage() {
      if (this.currentPage < this.totalPages) {
        this.currentPage++;
      }
    },

    formatearFecha(fecha) {
      if (moment(fecha, moment.ISO_8601, true).isValid()) {
        return moment(fecha).format("DD/MM/YYYY HH:mm:ss");
      } else {
        return "Sin Fecha";
      }
    },

    formatearDescripcion(descripcion) {
      // Remover la primera parte "Nuevo registro insertado en Aprobaciones_Servicios:"
      descripcion = descripcion.replace(
        "Nuevo registro insertado en Aprobaciones_Servicios:",
        ""
      );

      // Reemplazar los puntos por punto y salto de línea
      let nuevaDescripcion = descripcion.replace(/\./g, ".\n");
      return nuevaDescripcion;
    },

    fetchData() {
      axios
        .get("http://127.0.0.1:8000/hospital/api/v1vista_operaciones_bitacora/")
        .then((response) => {
          // Actualiza los valores de cada categoría con los datos obtenidos de la API
          this.categories[0].value = response.data[0].inserciones;
          this.categories[1].value = response.data[0].actualizaciones;
          this.categories[2].value = response.data[0].eliminaciones;
        })
        .catch((error) => {
          console.error("Error fetching data: ", error);
        });
    },
  },

  data() {
    return {
      bitacoras: [],
      currentBitacora: {},
      api: "http://127.0.0.1:8000/hospital/api",
      bitacora: {
        id: "",
        nombre_tabla: "",
        usuario: "",
        operacion: "",
        descripcion: "",
        fecha_hora: "",
      },
      searchInput: "",
      currentPage: 1, // Página actual
      resultsPerPage: 10, // Resultados por página

      categories: [
        {
          title: "Agregados",
          value: null,
          iconBg: "bg-success",
          icon: "fa fa-arrow-down",
        },
        {
          title: "Actulizados",
          value: null,
          iconBg: "bg-warning",
          icon: "fa fa-refresh",
        },
        {
          title: "Eliminados",
          value: null,
          iconBg: "bg-danger",
          icon: "fa fa-times",
        },
      ],
    };
  },

  computed: {
    filteredData() {
      // Modifica la función para filtrar según el término de búsqueda
      return this.bitacoras.filter((bitacora) => {
        return Object.values(bitacora).some((value) => {
          return String(value)
            .toLowerCase()
            .includes(this.searchInput.toLowerCase());
        });
      });
    },

    paginatedData() {
      const startIndex = (this.currentPage - 1) * this.resultsPerPage;
      const endIndex = startIndex + this.resultsPerPage;
      return this.filteredData
        .slice(startIndex, endIndex)
        .map((item, index) => {
          return {
            ...item,
            index: startIndex + index + 1, // Ajustar el índice para mantener la secuencia numérica continua
          };
        });
    },

    totalPages() {
      return Math.ceil(this.bitacoras.length / this.resultsPerPage);
    },
  },
};
</script>
