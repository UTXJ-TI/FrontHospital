<template>
  <b-container fluid>
    <b-row>
      <b-col sm="12">
        <h1 style="text-align: center; font-size: 30px">
          Dashboard General del Hospital
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

        <b-row>
          <b-col md="6" lg="3">
            <iq-card>
              <template v-slot:body>
                <div
                  class="iq-progress-bar progress-bar-vertical iq-bg-primary"
                >
                  <span class="bg-primary" data-percent="70"></span>
                </div>
                <span class="line-height-4">10 feb, 2020</span>
                <h4 class="mb-2 mt-2">Pacientes Recuperados</h4>
                <p class="mb-0 text-secondary line-height">Ultimo Reporte</p>
              </template>
            </iq-card>
          </b-col>
          <b-col md="6" lg="3">
            <iq-card>
              <template v-slot:body>
                <div class="iq-progress-bar progress-bar-vertical iq-bg-danger">
                  <span class="bg-danger" data-percent="50"></span>
                </div>
                <span class="line-height-4">12 Jan, 2020</span>
                <h4 class="mb-2 mt-2">Pacientes Hospitalizados</h4>
                <p class="mb-0 text-secondary line-height">Ultimo Reporte</p>
              </template>
            </iq-card>
          </b-col>
          <b-col md="6" lg="3">
            <iq-card>
              <template v-slot:body>
                <div
                  class="iq-progress-bar progress-bar-vertical iq-bg-warning"
                >
                  <span class="bg-warning" data-percent="80"></span>
                </div>
                <span class="line-height-4">15 feb, 2020</span>
                <h4 class="mb-2 mt-2">Defunciones</h4>
                <p class="mb-0 text-secondary line-height">Ultimo Reporte</p>
              </template>
            </iq-card>
          </b-col>
          <b-col md="6" lg="3">
            <iq-card class="iq-card-block iq-card-height">
              <div
                class="iq-card-body p-0 rounded"
                :style="`background: url(${require('../../assets/images/page-img/38.jpg')}) no-repeat scroll center center; background-size: contain;  min-height: 146px;`"
              ></div>
            </iq-card>
          </b-col>
        </b-row>
      </b-col>

      <b-col lg="12">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Pacientes Atendidos en las Ultimas Horas</h4>
          </template>
          <template v-slot:body>
            <ApexChart
              element="home-chart-06"
              :chartOption="darkChart1"
              v-if="$route.meta.dark"
            />
            <ApexChart element="home-chart-06" :chartOption="chart1" v-else />
          </template>
        </iq-card>
      </b-col>

      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Pacientes Atendidos en Servicios Medicos</h4>
          </template>
          <template v-slot:body>
            <!-- <EChart theme="light" chartType="area" /> -->
            <v-chart class="chart" :option="BarChart" />
          </template>
        </iq-card>
      </b-col>

      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Solicitudes al Banco de Sangre</h4>
          </template>
          <template v-slot:body>
            <!-- <EChart theme="light" chartType="area" /> -->
            <v-chart class="chart" :option="DoughnutChartOption" />
          </template>
        </iq-card>
      </b-col>
    </b-row>

    <b-row>
      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Solicitud de Transplantes</h4>
          </template>
          <template v-slot:body>
            <!-- <EChart theme="light" chartType="area" /> -->
            <v-chart class="chart" :option="PieChartOption" />
            <!-- <CanvasJSChart :options="options" :style="styleOptions" @chart-ref="chartInstance"/> -->
          </template>
        </iq-card>
      </b-col>

      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Pacientes Recuperados y Pacientes en Reingreso</h4>
          </template>
          <template v-slot:body>
            <!-- <EChart theme="light" chartType="area" /> -->
            <v-chart class="chart" :option="RadarChartOption" />
            <!-- <CanvasJSChart :options="options" :style="styleOptions" @chart-ref="chartInstance"/> -->
          </template>
        </iq-card>
      </b-col>

      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Departamentos con Calidad de Atención Médica</h4>
          </template>
          <template v-slot:body>
            <!-- <EChart theme="light" chartType="scatter" /> -->
            <v-chart class="chart" :option="BubbleChartOption" />
          </template>
        </iq-card>
      </b-col>

      <b-col lg="6">
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Crecimiento en el Nivel de Atencion del Hospital</h4>
          </template>
          <template v-slot:body>
            <!-- <EChart theme="light" chartType="scatter" /> -->
            <v-chart class="chart" :option="ScatterChartOption" />
          </template>
        </iq-card>
      </b-col>
    </b-row>

    <b-row>
      <b-col lg="6">
        <iq-card class="">
          <div class="iq-card-body">
            <h6>Nuevos Nacimientos</h6>
            <h3><b>5075</b></h3>
          </div>
          <div id="wave-chart-7"></div>
          <ApexChart element="wave-chart-7" :chartOption="chart7" />
        </iq-card>
        <iq-card>
          <div class="iq-card-body">
            <h6>Nuevos Pacientes Registrados</h6>
            <h3><b>1200</b></h3>
          </div>
          <div id="wave-chart-8"></div>
          <ApexChart element="wave-chart-8" :chartOption="chart8" />
        </iq-card>
      </b-col>

      <b-col lg="6">
        <iq-card
          body-class="hospital-mgt"
          class="iq-card-block iq-card-height1"
        >
          <template v-slot:headerTitle>
            <h4 class="card-title">Camas Disponibles por Área</h4>
          </template>
          <div class="iq-card-body hospital-mgt">
            <div class="progress mb-4" style="height: 30px">
              <div
                class="progress-bar bg-primary"
                role="progressbar"
                style="width: 20%"
                aria-valuenow="15"
                aria-valuemin="0"
                aria-valuemax="100"
              >
                Pediatria
              </div>
              <div
                class="progress-bar bg-warning"
                role="progressbar"
                style="width: 80%"
                aria-valuenow="30"
                aria-valuemin="0"
                aria-valuemax="100"
              >
                80%
              </div>
            </div>
            <div class="progress mb-4" style="height: 30px">
              <div
                class="progress-bar bg-primary"
                role="progressbar"
                style="width: 30%"
                aria-valuenow="15"
                aria-valuemin="0"
                aria-valuemax="100"
              >
                Terapia Intensiva
              </div>
              <div
                class="progress-bar bg-warning"
                role="progressbar"
                style="width: 70%"
                aria-valuenow="30"
                aria-valuemin="0"
                aria-valuemax="100"
              >
                70%
              </div>
            </div>
            <div class="progress mb-4" style="height: 30px">
              <div
                class="progress-bar bg-primary"
                role="progressbar"
                style="width: 60%"
                aria-valuenow="15"
                aria-valuemin="0"
                aria-valuemax="100"
              >
                Cardiologia
              </div>
              <div
                class="progress-bar bg-warning"
                role="progressbar"
                style="width: 40%"
                aria-valuenow="30"
                aria-valuemin="0"
                aria-valuemax="100"
              >
                85%
              </div>
            </div>
            <div class="progress mb-4" style="height: 30px">
              <div
                class="progress-bar bg-primary"
                role="progressbar"
                style="width: 40%"
                aria-valuenow="15"
                aria-valuemin="0"
                aria-valuemax="100"
              >
                Urgencias
              </div>
              <div
                class="progress-bar bg-warning"
                role="progressbar"
                style="width: 60%"
                aria-valuenow="30"
                aria-valuemin="0"
                aria-valuemax="100"
              >
                70%
              </div>
            </div>
            <div class="progress mb-4" style="height: 30px">
              <div
                class="progress-bar bg-primary"
                role="progressbar"
                style="width: 35%"
                aria-valuenow="15"
                aria-valuemin="0"
                aria-valuemax="100"
              >
                Neumologia
              </div>
              <div
                class="progress-bar bg-warning"
                role="progressbar"
                style="width: 65%"
                aria-valuenow="30"
                aria-valuemin="0"
                aria-valuemax="100"
              >
                95%
              </div>
            </div>
            <div class="progress" style="height: 30px">
              <div
                class="progress-bar bg-primary"
                role="progressbar"
                style="width: 28%"
                aria-valuenow="15"
                aria-valuemin="0"
                aria-valuemax="100"
              >
                Geriatria
              </div>
              <div
                class="progress-bar bg-warning"
                role="progressbar"
                style="width: 75%"
                aria-valuenow="30"
                aria-valuemin="0"
                aria-valuemax="100"
              >
                35%
              </div>
            </div>
          </div>
        </iq-card>
      </b-col>
    </b-row>

    <b-row>
      <b-col lg="12">
        <iq-card body-class="pl-0 pr-0">
          <template v-slot:headerTitle>
            <h4 class="card-title">Departamentos más Solicitados</h4>
          </template>
          <template v-slot:body>
            <AmChart
              element="home-chart-03"
              :type="radialChat.type"
              :option="radialChat.data"
              :height="radialChat.height"
            />
          </template>
        </iq-card>
      </b-col>

      <b-row>
        <b-col lg="6" v-for="(item, index) in charts" :key="index">
          <iq-card>
            <template v-slot:headerTitle>
              <h4>{{ item.title }}</h4>
            </template>
            <template v-slot:body>
              <AmChart
                :element="item.type"
                :type="item.type"
                :option="item.bodyData"
              />
            </template>
          </iq-card>
        </b-col>
      </b-row>

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
        </div>
      </div>
    </b-row>
  </b-container>
