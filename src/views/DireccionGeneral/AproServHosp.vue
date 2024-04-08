/* eslint-disable */
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
            <h5>Aprobación de Servicios Hospitalarios</h5>
          </b-col>
          <b-col lg="12">
            <iq-card className="iq-card-block iq-card-stretch iq-card-height1">
              <template v-slot:headerTitle>
                <h4 class="card-title">Gráfico de Solicitudes</h4>
              </template>
              <template v-slot:body>
                <ApexChart
                  element="home-chart-05"
                  :chartOption="chart5"
                  v-if="$route.meta.dark"
                />
                <ApexChart
                  element="home-chart-05"
                  :chartOption="chart5"
                  v-else
                />
              </template>
            </iq-card>
          </b-col>

          <b-col md="12">
            <iq-card>
              <template v-slot:headerTitle>
                <h4 style="text-align: center">
                  Solicitudes de Aprobacion de Procedimientos Clinicos y
                  Quirurgicos
                </h4>
              </template>

              <template v-slot:body>
                <div class="container-fluid">
                  <h3 style="text-align: center">
                    Operaciones CRUD de Solicitudes de Procedimientos Clínicos y
                    Quirúrgicos
                  </h3>
                  <br />
                  <div class="row">
                    <div class="col-md-7">
                      <h5 style="text-align: center">Lista de Solicitudes</h5>
                      <table class="table table-bordered mt-4">
                        <thead>
                          <tr>
                            <th scope="col">N°</th>
                            <th scope="col">Servicio</th>
                            <th scope="col">Departamento Solicitante</th>
                            <th scope="col">Fecha de Solicitud</th>
                            <th scope="col">Estatus</th>
                            <th scope="col">Comentario</th>
                            <th scope="col">Fecha de Aprobación</th>
                            <th scope="col">Acciones</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr
                            v-for="(solicitud, index) in solicitudes"
                            :key="index"
                          >
                            <td>{{ index + 1 }}</td>
                            <td>{{ solicitud.servicio_paciente_id }}</td>
                            <td>{{ solicitud.departamento_solicitante }}</td>
                            <td>{{ solicitud.fecha_solicitud }}</td>
                            <td>{{ solicitud.estatus }}</td>
                            <td>{{ solicitud.comentarios }}</td>
                            <td>{{ solicitud.fecha_aprobacion }}</td>
                            <td>
                              <a href="#" class="edit" title="">
                                <button
                                  class="btn btn-warning btn-sm"
                                  @click="editBtn(solicitud.id)"
                                >
                                  Edita
                                </button>
                              </a>
                              <a href="#" class="edit" title="">
                                <button
                                  class="btn btn-danger btn-sm"
                                  @click="deleteSolicitud(solicitud.id)"
                                >
                                  Elimina
                                </button>
                              </a>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>

                    <!-- There is a current procedimiento to be edited -->
                    <div class="col-md-5">
                      <!-- Edicion de la Solicitudes -->
                      <div
                        v-if="Object.keys(this.currentSolicitud).length !== 0"
                      >
                        <h2 class="alert alert-warning">Actualiza Solicitud</h2>

                        <form
                          @submit.prevent="updateSolicitud(currentSolicitud.id)"
                        >
                          <div class="row">
                            <div class="col">
                              <div class="form-group">
                                <label class="form-label float-left ml-2"
                                  >Servicio</label
                                >
                                <input
                                  type="text"
                                  class="form-control"
                                  v-model="
                                    currentSolicitud.servicio_paciente_id
                                  "
                                />
                              </div>
                            </div>

                            <div class="col">
                              <div class="form-group">
                                <label class="form-label float-left ml-2"
                                  >Departamento</label
                                >
                                <input
                                  type="text"
                                  class="form-control"
                                  v-model="
                                    currentSolicitud.departamento_solicitante
                                  "
                                />
                              </div>
                            </div>
                          </div>

                          <div class="row">
                            <div class="col">
                              <div class="form-group">
                                <label class="form-label float-left ml-2"
                                  >Fecha de Solicitud</label
                                >
                                <input
                                  type="text"
                                  class="form-control"
                                  v-model="currentSolicitud.fecha_solicitud"
                                />
                              </div>
                            </div>
                            <div class="col">
                              <div class="form-group">
                                <label class="form-label float-left ml-2"
                                  >Estado</label
                                >
                                <select
                                  class="form-control"
                                  v-model="currentSolicitud.estatus"
                                >
                                  <option value="Aprobado">Aprobado</option>
                                  <option value="En Proceso">En Proceso</option>
                                  <option value="No Aprobado">
                                    No Aprobado
                                  </option>
                                  <option value="Cancelado">Cancelado</option>
                                </select>
                              </div>
                            </div>
                          </div>

                          <div class="row">
                            <div class="col">
                              <div class="form-group">
                                <label class="form-label float-left ml-2"
                                  >Comentario</label
                                >
                                <input
                                  type="text"
                                  class="form-control"
                                  v-model="currentSolicitud.comentarios"
                                />
                              </div>
                            </div>
                            <div class="col">
                              <div class="form-group">
                                <label class="form-label float-left ml-2"
                                  >Fecha de Aprobacion</label
                                >
                                <input
                                  type="datetime-local"
                                  class="form-control"
                                  v-model="currentSolicitud.fecha_aprobacion"
                                />
                              </div>
                            </div>
                          </div>

                          <button
                            type="submit"
                            class="btn btn-success float-left ml-2"
                          >
                            Actualzar
                          </button>
                        </form>
                      </div>

                      <!-- There is no current procedimiento to be edited -->

                      <!-- Crear Solicitud  -->

                      <div v-else>
                        <h2 class="alert alert-info">Crea Solicitud</h2>
                        <form @submit.prevent="saveSolicitud()">
                          <div class="row">
                            <div class="col">
                              <div class="form-group">
                                <label class="form-label float-left ml-2"
                                  >Servicio</label
                                >
                                <input
                                  type="text"
                                  class="form-control"
                                  v-model="solicitud.servicio_paciente_id"
                                />
                              </div>
                            </div>

                            <div class="col">
                              <div class="form-group">
                                <label class="form-label float-left ml-2"
                                  >Departamento</label
                                >
                                <input
                                  type="text"
                                  class="form-control"
                                  v-model="solicitud.departamento_solicitante"
                                />
                              </div>
                            </div>
                          </div>

                          <div class="row">
                            <div class="col">
                              <div class="form-group">
                                <label class="form-label float-left ml-2"
                                  >Fecha de Solicitud</label
                                >
                                <input
                                  type="datetime-local"
                                  class="form-control"
                                  v-model="solicitud.fecha_solicitud"
                                />
                              </div>
                            </div>
                            <div class="col">
                              <div class="form-group">
                                <label class="form-label float-left ml-2"
                                  >Estatus</label
                                >
                                <select
                                  class="form-control"
                                  v-model="solicitud.estatus"
                                >
                                  <option value="Aprobado">Aprobado</option>
                                  <option value="En Proceso">En Proceso</option>
                                  <option value="No Aprobado">
                                    No Aprobado
                                  </option>
                                  <option value="Cancelado">Cancelado</option>
                                </select>
                              </div>
                            </div>
                          </div>

                          <div class="row">
                            <div class="col">
                              <div class="form-group">
                                <label class="form-label float-left ml-2"
                                  >Comentario</label
                                >
                                <input
                                  type="text"
                                  class="form-control"
                                  v-model="solicitud.comentarios"
                                />
                              </div>
                            </div>
                            <div class="col">
                              <div class="form-group">
                                <label class="form-label float-left ml-2"
                                  >Fecha de Aprobacion</label
                                >
                                <input
                                  type="datetime-local"
                                  class="form-control"
                                  v-model="solicitud.fecha_aprobacion"
                                />
                              </div>
                            </div>
                          </div>

                          <button
                            type="submit"
                            class="btn btn-primary float-left ml-2"
                          >
                            Guardar
                          </button>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </template>
            </iq-card>
          </b-col>

          <b-row>
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
        </b-row>
      </b-col>
    </b-row>

    <!-- --------------------------------------------------------------------------------------------------------------------------->
  </b-container>
