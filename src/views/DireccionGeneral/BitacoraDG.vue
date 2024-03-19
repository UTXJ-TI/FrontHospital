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
                  <tr>
                    <th scope="col">Nombre</th>
                    <th scope="col">Usuario</th>
                    <th scope="col">Operación</th>
                    <th scope="col">Descripción</th>
                    <th scope="col">Fecha</th>
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
                    <td>{{ data.Nombre }}</td>
                    <td>{{ data.Usuario }}</td>
                    <td>{{ data.Operacion }}</td>
                    <td>{{ data.Descripcion }}</td>
                    <td>{{ data.Fecha }}</td>
                  </tr>
                </tbody>
              </table>
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
          Nombre: "Direccion_General",
          Usuario: "Usuario",
          Operacion: "Insert",
          Descripcion:
            "Prueba de integracion de informaciona a la bitacora de Dirección General",
          Fecha: "2024-01-15 14:14:04",
        },
        {
          id: 2,
          Nombre: "Direccion_General",
          Usuario: "Usuario",
          Operacion: "Insert",
          Descripcion:
            "Prueba de integracion de informaciona a la bitacora de Dirección General",
          Fecha: "2024-01-15 14:14:04",
        },
        {
          id: 3,
          Nombre: "Direccion_General",
          Usuario: "Usuario",
          Operacion: "Insert",
          Descripcion:
            "Prueba de integracion de informaciona a la bitacora de Dirección General",
          Fecha: "2024-01-15 14:14:04",
        },
        {
          id: 4,
          Nombre: "Direccion_General",
          Usuario: "Usuario",
          Operacion: "Insert",
          Descripcion:
            "Prueba de integracion de informaciona a la bitacora de Dirección General",
          Fecha: "2024-01-15 14:14:04",
        },
        {
          id: 5,
          Nombre: "Direccion_General",
          Usuario: "Usuario",
          Operacion: "Insert",
          Descripcion:
            "Prueba de integracion de informaciona a la bitacora de Dirección General",
          Fecha: "2024-01-15 14:14:04",
        },
        {
          id: 6,
          Nombre: "Direccion_General",
          Usuario: "Usuario",
          Operacion: "Insert",
          Descripcion:
            "Prueba de integracion de informaciona a la bitacora de Dirección General",
          Fecha: "2024-01-15 14:14:04",
        },
        {
          id: 7,
          Nombre: "Direccion_General",
          Usuario: "Usuario",
          Operacion: "Insert",
          Descripcion:
            "Prueba de integracion de informaciona a la bitacora de Dirección General",
          Fecha: "2024-01-15 14:14:04",
        },
        {
          id: 8,
          Nombre: "Direccion_General",
          Usuario: "Usuario",
          Operacion: "Insert",
          Descripcion:
            "Prueba de integracion de informaciona a la bitacora de Dirección General",
          Fecha: "2024-01-15 14:14:04",
        },
        {
          id: 9,
          Nombre: "Direccion_General",
          Usuario: "Usuario",
          Operacion: "Insert",
          Descripcion:
            "Prueba de integracion de informaciona a la bitacora de Dirección General",
          Fecha: "2024-01-15 14:14:04",
        },
        {
          id: 10,
          Nombre: "Direccion_General",
          Usuario: "Usuario",
          Operacion: "Insert",
          Descripcion:
            "Prueba de integracion de informaciona a la bitacora de Dirección General",
          Fecha: "2024-01-15 14:14:04",
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
