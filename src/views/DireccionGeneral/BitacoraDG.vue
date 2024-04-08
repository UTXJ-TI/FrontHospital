<template>
  <b-container fluid>
    <b-row>
      <b-col sm="12">
        <h1 style="text-align: center; font-size: 30px">
          Bitácora de Dirección del Hospital
        </h1>

        <b-row>
          <div style="margin-left: auto; margin-right: auto; max-width: 1200px">
            <div style="display: flex; justify-content: space-between">
              <b-col md="6" lg="3">
                <iq-card body-class=" rounded">
                  <template v-slot:body>
                    <div
                      class="d-flex align-items-center justify-content-between"
                    >
                      <div class="text-left">
                        <h4 class="mb-2 mt-2">Médicos</h4>
                        <h3 class="mb-0 line-height">
                          <span
                            ><count-up :end-val="1200" duration="5"></count-up
                          ></span>
                        </h3>
                      </div>
                      <div class="rounded-circle iq-card-icon bg-primary">
                        <i class="ri-task-line"></i>
                      </div>
                    </div>
                  </template>
                </iq-card>
              </b-col>
              <b-col md="6" lg="3">
                <iq-card body-class=" rounded">
                  <template v-slot:body>
                    <div
                      class="d-flex align-items-center justify-content-between"
                    >
                      <div class="text-left">
                        <h4 class="mb-2 mt-2">Enfermeras</h4>
                        <h3 class="mb-0 line-height">
                          <span
                            ><count-up :end-val="800" duration="5"></count-up
                          ></span>
                        </h3>
                      </div>
                      <div class="rounded-circle iq-card-icon bg-warning">
                        <i class="ri-hospital-line"></i>
                      </div>
                    </div>
                  </template>
                </iq-card>
              </b-col>
              <b-col md="6" lg="3">
                <iq-card body-class=" rounded">
                  <template v-slot:body>
                    <div
                      class="d-flex align-items-center justify-content-between"
                    >
                      <div class="text-left">
                        <h4 class="mb-2 mt-2">Pacientes</h4>
                        <h3 class="mb-0 line-height">
                          <span
                            ><count-up :end-val="6899" duration="5"></count-up
                          ></span>
                        </h3>
                      </div>
                      <div class="rounded-circle iq-card-icon bg-danger">
                        <i class="ri-gradienter-line"></i>
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

            <form id="search">
              <p>Buscar</p>
              <input title="searchField" v-model="searchInput" />
            </form>

            <!-- <database-website-component :entries="dataset" :columns="dataColumns" :filter-key="searchInput">
                </database-website-component> -->

            <!-- --------------------------------------------------------- -->
          </template>

          <template v-slot:body>
            <div class="table-responsive mb-5">
              <table class="table mb-3 table-borderless">
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
                  <tr v-for="(bitacora, index) in paginatedData" :key="index">
                    <td>{{ index + 1 }}</td>
                    <td>{{ bitacora.nombre_tabla }}</td>
                    <td>{{ bitacora.usuario }}</td>
                    <td>{{ bitacora.operacion }}</td>
                    <td>{{ bitacora.descripcion }}</td>
                    <td>{{ bitacora.fecha_hora }}</td>
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