</template>

<script>
import IqCard from "../../components/xray/cards/iq-card";
import { xray } from "../../config/pluginInit";
import ApexChart from "../../components/xray/charts/ApexChart";

import axios from "axios";
//import { template } from "lodash";

//import CountUp from 'vue-countup-v3'
const body = document.getElementsByTagName("body");

export default {
  name: "AprobacionServiciosHospitalarios",
  components: { IqCard, ApexChart },
  data() {
    return {
      config: {
        dateFormat: "Y-m-d",
        inline: true,
      },
      chart5: {
        series: [
          {
            name: "Solcitudes Aprobadas",
            data: [44, 55, 41, 67, 22, 43],
          },
          {
            name: "En proceso de aprobación",
            data: [13, 23, 20, 8, 13, 27],
          },
          {
            name: "Solicitudes Negadas",
            data: [11, 17, 15, 15, 21, 14],
          },
          {
            name: "Solicitudes Canceladas",
            data: [11, 17, 15, 15, 21, 14],
          },
        ],
        colors: ["#089bab", "#FC9F5B", "red"],
        chart: {
          type: "bar",
          height: 350,
          stacked: true,
          toolbar: {
            show: true,
          },
          zoom: {
            enabled: true,
          },
        },
        responsive: [
          {
            breakpoint: 480,
            options: {
              legend: {
                position: "bottom",
                offsetX: -10,
                offsetY: 0,
              },
            },
          },
        ],
        plotOptions: {
          bar: {
            horizontal: false,
          },
        },
        xaxis: {
          type: "datetime",
          categories: [
            "01/01/2011 GMT",
            "01/02/2011 GMT",
            "01/03/2011 GMT",
            "01/04/2011 GMT",
            "01/05/2011 GMT",
            "01/06/2011 GMT",
          ],
        },
        legend: {
          position: "right",
          offsetY: 40,
        },
        fill: {
          opacity: 1,
        },
      },

      solicitudes: [],
      currentSolicitud: {},
      api: "http://127.0.0.1:8000/hospital/api",
      solicitud: {
        id: "",
        servicio_paciente_id: "",
        departamento_solicitante: "",
        fecha_solicitud: "",
        estatus: "",
        comentarios: "",
        fecha_aprobacion: "",
      },
    };
  },

  mounted() {
    xray.index();
    body[0].classList.add("sidebar-main-menu");
    console.log("DOM is rendered");
    console.log(Object.keys(this.currentSolicitud).length);
  },
  unmounted() {
    body[0].classList.remove("sidebar-main-menu");
  },

  created() {
    console.log("DOM is created");
    this.getSolicitudes();
  },

  methods: {
    getSolicitudes() {
      axios
        .get(this.api + "/v1AprobacionesServicios/")
        .then((response) => {
          console.log(response.data);
          this.solicitudes = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },

    saveSolicitud() {
      axios
        .post(this.api + "/v1AprobacionesServicios/", this.solicitud)
        .then((response) => {
          console.log(response.data);
          this.getSolicitudes();
          this.solicitud = {};
        })
        .catch((error) => {
          console.log(error);
        });
    },

    editBtn(id) {
      console.log(id);
      this.solicitudes.map((solicitud) => {
        if (solicitud.id === id) {
          console.log(solicitud.servicio_paciente_id);
          this.currentSolicitud = {
            id: solicitud.id,
            servicio_paciente_id: solicitud.servicio_paciente_id,
            departamento_solicitante: solicitud.departamento_solicitante,
            fecha_solicitud: solicitud.fecha_solicitud,
            estatus: solicitud.estatus,
            comentarios: solicitud.comentarios,
            fecha_aprobacion: solicitud.fecha_aprobacion,
          };
        }
      });
    },

    updateSolicitud(id) {
      axios
        .put(
          this.api + `/v1AprobacionesServicios/${id}/`,
          this.currentSolicitud
        )
        .then((response) => {
          console.log(response.data);
          this.getSolicitudes();
          this.currentSolicitud = {};
        })
        .catch((error) => {
          console.log(error);
        });
    },

    deleteSolicitud(id) {
      axios
        .delete(this.api + `/v1AprobacionesServicios/${id}/`, id)
        .then((response) => {
          console.log(response.data);
          this.getSolicitudes();
        })
        .catch((error) => {
          console.log(error);
        });
    },

    getVista() {
      axios
        .get("http://127.0.0.1:8000/hospital/api/v1VistaEstadoSolicitudes/")
        .then((response) => {
          console.log(response.data);
          console.log("envio");
          // Actualizar series de la gráfica con los datos obtenidos
          this.chart5.series = [
            { name: "Solcitudes Aprobadas", data: [5] },
            { name: "En proceso de aprobación", data: [] },
            { name: "Solicitudes Negadas", data: [] },
            { name: "Solicitudes Canceladas", data: [] },
          ];

          // Iterar sobre los datos obtenidos y agregarlos a las series correspondientes
          response.data.forEach((item) => {
            this.chart5.series[0].data.push(item.num_aprobadas);
            this.chart5.series[1].data.push(item.num_en_proceso);
            this.chart5.series[2].data.push(item.num_no_aprobadas);
            this.chart5.series[3].data.push(item.num_canceladas);
          });
        })
        .catch((error) => {
          console.error("Error al obtener las solicitudes:", error);
        });
    },
  },
};
</script>
/* eslint-disable */
