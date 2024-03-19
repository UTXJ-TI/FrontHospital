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
                <h4 class="card-title">Grafico de Solicitudes</h4>
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
                    Operaciones CRUD de Solicitudes de Procediemintos Clinicos y
                    Quirurgicos
                  </h3>
                  <br />
                  <div class="row">
                    <div class="col-md-7">
                      <h5 style="text-align: center">Lista de Solicitudes</h5>
                      <table class="table table-bordered mt-4">
                        <thead>
                          <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Servicio</th>
                            <th scope="col">Departamento</th>
                            <th scope="col">Fecha de Solicitud</th>
                            <th scope="col">Estatus</th>
                            <th scope="col">Comentarios</th>
                            <th scope="col">Fecha de Aprobación</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr
                            v-for="procedimiento in procedimientos"
                            :key="procedimiento.id"
                          >
                            <td>{{ procedimiento.ID }}</td>
                            <td>{{ procedimiento.Servicio_Paciente_ID }}</td>
                            <td>
                              {{ procedimiento.Departamento_Solicitante }}
                            </td>
                            <td>{{ procedimiento.Fecha_Solicitud }}</td>
                            <td>{{ procedimiento.Estatus }}</td>
                            <td>{{ procedimiento.Comentarios }}</td>
                            <td>{{ procedimiento.Fecha_Aprobacion }}</td>
                            <td>
                              <a href="#" class="edit" title=""
                                ><button
                                  class="btn btn-warning btn-sm"
                                  @click="editBtn(procedimiento.id)"
                                >
                                  Editar
                                </button></a
                              >
                              <a href="#" class="edit ml-1" title=""
                                ><button
                                  class="btn btn-danger btn-sm"
                                  @click="deleteprocedimiento(procedimiento.id)"
                                >
                                  Eliminar
                                </button></a
                              >
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>

                    <!-- There is a current procedimiento to be edited -->
                    <div class="col-md-5">
                      <div
                        v-if="
                          Object.keys(this.currentProcedimeinto).length !== 0
                        "
                      >
                        <h5 style="text-align: center">Edita la Solicitud</h5>
                        <form
                          @submit.prevent="
                            updateprocedimiento(currentProcedimeinto.id)
                          "
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
                                  v-model="currentProcedimeinto.name"
                                />
                              </div>
                            </div>

                            <div class="col">
                              <div class="form-group">
                                <label class="form-label float-left ml-2"
                                  >Departamento</label
                                >
                                <input
                                  type="email"
                                  class="form-control"
                                  v-model="currentProcedimeinto.email"
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
                                  type="date"
                                  class="form-control"
                                  v-model="currentProcedimeinto.course"
                                />
                              </div>
                            </div>

                            <div class="col">
                              <div>
                                <label class="form-label float-left ml-2"
                                  >Estatus</label
                                >
                                <input
                                  type="text"
                                  class="form-control"
                                  v-model="currentProcedimeinto.status"
                                />
                              </div>
                            </div>

                            <div class="col">
                              <div>
                                <label class="form-label float-left ml-2"
                                  >Comentario</label
                                >
                                <input
                                  type="text"
                                  class="form-control"
                                  v-model="currentProcedimeinto.comment"
                                />
                              </div>
                            </div>

                            <div class="col">
                              <div class="form-group">
                                <label class="form-label float-left ml-2"
                                  >Fecha de Aprobacion</label
                                >
                                <input
                                  type="date"
                                  class="form-control"
                                  v-model="currentProcedimeinto.approvalDate"
                                />
                              </div>
                            </div>
                          </div>

                          <button
                            type="submit"
                            class="btn btn-success float-left ml-2"
                          >
                            Actualizar
                          </button>
                        </form>
                      </div>

                      <!-- There is no current procedimiento to be edited -->

                      <div v-else>
                        <h5 style="text-align: center">Crea una Solicitud</h5>
                        <form @submit.prevent="saveprocedimiento()">
                          <div class="row">
                            <div class="col">
                              <div class="form-group">
                                <label class="form-label float-left ml-2"
                                  >Servicio</label
                                >
                                <input
                                  type="text"
                                  class="form-control"
                                  v-model="procedimiento.name"
                                />
                              </div>
                            </div>

                            <div class="col">
                              <div class="form-group">
                                <label class="form-label float-left ml-2"
                                  >Departamento</label
                                >
                                <input
                                  type="email"
                                  class="form-control"
                                  v-model="procedimiento.email"
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
                                  type="date"
                                  class="form-control"
                                  v-model="procedimiento.course"
                                />
                              </div>
                            </div>

                            <div class="col">
                              <div>
                                <label class="form-label float-left ml-2"
                                  >Estatus</label
                                >
                                <input
                                  type="text"
                                  class="form-control"
                                  v-model="currentProcedimeinto.status"
                                />
                              </div>
                            </div>

                            <div class="col">
                              <div>
                                <label class="form-label float-left ml-2"
                                  >Comentario</label
                                >
                                <input
                                  type="text"
                                  class="form-control"
                                  v-model="currentProcedimeinto.comment"
                                />
                              </div>
                            </div>

                            <div class="col">
                              <div class="form-group">
                                <label class="form-label float-left ml-2"
                                  >Fecha de Aprobacion</label
                                >
                                <input
                                  type="date"
                                  class="form-control"
                                  v-model="currentProcedimeinto.approvalDate"
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

      procedimientos: [],
      currentProcedimeinto: {},
      api: "http://127.0.0.1:8000/api",
      procedimiento: {
        ID: "",
        Servicio: "",
        Departamento: "",
        Fecha_Solicitud: "",
        Estatus: "",
        Comentarios: "",
        Fecha_Aprobacion: "",
      },
    };
  },

  mounted() {
    xray.index();
    body[0].classList.add("sidebar-main-menu");
    console.log("DOM is rendered");
    console.log(Object.keys(this.currentProcedimeinto).length);
  },
  unmounted() {
    body[0].classList.remove("sidebar-main-menu");
  },

  created() {
    console.log("DOM is created");
    this.getprocedimientos();
  },

  methods: {
    getprocedimientos() {
      axios
        .get(this.api + "/procedimientos/")
        .then((response) => {
          console.log(response.data);
          this.procedimientos = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },

    saveprocedimiento() {
      axios
        .post(this.api + "/procedimientos/", this.procedimiento)
        .then((response) => {
          console.log(response.data);
          this.getprocedimientos();
          this.procedimiento = {};
        })
        .catch((error) => {
          console.log(error);
        });
    },

    editBtn(id) {
      console.log(id);
      this.procedimientos.map((procedimiento) => {
        if (procedimiento.id === id) {
          console.log(procedimiento.name);
          this.currentProcedimeinto = {
            id: procedimiento.id,
            name: procedimiento.name,
            email: procedimiento.email,
            course: procedimiento.course,
            gender: procedimiento.gender,
            staus: procedimiento.status,
            comment: procedimiento.comment,
            approvalDate: procedimiento.approvalDate,
          };
        }
      });
    },

    updateprocedimiento(id) {
      axios
        .put(this.api + `/procedimientos/${id}/`, this.currentProcedimeinto)
        .then((response) => {
          console.log(response.data);
          this.getprocedimientos();
          this.currentProcedimeinto = {};
        })
        .catch((error) => {
          console.log(error);
        });
    },

    deleteprocedimiento(id) {
      axios
        .delete(this.api + `/procedimientos/${id}/`, id)
        .then((response) => {
          console.log(response.data);
          this.getprocedimientos();
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>
/* eslint-disable */
