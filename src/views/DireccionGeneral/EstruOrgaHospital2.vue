<template>
  <b-container fluid>
    <b-row>
      <b-col sm="12">
        <h1 style="text-align: center; font-size: 30px">
          Estructura Orgánica del Hospital
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
            <h4 class="card-title">Servicios Médicos</h4>

            <div
              style="margin-left: auto; margin-right: auto; max-width: 1200px"
            >
              <div class="row">
                <b-col>
                  <iq-card>
                    <template v-slot:body>
                      <div class="text-center">
                        <button
                          style="margin: 0 auto"
                          class="btn btn-primary"
                          onclick="window.location.href='/estrucutura-organica-hospital'"
                        >
                          Servicios Hospitalarios
                        </button>
                      </div>
                    </template>
                  </iq-card>
                </b-col>

                <!-- <b-col>
                    <iq-card>
                      <template v-slot:body>
                        <div class="text-center">
                          <button style="margin: 0 auto;" class="btn btn-primary" onclick="window.location.href='/estrucutura-organica-hospital2'">Servicios Medicos</button>
                        </div>
                      </template>
                    </iq-card>
                  </b-col> -->
              </div>
            </div>
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
                  <tr>
                    <th scope="col">Clave</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Descripcion</th>
                    <th scope="col">Tipo</th>
                    <th scope="col">Depatamento</th>
                    <th scope="col">Instalacion Superior</th>
                    <th scope="col">Estatus</th>
                  </tr>
                </thead>
                <tbody v-for="data in globalRecord" :key="data.id">
                  <tr>
                    <td v-for="data1 in data.country" :key="data1.id">
                      <img
                        :src="data1.counreyImg"
                        class="img-fluid"
                        alt="country-flag"
                      />
                      <span class="mx-2">{{ data1.countryName }}</span>
                    </td>
                    <td>{{ data.Clave }}</td>
                    <td>{{ data.Nombre }}</td>
                    <td>{{ data.Descripcion }}</td>
                    <td>{{ data.Tipo }}</td>
                    <td>{{ data.Departamento_id }}</td>
                    <td>{{ data.Instalacion_superior_id }}</td>
                    <td>{{ data.Estatus }}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </template>
        </iq-card>
      </b-col>

      <div style="margin-left: auto; margin-right: auto; max-width: 1200px">
        <div style="display: flex; justify-content: space-between">
          <b-col md="6" lg="6">
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
          <!--     
              <b-col md="6" lg="3">
                <iq-card>
                  <template v-slot:body>
                    <div
                      class="iq-card-body p-0 rounded"
                      :style="`background: url(${require('../../assets/images/page-img/imagenes-direccionGeneral/servicioshospitalarios.jpg')}) no-repeat scroll center center; background-size: contain;  min-height: 146px;`"
                    ></div>
                    <h4 class="mb-2 mt-2" style="text-align: center;">Estructura Organica del Hospital</h4>
                    <div class="text-center">
                      <button class="btn btn-primary" onclick="window.location.href='/estrucutura-organica-hospital'">Conoce Más</button>
                    </div>
                  </template>
                </iq-card>
              </b-col> -->

          <b-col md="6" lg="6">
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
  },
  data() {
    return {
      globalRecord: [
        {
          id: 1,
          Clave: "HG-CS",
          Nombre: "Pediatría",
          Descripcion: "Cosultorio Pediatrico",
          Tipo: "Area Ifaltil",
          Departamento_id: 1,
          Instalacion_superior_id: 1,
          Estatus: "Activo",
        },
        // Más datos aquí si es necesario
      ],
      searchInput: "",
    };
  },
  computed: {
    filteredData() {
      return this.globalRecord.filter((data) => {
        return Object.values(data).some((value) => {
          return String(value)
            .toLowerCase()
            .includes(this.searchInput.toLowerCase());
        });
      });
    },
  },
};
</script>