</template>
<script>
import IqCard from "../../components/xray/cards/iq-card";
import { xray } from "../../config/pluginInit";
import CountUp from "vue-countup-v3";
const body = document.getElementsByTagName("body");
import ApexChart from "../../components/xray/charts/ApexChart";
import AmChart from "../../components/xray/charts/AmChart";
//import FlatPicker from 'vue-flatpickr-component'

import {
  TitleComponent,
  TooltipComponent,
  LegendComponent,
} from "echarts/components";
import VChart from "vue-echarts";
import { use } from "echarts/core";
import { CanvasRenderer } from "echarts/renderers";
import { PieChart } from "echarts/charts";
import { ref } from "vue";

import * as echarts from "echarts";

export default {
  name: "DashboardFour",
  components: { IqCard, ApexChart, CountUp, AmChart, VChart },
  setup() {
    use([
      CanvasRenderer,
      PieChart,
      TitleComponent,
      TooltipComponent,
      LegendComponent,
    ]);

    const LineChartOption = ref({
      xAxis: {
        type: "category",
        boundaryGap: false,
        data: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
      },
      yAxis: {
        type: "value",
      },
      series: [
        {
          data: [150, 230, 224, 218, 135, 147, 260],
          type: "line",
          itemStyle: {
            color: "rgba(8, 155, 171, 1)",
          },
        },
      ],
    });
    const ColumnBarChartOption = ref({
      // title: {
      //   text: 'World Population',
      //   left: 'center'
      // },
      color: ["#81C2FF", "#FFBF00"],
      title: {
        text: "US and USSR nuclear stockpiles",
        subtext: "Sources: thebulletin.org",
        left: "center",
      },
      tooltip: {
        trigger: "axis",
        axisPointer: {
          type: "cross",
          label: {
            backgroundColor: "#6a7985",
          },
        },
      },
      toolbox: {
        feature: {
          saveAsImage: {},
        },
      },
      grid: {
        left: "3%",
        right: "4%",
        bottom: "3%",
        containLabel: true,
      },
      xAxis: [
        {
          type: "category",
          boundaryGap: false,
          data: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
        },
      ],
      yAxis: [
        {
          type: "value",
        },
      ],
      series: [
        {
          name: "Line 4",
          type: "line",
          stack: "Total",
          smooth: true,
          lineStyle: {
            width: 0,
          },
          showSymbol: false,
          areaStyle: {
            opacity: 0.8,
            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
              {
                offset: 0,
                color: "#81C2FF",
              },
              {
                offset: 1,
                color: "#81C2FF",
              },
            ]),
          },
          emphasis: {
            focus: "series",
          },
          data: [220, 402, 231, 134, 190, 230, 120],
        },
        {
          name: "Line 5",
          type: "line",
          stack: "Total",
          smooth: true,
          lineStyle: {
            width: 0,
          },
          showSymbol: false,
          label: {
            show: true,
            position: "top",
          },
          areaStyle: {
            opacity: 0.8,
            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
              {
                offset: 0,
                color: "#63D584",
              },
              {
                offset: 1,
                color: "#63D584",
              },
            ]),
          },
          emphasis: {
            focus: "series",
          },
          data: [220, 302, 181, 234, 210, 290, 150],
        },
      ],
    });

    const PieChartOption = ref({
      tooltip: {
        trigger: "item",
      },
      legend: {
        orient: "vertical",
        left: "left",
      },
      series: [
        {
          name: "Access From",
          type: "pie",
          radius: "50%",
          data: [
            { value: 1048, name: "January" },
            { value: 735, name: "February" },
            { value: 580, name: "March" },
            { value: 484, name: "April" },
            { value: 300, name: "May" },
          ],
          emphasis: {
            itemStyle: {
              shadowBlur: 10,
              shadowOffsetX: 0,
              shadowColor: "rgba(0, 0, 0, 0.5)",
            },
          },
        },
      ],
    });
    const GaugeChartOption = ref({
      title: {
        text: "Speedometer",
        left: "center",
      },
      series: [
        {
          type: "gauge",
          axisLine: {
            lineStyle: {
              width: 20,
              color: [
                [0.3, "#67e0e3"],
                [0.7, "#37a2da"],
                [1, "#fd666d"],
              ],
            },
          },
          pointer: {
            itemStyle: {
              color: "auto",
            },
          },
          axisTick: {
            distance: -10,
            length: 10,
            lineStyle: {
              color: "#fff",
              width: 2,
            },
          },
          splitLine: {
            distance: -50,
            length: 50,
            lineStyle: {
              color: "#fff",
              width: 4,
            },
          },
          axisLabel: {
            color: "inherit",
            distance: 30,
            fontSize: 15,
          },
          detail: {
            valueAnimation: true,
            formatter: "{value} km/h",
            fontSize: 20,
            color: "inherit",
          },
          data: [
            {
              value: 70,
            },
          ],
        },
      ],
    });
    const AreaChartOption = ref({
      color: ["#80FFA5", "#00DDFF", "#37A2FF", "#FF0087", "#FFBF00"],

      xAxis: [
        {
          type: "category",
          boundaryGap: false,
          data: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
        },
      ],
      yAxis: [
        {
          type: "value",
        },
      ],
      series: [
        {
          data: [820, 932, 901, 934, 1290, 1330, 1320],
          type: "line",
          areaStyle: {},
          itemStyle: {
            color: "rgba(8, 155, 171, 1)",
          },
        },
      ],
    });
    const ScatterChartOption = ref({
      xAxis: {},
      yAxis: {},
      series: [
        {
          symbolSize: 20,
          data: [
            [10.0, 8.04],
            [8.07, 6.95],
            [13.0, 7.58],
            [9.05, 8.81],
            [11.0, 8.33],
            [14.0, 7.66],
            [13.4, 6.81],
            [10.0, 6.33],
            [14.0, 8.96],
            [12.5, 6.82],
            [9.15, 7.2],
            [11.5, 7.2],
            [3.03, 4.23],
            [12.2, 7.83],
            [2.02, 4.47],
            [1.05, 3.33],
            [4.05, 4.96],
            [6.03, 7.24],
            [12.0, 6.26],
            [12.0, 8.84],
            [7.08, 5.82],
            [5.02, 5.68],
          ],
          type: "scatter",
          itemStyle: {
            color: "rgba(8, 155, 171, 1)",
          },
        },
      ],
    });
    const DualAxesLineColumnOption = ref({
      tooltip: {
        trigger: "axis",
        axisPointer: {
          type: "cross",
          crossStyle: {
            color: "#999",
          },
        },
      },
      toolbox: {
        feature: {
          dataView: { show: true, readOnly: false },
          magicType: { show: true, type: ["line", "bar"] },
          restore: { show: true },
          saveAsImage: { show: true },
        },
      },
      legend: {
        data: ["Evaporation", "Precipitation", "Temperature"],
      },
      xAxis: [
        {
          type: "category",
          data: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
          axisPointer: {
            type: "shadow",
          },
        },
      ],
      yAxis: [
        {
          type: "value",
          name: "Precipitation",
          min: 0,
          max: 250,
          interval: 50,
          axisLabel: {
            formatter: "{value} ml",
          },
        },
        {
          type: "value",
          name: "Temperature",
          min: 0,
          max: 25,
          interval: 5,
          axisLabel: {
            formatter: "{value} °C",
          },
        },
      ],
      series: [
        {
          name: "Evaporation",
          type: "bar",
          tooltip: {
            valueFormatter: function (value) {
              return value + " ml";
            },
          },
          data: [
            2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3,
          ],
        },
        {
          name: "Precipitation",
          type: "bar",
          tooltip: {
            valueFormatter: function (value) {
              return value + " ml";
            },
          },
          data: [
            2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3,
          ],
        },
        {
          name: "Temperature",
          type: "line",
          yAxisIndex: 1,
          tooltip: {
            valueFormatter: function (value) {
              return value + " °C";
            },
          },
          data: [
            2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2,
          ],
        },
      ],
    });

    const BarChart = ref({
      xAxis: {
        type: "category",
        data: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
      },
      yAxis: {
        type: "value",
      },
      series: [
        {
          data: [120, 200, 150, 80, 70, 110, 130],
          type: "bar",
          itemStyle: {
            color: "rgba(8, 155, 171, 1)",
          },
        },
      ],
    });
    const DoughnutChartOption = ref({
      tooltip: {
        trigger: "item",
      },
      legend: {
        top: "5%",
        left: "center",
      },
      series: [
        {
          name: "Solicitudes",
          type: "pie",
          radius: ["40%", "70%"],
          avoidLabelOverlap: false,
          label: {
            show: false,
            position: "center",
          },
          emphasis: {
            label: {
              show: true,
              fontSize: 40,
              fontWeight: "bold",
            },
          },
          labelLine: {
            show: false,
          },
          data: [
            { value: 1048, name: "Enero" },
            { value: 735, name: "Febrero" },
            { value: 580, name: "Marzo" },
            { value: 484, name: "April" },
            { value: 300, name: "Mayo" },
          ],
        },
      ],
    });
    const RadarChartOption = ref({
      tooltip: {
        trigger: "item",
      },
      legend: {
        data: ["Entrantes", "Salientes"],
      },
      radar: {
        indicator: [
          { name: "Diabetes Mellitus", max: 6500 },
          { name: "Hipertención", max: 16000 },
          { name: "Infección Rinaria", max: 30000 },
          { name: "Cesaria", max: 38000 },
          { name: "Terapia Intensiva", max: 52000 },
          { name: "Cataratas", max: 25000 },
        ],
      },
      series: [
        {
          name: "Budget vs spending",
          type: "radar",
          data: [
            {
              value: [4200, 3000, 20000, 35000, 50000, 18000],
              name: "Entrantes",
            },
            {
              value: [5000, 14000, 28000, 26000, 42000, 21000],
              name: "Salientes",
            },
          ],
        },
      ],
    });
    const echartBubbleData = [
      [
        [5, 30, 27662440, "Enfermería"],
        [10, 50, 27662441, "Enfermería"],
        [20, 60, 27662442, "Enfermería"],
        [30, 50, 27662443, "Enfermería"],
        [40, 77.4, 27662444, "Enfermería"],
      ],
      [
        [10, 60, 276624470, "Consulta Médica"],
        [20, 45, 276624471, "Consulta Médica"],
        [30, 60, 276624472, "Consulta Médica"],
        [40, 40, 276624473, "Consulta Médica"],
        [50, 50, 276624474, "Consulta Médica"],
      ],
      [
        [5, 40, 276624450, "Radiología"],
        [20, 70, 276624451, "Radiología"],
        [30, 40, 276624452, "Radiología"],
        [40, 55, 276624453, "Radiología"],
        [50, 65, 276624454, "Radiología"],
      ],
    ];
    const BubbleChartOption = ref({
      tooltip: {
        trigger: "item",
      },
      legend: {
        left: "25%",
        bottom: "3%",
        data: ["Enfermería", "Consulta Médica", "Radiología"],
      },
      grid: {
        left: "8%",
        top: "10%",
      },
      xAxis: {
        splitLine: {
          lineStyle: {
            type: "dashed",
          },
        },
      },
      yAxis: {
        splitLine: {
          lineStyle: {
            type: "dashed",
          },
        },
        scale: true,
      },
      series: [
        {
          name: "Product 1",
          data: echartBubbleData[0],
          type: "scatter",
          symbolSize: function (data) {
            return Math.sqrt(data[2]) / 5e2;
          },
          emphasis: {
            focus: "series",
            label: {
              show: true,
              formatter: function (param) {
                return param.data[3];
              },
              position: "top",
            },
          },
          itemStyle: {
            color: "rgba(8, 155, 171, 1)",
          },
        },
        {
          name: "Product 2",
          data: echartBubbleData[1],
          type: "scatter",
          symbolSize: function (data) {
            return Math.sqrt(data[2]) / 5e2;
          },
          emphasis: {
            focus: "series",
            label: {
              show: true,
              formatter: function (param) {
                return param.data[3];
              },
              position: "top",
            },
          },
          itemStyle: {
            color: "rgba(97, 226, 252, 1)",
          },
        },
        {
          name: "Product 3",
          data: echartBubbleData[2],
          type: "scatter",
          symbolSize: function (data) {
            return Math.sqrt(data[2]) / 5e2;
          },
          emphasis: {
            focus: "series",
            label: {
              show: true,
              formatter: function (param) {
                return param.data[3];
              },
              position: "top",
            },
          },
          itemStyle: {
            color: "rgba(242, 99, 97, 1)",
          },
        },
      ],
    });

    return {
      LineChartOption,
      ColumnBarChartOption,
      PieChartOption,
      GaugeChartOption,
      AreaChartOption,
      ScatterChartOption,
      DualAxesLineColumnOption,
      DoughnutChartOption,
      BarChart,
      RadarChartOption,
      BubbleChartOption,
    };
  },
  data() {
    return {
      chart: null,
      xVal: 0,
      options: {
        exportEnabled: true,
        title: {
          text: "live random data",
        },
        data: [
          {
            type: "line",
            dataPoints: [],
          },
        ],
      },
      styleOptions: {
        width: "100%",
        height: "345px",
        fontSize: "18px",
      },
      config: {
        dateFormat: "Y-m-d",
        inline: true,
      },

      doctors: [
        {
          name: "Dr. Paul Molive",
          img: require("../../assets/images/user/01.jpg"),
          degree: "MBBS, MD",
        },
        {
          name: "Dr. Barb Dwyer",
          img: require("../../assets/images/user/02.jpg"),
          degree: "MD",
        },
        {
          name: "Dr. Terry Aki",
          img: require("../../assets/images/user/03.jpg"),
          degree: "MBBS",
        },
        {
          name: "Dr. Robin Banks",
          img: require("../../assets/images/user/04.jpg"),
          degree: "MBBS, MD",
        },
        {
          name: "Dr. Barry Wine",
          img: require("../../assets/images/user/05.jpg"),
          degree: "BAMS",
        },
        {
          name: "Dr. Zack Lee",
          img: require("../../assets/images/user/06.jpg"),
          degree: "MS, MD",
        },
        {
          name: "Dr. Otto Matic",
          img: require("../../assets/images/user/07.jpg"),
          degree: "MBBS, MD",
        },
        {
          name: "Dr. Moe Fugga",
          img: require("../../assets/images/user/08.jpg"),
          degree: "MD",
        },
        {
          name: "Dr. Bud Wiser",
          img: require("../../assets/images/user/09.jpg"),
          degree: "MBBS",
        },
        {
          name: "Dr. Barry Cade",
          img: require("../../assets/images/user/10.jpg"),
          degree: "MBBS, MD",
        },
      ],
      appointments: [
        {
          patient: "Petey Cruiser",
          doctor: "Dr.Monty Carlo",
          date: "20/02/2020",
          timing: "8:00 AM",
          contact: "+1-202-555-0146",
        },
        {
          patient: "Anna Sthesia",
          doctor: "Dr.Pete Sariya",
          date: "25/02/2020",
          timing: "8:30 AM",
          contact: "+1-202-555-0164",
        },
        {
          patient: "Paul Molive",
          doctor: "Dr.Brock Lee",
          date: "20/02/2020",
          timing: "9:45 AM",
          contact: "+1-202-555-0153",
        },
        {
          patient: "Anna Mull",
          doctor: "Dr.Barb Ackue",
          date: "27/02/2020",
          timing: "11:30 AM",
          contact: "+1-202-555-0154",
        },
        {
          patient: "Paige Turner",
          doctor: "Dr.Walter Melon",
          date: "28/02/2020",
          timing: "3:30 PM",
          contact: "+1-202-555-0101",
        },
        {
          patient: "Don Stairs",
          doctor: "Dr.Arty Ficial",
          date: "28/02/2020",
          timing: "4:30 PM",
          contact: "+1-202-555-0176",
        },
        {
          patient: "Pat Agonia",
          doctor: "Dr.Barb Ackue",
          date: "29/02/2020",
          timing: "5:00 PM",
          contact: "+1-202-555-0194",
        },
      ],

      chart1: {
        series: [
          {
            name: "series1",
            data: [31, 40, 28, 51, 42, 109, 100],
          },
        ],
        chart: {
          height: 340,
          type: "area",
        },
        grid: {
          show: true,
          yaxis: {
            lines: {
              show: true,
            },
          },
        },
        colors: ["#089bab"],
        dataLabels: {
          enabled: false,
        },
        stroke: {
          curve: "smooth",
        },
        xaxis: {
          type: "datetime",
          categories: [
            "2018-09-19T00:00:00.000Z",
            "2018-09-19T01:30:00.000Z",
            "2018-09-19T02:30:00.000Z",
            "2018-09-19T03:30:00.000Z",
            "2018-09-19T04:30:00.000Z",
            "2018-09-19T05:30:00.000Z",
            "2018-09-19T06:30:00.000Z",
          ],
        },
        tooltip: {
          x: {
            format: "dd/MM/yy HH:mm",
          },
        },
      },
      darkChart1: {
        series: [
          {
            name: "series1",
            data: [31, 40, 28, 51, 42, 109, 100],
          },
        ],
        chart: {
          height: 350,
          type: "area",
        },
        colors: ["#089bab"],
        dataLabels: {
          enabled: false,
        },
        stroke: {
          curve: "smooth",
        },
        xaxis: {
          type: "datetime",
          categories: [
            "2018-09-19T00:00:00.000Z",
            "2018-09-19T01:30:00.000Z",
            "2018-09-19T02:30:00.000Z",
            "2018-09-19T03:30:00.000Z",
            "2018-09-19T04:30:00.000Z",
            "2018-09-19T05:30:00.000Z",
            "2018-09-19T06:30:00.000Z",
          ],
        },
        tooltip: {
          x: {
            format: "dd/MM/yy HH:mm",
          },
        },
      },
      chart7: {
        chart: {
          height: 80,
          type: "area",
          animations: {
            enabled: true,
          },
          toolbar: {
            show: false,
          },
          sparkline: {
            enabled: true,
          },
          group: "sparklines",
        },
        colors: ["#0D9AAA"],
        dataLabels: {
          enabled: false,
        },
        stroke: {
          curve: "straight",
          width: 3,
        },
        markers: {
          size: 4,
        },
        yaxis: {
          max: 100,
        },
        fill: {
          type: "gradient",
          gradient: {
            shadeIntensity: 1,
            inverseColors: false,
            opacityFrom: 0.5,
            opacityTo: 0,
            stops: [0, 90, 100],
          },
        },
        legend: {
          show: false,
        },
        series: [
          {
            data: [80, 90, 60, 90, 44, 50, 98, 80, 90],
          },
        ],
      },
      chart8: {
        chart: {
          height: 80,
          type: "area",
          animations: {
            enabled: true,
          },
          toolbar: {
            show: false,
          },
          sparkline: {
            enabled: true,
          },
          group: "sparklines",
        },
        colors: ["#fc9f5b"],
        dataLabels: {
          enabled: false,
        },
        stroke: {
          curve: "straight",
          width: 3,
        },
        markers: {
          size: 4,
        },
        yaxis: {
          max: 100,
        },
        fill: {
          type: "gradient",
          gradient: {
            shadeIntensity: 1,
            inverseColors: false,
            opacityFrom: 0.5,
            opacityTo: 0,
            stops: [0, 90, 100],
          },
        },
        legend: {
          show: false,
        },
        series: [
          {
            data: [50, 60, 45, 90, 44, 50, 98, 75, 50],
          },
        ],
      },

      radialChat: {
        type: "radial-pie",
        height: 280,
        data: [
          {
            country: "Pediatria",
            value: 401,
          },
          {
            country: "Geriatria",
            value: 300,
          },
          {
            country: "Cardiologia",
            value: 200,
          },
          {
            country: "Laboratorio",
            value: 100,
          },
        ],
      },

      charts: [
        {
          title: "Atención y Servicio Médico",
          type: "column",
          bodyData: {
            color: "#089bab",
            fill: "#089bab",
            data: [
              {
                year: "2009",
                income: 23.5,
                expenses: 21.1,
              },
              {
                year: "2010",
                income: 26.2,
                expenses: 30.5,
              },
              {
                year: "2011",
                income: 30.1,
                expenses: 34.9,
              },
              {
                year: "2012",
                income: 29.5,
                expenses: 31.1,
              },
              {
                year: "2013",
                income: 30.6,
                expenses: 28.2,
                lineDash: "5,5",
              },
              {
                year: "2014",
                income: 34.1,
                expenses: 32.9,
                strokeWidth: 1,
                columnDash: "5,5",
                fillOpacity: 0.2,
                additional: "(projection)",
              },
            ],
          },
        },
        {
          title: "Índice de Atención con Respecto al año Anterior",
          type: "mixes-column",
          bodyData: {
            colors: ["#FC9F5B", "#089bab"],
            title: "Índice de Atención ",
            labels: [
              "Índice del {categoryX} (2004): [bold]{valueY}[/]",
              "Índice del {categoryX} (2005): [bold]{valueY}[/]",
            ],
            xAxis: ["country"],
            yAxis: ["year2004", "year2005"],
            data: [
              {
                country: "Urgencias",
                year2004: 3.5,
                year2005: 4.2,
              },
              {
                country: "Terapia Intensiva",
                year2004: 1.7,
                year2005: 3.1,
              },
              {
                country: "Peditría",
                year2004: 2.8,
                year2005: 2.9,
              },
              {
                country: "Geriatría",
                year2004: 2.6,
                year2005: 2.3,
              },
              {
                country: "Hospitalización",
                year2004: 1.4,
                year2005: 2.1,
              },
              {
                country: "Banco de Sangre",
                year2004: 2.6,
                year2005: 4.9,
              },
            ],
          },
        },
        {
          title: "Tasa de Atención por Grupo de Edad",
          type: "stacked",
          bodyData: {
            colors: ["#089bab", "#FC9F5B", "#e64141", "blue"],
            xAxis: ["year"],
            yAxis: ["Neonato", "Pedríaticos", "Adultos", "Geriartrícos"],
            data: [
              {
                year: "2016",
                Neonato: 2.5,
                Pedríaticos: 2.5,
                Adultos: 2.1,
                Geriartrícos: 0.3,
                meast: 0.2,
              },
              {
                year: "2017",
                Neonato: 2.6,
                Pedríaticos: 2.7,
                Adultos: 2.2,
                Geriartrícos: 0.3,
                meast: 0.3,
              },
              {
                year: "2018",
                Neonato: 2.8,
                Pedríaticos: 2.9,
                Adultos: 2.4,
                Geriartrícos: 0.3,
                meast: 0.3,
              },
            ],
          },
        },
        {
          title: "Índice de Edad Recurrente Para la Atención Médica",
          type: "bar-line",
          bodyData: {
            colors: ["#089bab", "#FC9F5B"],
            labels: ["Crecimiento", "Recurrente"],
            xAxis: ["Crecimiento", "Recurrente"],
            yAxis: ["year"],
            data: [
              {
                year: "2005",
                Crecimiento: 23.5,
                Recurrente: 18.1,
              },
              {
                year: "2006",
                Crecimiento: 26.2,
                Recurrente: 22.8,
              },
              {
                year: "2007",
                Crecimiento: 30.1,
                Recurrente: 23.9,
              },
              {
                year: "2008",
                Crecimiento: 29.5,
                Recurrente: 25.1,
              },
              {
                year: "2009",
                Crecimiento: 24.6,
                expenses: 25,
              },
            ],
          },
        },
        {
          title: "Índice de Atención Médica por Meses Transcurridos",
          type: "line-zoom-h",
          bodyData: {
            colors: ["#089bab"],
            xAxis: ["date"],
            yAxis: ["visits"],
            data: this.generateChartData(),
          },
        },
        {
          title: "Índice de población Vacunada",
          type: "line-zoom-v",
          bodyData: {
            colors: ["#089bab"],
            xAxis: ["date"],
            yAxis: ["value"],
            data: [
              {
                date: "2012-07-27",
                value: 13,
              },
              {
                date: "2012-07-28",
                value: 11,
              },
              {
                date: "2012-07-29",
                value: 15,
              },
              {
                date: "2012-07-30",
                value: 16,
              },
              {
                date: "2012-07-31",
                value: 18,
              },
              {
                date: "2012-08-01",
                value: 13,
              },
              {
                date: "2012-08-02",
                value: 22,
              },
              {
                date: "2012-08-03",
                value: 23,
              },
              {
                date: "2012-08-04",
                value: 20,
              },
              {
                date: "2012-08-05",
                value: 17,
              },
              {
                date: "2012-08-06",
                value: 16,
              },
              {
                date: "2012-08-07",
                value: 18,
              },
              {
                date: "2012-08-08",
                value: 21,
              },
              {
                date: "2012-08-09",
                value: 26,
              },
              {
                date: "2012-08-10",
                value: 24,
              },
              {
                date: "2012-08-11",
                value: 29,
              },
              {
                date: "2012-08-12",
                value: 32,
              },
              {
                date: "2012-08-13",
                value: 18,
              },
              {
                date: "2012-08-14",
                value: 24,
              },
              {
                date: "2012-08-15",
                value: 22,
              },
              {
                date: "2012-08-16",
                value: 18,
              },
              {
                date: "2012-08-17",
                value: 19,
              },
              {
                date: "2012-08-18",
                value: 14,
              },
              {
                date: "2012-08-19",
                value: 15,
              },
              {
                date: "2012-08-20",
                value: 12,
              },
              {
                date: "2012-08-21",
                value: 8,
              },
              {
                date: "2012-08-22",
                value: 9,
              },
              {
                date: "2012-08-23",
                value: 8,
              },
              {
                date: "2012-08-24",
                value: 7,
              },
              {
                date: "2012-08-25",
                value: 5,
              },
              {
                date: "2012-08-26",
                value: 11,
              },
              {
                date: "2012-08-27",
                value: 13,
              },
              {
                date: "2012-08-28",
                value: 18,
              },
              {
                date: "2012-08-29",
                value: 20,
              },
              {
                date: "2012-08-30",
                value: 29,
              },
              {
                date: "2012-08-31",
                value: 33,
              },
              {
                date: "2012-09-01",
                value: 42,
              },
              {
                date: "2012-09-02",
                value: 35,
              },
              {
                date: "2012-09-03",
                value: 31,
              },
              {
                date: "2012-09-04",
                value: 47,
              },
              {
                date: "2012-09-05",
                value: 52,
              },
              {
                date: "2012-09-06",
                value: 46,
              },
              {
                date: "2012-09-07",
                value: 41,
              },
              {
                date: "2012-09-08",
                value: 43,
              },
              {
                date: "2012-09-09",
                value: 40,
              },
              {
                date: "2012-09-10",
                value: 39,
              },
              {
                date: "2012-09-11",
                value: 34,
              },
              {
                date: "2012-09-12",
                value: 29,
              },
              {
                date: "2012-09-13",
                value: 34,
              },
              {
                date: "2012-09-14",
                value: 37,
              },
              {
                date: "2012-09-15",
                value: 42,
              },
              {
                date: "2012-09-16",
                value: 49,
              },
              {
                date: "2012-09-17",
                value: 46,
              },
              {
                date: "2012-09-18",
                value: 47,
              },
              {
                date: "2012-09-19",
                value: 55,
              },
              {
                date: "2012-09-20",
                value: 59,
              },
              {
                date: "2012-09-21",
                value: 58,
              },
              {
                date: "2012-09-22",
                value: 57,
              },
              {
                date: "2012-09-23",
                value: 61,
              },
              {
                date: "2012-09-24",
                value: 59,
              },
              {
                date: "2012-09-25",
                value: 67,
              },
              {
                date: "2012-09-26",
                value: 65,
              },
              {
                date: "2012-09-27",
                value: 61,
              },
              {
                date: "2012-09-28",
                value: 66,
              },
              {
                date: "2012-09-29",
                value: 69,
              },
              {
                date: "2012-09-30",
                value: 71,
              },
              {
                date: "2012-10-01",
                value: 67,
              },
              {
                date: "2012-10-02",
                value: 63,
              },
              {
                date: "2012-10-03",
                value: 46,
              },
              {
                date: "2012-10-04",
                value: 32,
              },
              {
                date: "2012-10-05",
                value: 21,
              },
              {
                date: "2012-10-06",
                value: 18,
              },
              {
                date: "2012-10-07",
                value: 21,
              },
              {
                date: "2012-10-08",
                value: 28,
              },
              {
                date: "2012-10-09",
                value: 27,
              },
              {
                date: "2012-10-10",
                value: 36,
              },
              {
                date: "2012-10-11",
                value: 33,
              },
              {
                date: "2012-10-12",
                value: 31,
              },
              {
                date: "2012-10-13",
                value: 30,
              },
              {
                date: "2012-10-14",
                value: 34,
              },
              {
                date: "2012-10-15",
                value: 38,
              },
              {
                date: "2012-10-16",
                value: 37,
              },
              {
                date: "2012-10-17",
                value: 44,
              },
              {
                date: "2012-10-18",
                value: 49,
              },
              {
                date: "2012-10-19",
                value: 53,
              },
              {
                date: "2012-10-20",
                value: 57,
              },
              {
                date: "2012-10-21",
                value: 60,
              },
              {
                date: "2012-10-22",
                value: 61,
              },
              {
                date: "2012-10-23",
                value: 69,
              },
              {
                date: "2012-10-24",
                value: 67,
              },
              {
                date: "2012-10-25",
                value: 72,
              },
              {
                date: "2012-10-26",
                value: 77,
              },
              {
                date: "2012-10-27",
                value: 75,
              },
              {
                date: "2012-10-28",
                value: 70,
              },
              {
                date: "2012-10-29",
                value: 72,
              },
              {
                date: "2012-10-30",
                value: 70,
              },
              {
                date: "2012-10-31",
                value: 72,
              },
              {
                date: "2012-11-01",
                value: 73,
              },
              {
                date: "2012-11-02",
                value: 67,
              },
              {
                date: "2012-11-03",
                value: 68,
              },
              {
                date: "2012-11-04",
                value: 65,
              },
              {
                date: "2012-11-05",
                value: 71,
              },
              {
                date: "2012-11-06",
                value: 75,
              },
              {
                date: "2012-11-07",
                value: 74,
              },
              {
                date: "2012-11-08",
                value: 71,
              },
              {
                date: "2012-11-09",
                value: 76,
              },
              {
                date: "2012-11-10",
                value: 77,
              },
              {
                date: "2012-11-11",
                value: 81,
              },
              {
                date: "2012-11-12",
                value: 83,
              },
              {
                date: "2012-11-13",
                value: 80,
              },
              {
                date: "2012-11-18",
                value: 80,
              },
              {
                date: "2012-11-19",
                value: 87,
              },
              {
                date: "2012-11-20",
                value: 83,
              },
              {
                date: "2012-11-21",
                value: 85,
              },
              {
                date: "2012-11-22",
                value: 84,
              },
              {
                date: "2012-11-23",
                value: 82,
              },
              {
                date: "2012-11-24",
                value: 73,
              },
              {
                date: "2012-11-25",
                value: 71,
              },
              {
                date: "2012-11-26",
                value: 75,
              },
              {
                date: "2012-11-27",
                value: 79,
              },
              {
                date: "2012-11-28",
                value: 70,
              },
              {
                date: "2012-11-29",
                value: 73,
              },
              {
                date: "2012-11-30",
                value: 61,
              },
              {
                date: "2012-12-01",
                value: 62,
              },
              {
                date: "2012-12-02",
                value: 66,
              },
              {
                date: "2012-12-03",
                value: 65,
              },
              {
                date: "2012-12-04",
                value: 73,
              },
              {
                date: "2012-12-05",
                value: 79,
              },
              {
                date: "2012-12-06",
                value: 78,
              },
              {
                date: "2012-12-07",
                value: 78,
              },
              {
                date: "2012-12-08",
                value: 78,
              },
              {
                date: "2012-12-09",
                value: 74,
              },
              {
                date: "2012-12-10",
                value: 73,
              },
              {
                date: "2012-12-11",
                value: 75,
              },
              {
                date: "2012-12-12",
                value: 70,
              },
              {
                date: "2012-12-13",
                value: 77,
              },
              {
                date: "2012-12-14",
                value: 67,
              },
              {
                date: "2012-12-15",
                value: 62,
              },
              {
                date: "2012-12-16",
                value: 64,
              },
              {
                date: "2012-12-17",
                value: 61,
              },
              {
                date: "2012-12-18",
                value: 59,
              },
              {
                date: "2012-12-19",
                value: 53,
              },
              {
                date: "2012-12-20",
                value: 54,
              },
              {
                date: "2012-12-21",
                value: 56,
              },
              {
                date: "2012-12-22",
                value: 59,
              },
              {
                date: "2012-12-23",
                value: 58,
              },
              {
                date: "2012-12-24",
                value: 55,
              },
              {
                date: "2012-12-25",
                value: 52,
              },
              {
                date: "2012-12-26",
                value: 54,
              },
              {
                date: "2012-12-27",
                value: 50,
              },
              {
                date: "2012-12-28",
                value: 50,
              },
              {
                date: "2012-12-29",
                value: 51,
              },
              {
                date: "2012-12-30",
                value: 52,
              },
              {
                date: "2012-12-31",
                value: 58,
              },
              {
                date: "2013-01-01",
                value: 60,
              },
              {
                date: "2013-01-02",
                value: 67,
              },
              {
                date: "2013-01-03",
                value: 64,
              },
              {
                date: "2013-01-04",
                value: 66,
              },
              {
                date: "2013-01-05",
                value: 60,
              },
              {
                date: "2013-01-06",
                value: 63,
              },
              {
                date: "2013-01-07",
                value: 61,
              },
              {
                date: "2013-01-08",
                value: 60,
              },
              {
                date: "2013-01-09",
                value: 65,
              },
              {
                date: "2013-01-10",
                value: 75,
              },
              {
                date: "2013-01-11",
                value: 77,
              },
              {
                date: "2013-01-12",
                value: 78,
              },
              {
                date: "2013-01-13",
                value: 70,
              },
              {
                date: "2013-01-14",
                value: 70,
              },
              {
                date: "2013-01-15",
                value: 73,
              },
              {
                date: "2013-01-16",
                value: 71,
              },
              {
                date: "2013-01-17",
                value: 74,
              },
              {
                date: "2013-01-18",
                value: 78,
              },
              {
                date: "2013-01-19",
                value: 85,
              },
              {
                date: "2013-01-20",
                value: 82,
              },
              {
                date: "2013-01-21",
                value: 83,
              },
              {
                date: "2013-01-22",
                value: 88,
              },
              {
                date: "2013-01-23",
                value: 85,
              },
              {
                date: "2013-01-24",
                value: 85,
              },
              {
                date: "2013-01-25",
                value: 80,
              },
              {
                date: "2013-01-26",
                value: 87,
              },
              {
                date: "2013-01-27",
                value: 84,
              },
              {
                date: "2013-01-28",
                value: 83,
              },
              {
                date: "2013-01-29",
                value: 84,
              },
              {
                date: "2013-01-30",
                value: 81,
              },
            ],
          },
        },
        {
          title: "Poblaciones cercanas a la zona de Atención",
          type: "radar",
          bodyData: {
            colors: ["#089bab"],
            labels: ["Sales"],
            xAxis: ["country"],
            yAxis: ["litres"],
            data: [
              {
                country: "Xicotepec de Júrez",
                litres: 501,
              },
              {
                country: "San Isidro",
                litres: 301,
              },
              {
                country: "Zihuateutla",
                litres: 266,
              },
              {
                country: "Nuevo Necaxa",
                litres: 165,
              },
              {
                country: "Huauchinango",
                litres: 139,
              },
              {
                country: "San Agustin",
                litres: 336,
              },
              {
                country: "Ozomatlán",
                litres: 290,
              },
              {
                country: "Tlaxcalantongo",
                litres: 325,
              },
              {
                country: "Itzatlán",
                litres: 40,
              },
            ],
          },
        },
        {
          title: "Gráfico de Enfermedades más Recurrentes de la Población",
          type: "pie",
          bodyData: {
            colors: [
              "#089bab",
              "#FC9F5B",
              "#57de53",
              "#f26361",
              "#ababab",
              "#61e2fc",
            ],
            value: ["litres"],
            category: ["country"],
            data: [
              {
                country: " Diabetes",
                litres: 501.9,
                fill: "red",
              },
              {
                country: "Lesiones no intencionadas",
                litres: 165.8,
              },
              {
                country: "Enfermedades respiratorias",
                litres: 139.9,
              },
              {
                country: "Enfermedades cardiovasculares",
                litres: 128.3,
              },
              {
                country: "Trastornos musculoesqueléticos",
                litres: 99,
              },
              {
                country: "Enfermedades mentales y de abuso de sustancias",
                litres: 60,
              },
            ],
          },
        },
      ],
    };
  },
  methods: {
    updateChart(count) {
      count = count || 1;
      var yVal = 100;
      for (var j = 0; j < count; j++) {
        yVal = yVal + Math.round(5 + Math.random() * (-5 - 5));
        this?.options.data[0].dataPoints.push({
          x: this.xVal++,
          y: yVal,
        });
      }
      if (!!this.options.data[0].dataPoints.length > 10) {
        this.options.data[0].dataPoints.shift();
      }
      this.chart.render();
      setTimeout(this.updateChart, 1000);
    },

    chartInstance(chart) {
      this.chart = chart;
      this.updateChart(100);
    },

    generateChartData() {
      let chartData = [];
      let firstDate = new Date();
      firstDate.setDate(firstDate.getDate() - 1000);
      let visits = 1200;
      for (let i = 0; i < 500; i++) {
        let newDate = new Date(firstDate);
        newDate.setDate(newDate.getDate() + i);

        visits += Math.round(
          (Math.random() < 0.5 ? 1 : -1) * Math.random() * 10
        );

        chartData.push({
          date: newDate,
          visits: visits,
        });
      }
      return chartData;
    },
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
<style scoped>
.chart {
  height: 342px;
  width: 785px;
}
</style>
