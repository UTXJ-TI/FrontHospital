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

          <b-row>
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
                      Operaciones CRUD de Solicitudes de Procedimientos Clínicos
                      y Quirúrgicos
                    </h3>
                    <br />

                    <div class="row">
                      <b-row>
                        <div class="col-md-9">
                          <h2 class="alert alert-primary text-center">
                            Lista de Solicitudes
                          </h2>
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
                              </form>
                            </div>
                            <b-navbar-toggle target="nav">
                              <i class="ri-menu-3-line"></i>
                            </b-navbar-toggle>
                            <div class="iq-menu-bt align-self-center">
                              <div class="wrapper-menu" @click="miniSidebar">
                                <div class="main-circle">
                                  <i class="ri-more-fill"></i>
                                </div>
                                <div class="hover-circle">
                                  <i class="ri-more-2-fill"></i>
                                </div>
                              </div>
                            </div>
                            <b-collapse id="nav-collapse" is-nav>
                              <slot name="responsiveRight" />
                            </b-collapse>
                            <slot name="right" />
                          </nav>
                          <div class="table-responsive">
                            <table
                              class="table table-bordered mt-4 table-hover"
                            >
                              <thead>
                                <tr class="text-center">
                                  <th scope="col">N°</th>
                                  <th scope="col">Servicio Solicitado</th>
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
                                  v-for="(solicitud, id) in paginatedData"
                                  :key="id"
                                  class="text-center"
                                >
                                  <td>{{ solicitud.id }}</td>
                                  <td class="text-center">
                                    <div
                                      v-if="solicitud.servicio_paciente === 1"
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/1.- Urgencias.png"
                                        alt="Urgencias Icono"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Urgencias</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 2
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/2.- Consulta Externa.png"
                                        alt="Consulta Externa"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Consulta Externa</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 3
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/3.- Hospitalización.png"
                                        alt="Hospitalización"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Hospitalización</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 4
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/4.- Cirugia.png"
                                        alt="Cirugia"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Cirugía</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 5
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/5.- Laboratorio Clínico.png"
                                        alt="Laboratorio Clínico"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Laboratorio Clínico</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 6
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/6.- Radiología.png"
                                        alt="Radiología"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Radiología</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 7
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/7.- Farmacia.png"
                                        alt="Farmacia"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Farmacia</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 8
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/8.- Rehabilitación.png"
                                        alt="Rehabilitación"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Rehabilitación</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 9
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/9.- Cuidados Intensivos.png"
                                        alt="Cuidados Intensivos"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Cuidados Intensivos</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 10
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/10.- Atención Pediática.png"
                                        alt="Atención Pediática"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Atención Pediática</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 11
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/11.- Atencion Materno-Infantil.png"
                                        alt="Atencion Materno-Infantil"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Atención Materno-Infantil</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 12
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/12.- Atencion Geriatrica.png"
                                        alt="Atencion Geriatrica"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Atención Geriatríca</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 13
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/13.- Psiquiatria y Salud Mental.png"
                                        alt="Psiquiatria y Salud Mental"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Psiquiatría y Salud Mental</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 14
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/14.- Banco de Sangre.png"
                                        alt="Banco de Sangre"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Banco de Sangre</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 15
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/15.- Ginecologia y Obstetricia.png"
                                        alt="Ginecologia y Obstetricia"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Ginecología y Obstétricia</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 16
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/16.- Quirofano.png"
                                        alt="Quirofano"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Quirófano</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 17
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/17.- Tanatologia.png"
                                        alt="Tanatologia"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Tanatología</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 18
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/18.- Infectología.png"
                                        alt="Infectología"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Infectología</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 19
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/19.- Cardiología.png"
                                        alt="Cardiología"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Cardiología</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 20
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/20.- Neurología.png"
                                        alt="Neurología"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Neurología</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 21
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/21.- Endocrinología.png"
                                        alt="Endocrinología"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Endocrinología</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 22
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/22.- Oftamología.png"
                                        alt="Oftamología"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Oftamología</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 23
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/23.- Otorrinología.png"
                                        alt="Otorrinología"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Otorrinología</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 24
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/24.- Gastroenterología.png"
                                        alt="Gastroenterología"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Gastroenterología</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 25
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/25.- Nefrología.png"
                                        alt="Nefrología"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Nefrología</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 26
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/26.- Dermatología.png"
                                        alt="Dermatología"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Dermatología</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 27
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/27.- Hematología.png"
                                        alt="Hematología"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Hematología</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 28
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/28.- Oncología.png"
                                        alt="Oncología"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Oncología</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 29
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/29.- Alergología e Inmunología.png"
                                        alt="Alergología e Inmunología"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Alergología e Inmunología</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 30
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/30.- Medicina Física y Rehabilitación.png"
                                        alt="Medicina Física y Rehabilitación"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Medicina Física y Rehabilitación</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 31
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/31.- Medicina Interna.png"
                                        alt="Medicina Interna"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>Medicina Interna</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente === 32
                                      "
                                    >
                                      <img
                                        src="../../assets/images/Servicios Medicos/32.- Medicina Preventiva y Salud Pública.png"
                                        alt="Medicina Preventiva y Salud Pública.png"
                                        width="32"
                                        height="32"
                                      />
                                      <h5>
                                        Medicina Preventiva y Salud Pública
                                      </h5>
                                    </div>
                                    <div
                                      v-else
                                      class="col-12 col-md-6 col-lg-3"
                                    >
                                      {{ solicitud.servicio_paciente }}
                                    </div>
                                  </td>
                                  <td>
                                    <div
                                      v-if="
                                        solicitud.departamento_solicitante === 1
                                      "
                                    >
                                      <h5>Dirección General</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante === 2
                                      "
                                    >
                                      <span>Junta de Gobierno</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante === 3
                                      "
                                    >
                                      <span>Comités Hospitalarios</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante === 4
                                      "
                                    >
                                      <span>Comiés de Transplantes</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante === 5
                                      "
                                    >
                                      <span>Departamento de Calidad</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante === 6
                                      "
                                    >
                                      <span>Autenticacion a Quejas</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante === 7
                                      "
                                    >
                                      <span>Seguridad paciente</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante === 8
                                      "
                                    >
                                      <span>Programacion Quirurgica</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante === 9
                                      "
                                    >
                                      <span>Sub - Dirección Medica</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        10
                                      "
                                    >
                                      <span>Sub - Administrativa</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        11
                                      "
                                    >
                                      <span>División de Medicina Interna</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        12
                                      "
                                    >
                                      <span>División de Pediatía</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        13
                                      "
                                    >
                                      <span>Servicio de Traumatología</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        14
                                      "
                                    >
                                      <span>División de Cirugía</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        15
                                      "
                                    >
                                      <span>Servicio de Urgencias Adultos</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        16
                                      "
                                    >
                                      <span>Quirófano</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        17
                                      "
                                    >
                                      <span>Terapia Intensiva</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        18
                                      "
                                    >
                                      <span>Quirófano y Anestesiología</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        19
                                      "
                                    >
                                      <span>Terapia Intermedia</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        20
                                      "
                                    >
                                      <span>Centro de Mezclas</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        21
                                      "
                                    >
                                      <span>Radiología e imagen</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        22
                                      "
                                    >
                                      <span>Genética</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        23
                                      "
                                    >
                                      <span
                                        >Laboratorio de Análisis Clinicos</span
                                      >
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        24
                                      "
                                    >
                                      <span>Hemodialisis</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        25
                                      "
                                    >
                                      <span>Laboratorio de Patología</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        26
                                      "
                                    >
                                      <span>Rehabilitación Pulmonar</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        27
                                      "
                                    >
                                      <span>Medicina Genómica</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        28
                                      "
                                    >
                                      <span>Banco de Sangre</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        29
                                      "
                                    >
                                      <span
                                        >Laboratorio Histocompatibilidad</span
                                      >
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        30
                                      "
                                    >
                                      <span>Aféresis</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        31
                                      "
                                    >
                                      <span>Tele-Robotica</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        32
                                      "
                                    >
                                      <span>Jefatura de Enseñanza Médica</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        33
                                      "
                                    >
                                      <span>Ética e Investigacion</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        34
                                      "
                                    >
                                      <span>Consulta Externa</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        35
                                      "
                                    >
                                      <span
                                        >Terapia y Rehabilitacion Fisica</span
                                      >
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        36
                                      "
                                    >
                                      <span>Medicina Legal</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        37
                                      "
                                    >
                                      <span>Trabajo Social</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        38
                                      "
                                    >
                                      <span>UVEH</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        39
                                      "
                                    >
                                      <span>CIES</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        40
                                      "
                                    >
                                      <span>Comunicacion Social</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        41
                                      "
                                    >
                                      <span>Violencia Intrafamiliar</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        42
                                      "
                                    >
                                      <span>Jefatura de Enfermeria</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        43
                                      "
                                    >
                                      <span>Sub-jefatura de Enfermeria</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        44
                                      "
                                    >
                                      <span>Supervisoras de Turno</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        45
                                      "
                                    >
                                      <span
                                        >Coordinación Enseñanza Enfermeria</span
                                      >
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        46
                                      "
                                    >
                                      <span>Jefas de Servicio</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        47
                                      "
                                    >
                                      <span>Clinicas y Programas</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        48
                                      "
                                    >
                                      <span>Recursos Humanos</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        49
                                      "
                                    >
                                      <span>Dietética</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        50
                                      "
                                    >
                                      <span>Farmacia Intrahospitalaria</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        51
                                      "
                                    >
                                      <span
                                        >Coordinación de Asuntos Jurídicos y
                                        Administrativos</span
                                      >
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        52
                                      "
                                    >
                                      <span
                                        >Biomédica, Conservación y
                                        Mantenimiento</span
                                      >
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        53
                                      "
                                    >
                                      <span>Validación</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        54
                                      "
                                    >
                                      <span>Recursos Materiales</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        55
                                      "
                                    >
                                      <span>Servicios Generales</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        56
                                      "
                                    >
                                      <span>Recursos Financieros</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        57
                                      "
                                    >
                                      <span
                                        >Departamento Adtvo. Hemodinamia</span
                                      >
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        58
                                      "
                                    >
                                      <span>Relaciones Públicas</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        59
                                      "
                                    >
                                      <span>Farmacia HGC Seguro Popular</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        60
                                      "
                                    >
                                      <span>Enlace Administrativo</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        61
                                      "
                                    >
                                      <span>Informatica</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        62
                                      "
                                    >
                                      <span>Registros Médicos</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        63
                                      "
                                    >
                                      <span>Archivo y Correspondencia</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        64
                                      "
                                    >
                                      <span>Almacen</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        65
                                      "
                                    >
                                      <span>Hemodialisis</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        66
                                      "
                                    >
                                      <span>Insumos Especializados</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        67
                                      "
                                    >
                                      <span>Intendencia</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        68
                                      "
                                    >
                                      <span>Ropería</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        69
                                      "
                                    >
                                      <span>Nivel 7</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        70
                                      "
                                    >
                                      <span>Control Gastos Catastroficos</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.departamento_solicitante ===
                                        71
                                      "
                                    >
                                      <span>Tecnologia en la Salud</span>
                                    </div>
                                    <div
                                      v-else
                                      class="col-12 col-md-6 col-lg-3"
                                    >
                                      {{ solicitud.departamento_solicitante }}
                                    </div>
                                  </td>
                                  <td>
                                    {{
                                      formatearFecha(solicitud.fecha_solicitud)
                                    }}
                                  </td>
                                  <td>
                                    <div
                                      v-if="solicitud.estatus === 'Aprobado'"
                                      class="text-center"
                                    >
                                      <a
                                        class="iq-icons-list"
                                        href="#"
                                        target="_self"
                                      >
                                        <div
                                          data-icon="S"
                                          class="icon"
                                          style="color: green"
                                        ></div>
                                        <span style="color: green"
                                          >Aprobado</span
                                        >
                                      </a>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.estatus === 'En Proceso'
                                      "
                                      class="text-center"
                                    >
                                      <a
                                        class="iq-icons-list"
                                        href="#"
                                        target="_self"
                                      >
                                        <div
                                          data-icon="Y"
                                          class="icon"
                                          style="color: orange"
                                        ></div>
                                        <span style="color: orange"
                                          >En Proceso</span
                                        >
                                      </a>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.estatus === 'No Aprobado'
                                      "
                                      class="text-center"
                                    >
                                      <a
                                        class="iq-icons-list"
                                        href="#"
                                        target="_self"
                                      >
                                        <div
                                          data-icon="&#xe04d;"
                                          class="icon"
                                          style="color: red"
                                        ></div>
                                        <span style="color: red"
                                          >No Aprobado</span
                                        >
                                      </a>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.estatus === 'Cancelado'
                                      "
                                      class="text-center"
                                    >
                                      <a
                                        class="iq-icons-list"
                                        href="#"
                                        target="_self"
                                      >
                                        <div
                                          data-icon=")"
                                          class="icon"
                                          style="color: black"
                                        ></div>
                                        <span style="color: black"
                                          >Cancelado</span
                                        >
                                      </a>
                                    </div>
                                    <div
                                      v-else
                                      class="col-12 col-md-6 col-lg-3"
                                    >
                                      {{ solicitud.estatus }}
                                    </div>
                                  </td>
                                  <td>{{ solicitud.comentarios }}</td>
                                  <td>
                                    {{
                                      formatearFecha(solicitud.fecha_aprobacion)
                                    }}
                                  </td>
                                  <td>
                                    <a href="#" class="edit" title="">
                                      <button
                                        class="btn btn-warning btn-sm"
                                        @click.prevent="editBtn(solicitud.id)"
                                      >
                                        Edita
                                      </button>
                                    </a>
                                    <a href="#" class="edit" title="">
                                      <button
                                        class="btn btn-danger btn-sm"
                                        @click.prevent="
                                          deleteSolicitud(solicitud.id)
                                        "
                                      >
                                        Elimina
                                      </button>
                                    </a>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>

                        <!-- There is a current procedimiento to be edited -->
                        <div class="col-md-3">
                          <!-- Edicion de la Solicitudes -->
                          <div
                            v-if="
                              Object.keys(this.currentSolicitud).length !== 0
                            "
                          >
                            <h2 class="alert alert-warning" role="alert">
                              Actualiza Solicitud
                            </h2>

                            <form
                              @submit.prevent="
                                updateSolicitud(currentSolicitud.id)
                              "
                            >
                              <div class="row">
                                <div class="col">
                                  <div class="form-group">
                                    <label class="form-label float-left ml-2"
                                      >Servicio</label
                                    >

                                    <select
                                      class="form-control"
                                      v-model="
                                        currentSolicitud.servicio_paciente
                                      "
                                    >
                                      <option value="1">Urgencias</option>
                                      <option value="2">
                                        Consulta Externa
                                      </option>
                                      <option value="3">Hospitalización</option>
                                      <option value="4">Cirugia</option>
                                      <option value="5">
                                        Laboratorio Clínico
                                      </option>
                                      <option value="6">Radiología</option>
                                      <option value="7">Farmacia</option>
                                      <option value="8">Rehabilitación</option>
                                      <option value="9">
                                        Cuidados Intensivos
                                      </option>
                                      <option value="10">
                                        Atención Pediática
                                      </option>
                                      <option value="11">
                                        Atencion Materno-Infantil
                                      </option>
                                      <option value="12">
                                        Atencion Geriatrica
                                      </option>
                                      <option value="13">
                                        Psiquiatria y Salud Mental
                                      </option>
                                      <option value="14">
                                        Banco de Sangre
                                      </option>
                                      <option value="15">
                                        Ginecologia y Obstetricia
                                      </option>
                                      <option value="16">Quirofano</option>
                                      <option value="17">Tanatologia</option>
                                      <option value="18">Infectología</option>
                                      <option value="19">Cardiología</option>
                                      <option value="20">Neurología</option>
                                      <option value="21">Endocrinología</option>
                                      <option value="22">Oftamología</option>
                                      <option value="23">Otorrinología</option>
                                      <option value="24">
                                        Gastroenterología
                                      </option>
                                      <option value="25">Nefrología</option>
                                      <option value="26">Dermatología</option>
                                      <option value="27">Hematología</option>
                                      <option value="28">Oncología</option>
                                      <option value="29">
                                        Alergología e Inmunología
                                      </option>
                                      <option value="30">
                                        Medicina Física y Rehabilitación
                                      </option>
                                      <option value="31">
                                        Medicina Interna
                                      </option>
                                      <option value="32">
                                        Medicina Preventiva y Salud Pública
                                      </option>
                                    </select>
                                  </div>
                                </div>

                                <div class="col">
                                  <div class="form-group">
                                    <label class="form-label float-left ml-2"
                                      >Departamento</label
                                    >
                                    <select
                                      class="form-control"
                                      v-model="
                                        currentSolicitud.departamento_solicitante
                                      "
                                    >
                                      <option value="1">
                                        Dirección General
                                      </option>
                                      <option value="2">
                                        Junta de Gobierno
                                      </option>
                                      <option value="3">
                                        Comiés Hospitalarios
                                      </option>
                                      <option value="4">
                                        Comiés de Transplantes
                                      </option>
                                      <option value="5">
                                        Departamento de Calidad
                                      </option>
                                      <option value="6">
                                        Autenticacion a Quejas
                                      </option>
                                      <option value="7">
                                        Seguridad paciente
                                      </option>
                                      <option value="8">
                                        Programacion Quirurgica
                                      </option>
                                      <option value="9">
                                        Sub - Dirección Medica
                                      </option>
                                      <option value="10">
                                        Sub - Administrativa
                                      </option>
                                      <option value="11">
                                        División de Medicina Interna
                                      </option>
                                      <option value="12">
                                        División de Pediatía
                                      </option>
                                      <option value="13">
                                        Servicio de Traumatología
                                      </option>
                                      <option value="14">
                                        División de Cirugía
                                      </option>
                                      <option value="15">
                                        Servicio de Urgencias Adultos
                                      </option>
                                      <option value="16">
                                        Terapia Intensiva
                                      </option>
                                      <option value="17">
                                        Quirófano y Anestesiología
                                      </option>
                                      <option value="18">
                                        Terapia Intermedia
                                      </option>
                                      <option value="19">
                                        Servicio de Urgencias Pediátricas
                                      </option>
                                      <option value="20">
                                        Centro de Mezclas
                                      </option>
                                      <option value="21">
                                        Radiología e imagen
                                      </option>
                                      <option value="22">Genética</option>
                                      <option value="23">
                                        Laboratorio de Análisis Clinicos
                                      </option>
                                      <option value="24">Hemodialisis</option>
                                      <option value="25">
                                        Laboratorio de Patología
                                      </option>
                                      <option value="26">
                                        Rehabilitación Pulmonar
                                      </option>
                                      <option value="27">
                                        Medicina Genómica
                                      </option>
                                      <option value="28">
                                        Banco de Sangre
                                      </option>
                                      <option value="29">
                                        Laboratorio Histocompatibilidad
                                      </option>
                                      <option value="30">Aféresis</option>
                                      <option value="31">Tele-Robotica</option>
                                      <option value="32">
                                        Jefatura de Enseñanza Médica
                                      </option>
                                      <option value="33">
                                        Ética e Investigación
                                      </option>
                                      <option value="34">
                                        Consulta Externa
                                      </option>
                                      <option value="35">
                                        Terapia y Rehabilitacion Fisica
                                      </option>
                                      <option value="36">Medicina Legal</option>
                                      <option value="37">Trabajo Social</option>
                                      <option value="38">UVEH</option>
                                      <option value="39">CIES</option>
                                      <option value="40">
                                        Comunicacion Social
                                      </option>
                                      <option value="41">
                                        Violencia Intrafamiliar
                                      </option>
                                      <option value="42">
                                        Jefatura de Enfermeria
                                      </option>
                                      <option value="43">
                                        Sub-Jefatura de Enfermeria
                                      </option>
                                      <option value="44">
                                        Supervisoras de Turno
                                      </option>
                                      <option value="45">
                                        Coordinación Enseñanza Enfermeria
                                      </option>
                                      <option value="46">
                                        Jefas de Servicio
                                      </option>
                                      <option value="47">
                                        Clinicas y Programas
                                      </option>
                                      <option value="48">
                                        Recursos Humanos
                                      </option>
                                      <option value="49">Dietética</option>
                                      <option value="50">
                                        Farmacia Intrahospitalaria
                                      </option>
                                      <option value="51">
                                        Coordinación de Asuntos Jurídicos y
                                        Administrativos
                                      </option>
                                      <option value="52">
                                        Biomédica, Conservación y Mantenimiento
                                      </option>
                                      <option value="53">Validación</option>
                                      <option value="54">
                                        Recursos Materiales
                                      </option>
                                      <option value="55">
                                        Servicios Generales
                                      </option>
                                      <option value="56">
                                        Recursos Financieros
                                      </option>
                                      <option value="57">
                                        Departamento Adtvo. Hemodinamia
                                      </option>
                                      <option value="58">
                                        Relaciones Públicas
                                      </option>
                                      <option value="59">
                                        Farmacia HGC Seguro Popular
                                      </option>
                                      <option value="60">
                                        Enlace Administrativo
                                      </option>
                                      <option value="61">Informatica</option>
                                      <option value="62">
                                        Registros Médicos
                                      </option>
                                      <option value="63">
                                        Archivo y Correspondencia
                                      </option>
                                      <option value="64">Vigilancia</option>
                                      <option value="65">Almacen</option>
                                      <option value="66">
                                        Insumos Especializados
                                      </option>
                                      <option value="67">Intendencia</option>
                                      <option value="68">Ropería</option>
                                      <option value="69">Nivel 7</option>
                                      <option value="70">
                                        Control Gastos Catastroficos
                                      </option>
                                      <option value="71">
                                        Tecnologia en la Salud
                                      </option>
                                    </select>
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
                                      <option value="En Proceso">
                                        En Proceso
                                      </option>
                                      <option value="No Aprobado">
                                        No Aprobado
                                      </option>
                                      <option value="Cancelado">
                                        Cancelado
                                      </option>
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
                                      v-model="
                                        currentSolicitud.fecha_aprobacion
                                      "
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
                            <h2 class="alert alert-success">Crea Solicitud</h2>
                            <form @submit.prevent="saveSolicitud()">
                              <div class="row">
                                <div class="col">
                                  <div class="form-group">
                                    <label class="form-label float-left ml-2"
                                      >Servicio</label
                                    >
                                    <select
                                      class="form-control"
                                      v-model="solicitud.servicio_paciente"
                                      required
                                    >
                                      <option value="1">Urgencias</option>
                                      <option value="2">
                                        Consulta Externa
                                      </option>
                                      <option value="3">Hospitalización</option>
                                      <option value="4">Cirugia</option>
                                      <option value="5">
                                        Laboratorio Clínico
                                      </option>
                                      <option value="6">Radiología</option>
                                      <option value="7">Farmacia</option>
                                      <option value="8">Rehabilitación</option>
                                      <option value="9">
                                        Cuidados Intensivos
                                      </option>
                                      <option value="10">
                                        Atención Pediática
                                      </option>
                                      <option value="11">
                                        Atencion Materno-Infantil
                                      </option>
                                      <option value="12">
                                        Atencion Geriatrica
                                      </option>
                                      <option value="13">
                                        Psiquiatria y Salud Mental
                                      </option>
                                      <option value="14">
                                        Banco de Sangre
                                      </option>
                                      <option value="15">
                                        Ginecologia y Obstetricia
                                      </option>
                                      <option value="16">Quirofano</option>
                                      <option value="17">Tanatologia</option>
                                      <option value="18">Infectología</option>
                                      <option value="19">Cardiología</option>
                                      <option value="20">Neurología</option>
                                      <option value="21">Endocrinología</option>
                                      <option value="22">Oftamología</option>
                                      <option value="23">Otorrinología</option>
                                      <option value="24">
                                        Gastroenterología
                                      </option>
                                      <option value="25">Nefrología</option>
                                      <option value="26">Dermatología</option>
                                      <option value="27">Hematología</option>
                                      <option value="28">Oncología</option>
                                      <option value="29">
                                        Alergología e Inmunología
                                      </option>
                                      <option value="30">
                                        Medicina Física y Rehabilitación
                                      </option>
                                      <option value="31">
                                        Medicina Interna
                                      </option>
                                      <option value="32">
                                        Medicina Preventiva y Salud Pública
                                      </option>
                                    </select>
                                  </div>
                                </div>
                              </div>

                              <div class="row">
                                <div class="col">
                                  <div class="form-group">
                                    <label class="form-label float-left ml-2"
                                      >Departamento</label
                                    >
                                    <select
                                      class="form-control"
                                      v-model="
                                        solicitud.departamento_solicitante
                                      "
                                      required
                                    >
                                      <option value="1">
                                        Dirección General
                                      </option>
                                      <option value="2">
                                        Junta de Gobierno
                                      </option>
                                      <option value="3">
                                        Comiés Hospitalarios
                                      </option>
                                      <option value="4">
                                        Comiés de Transplantes
                                      </option>
                                      <option value="5">
                                        Departamento de Calidad
                                      </option>
                                      <option value="6">
                                        Autenticacion a Quejas
                                      </option>
                                      <option value="7">
                                        Seguridad paciente
                                      </option>
                                      <option value="8">
                                        Programacion Quirurgica
                                      </option>
                                      <option value="9">
                                        Sub - Dirección Medica
                                      </option>
                                      <option value="10">
                                        Sub - Administrativa
                                      </option>
                                      <option value="11">
                                        División de Medicina Interna
                                      </option>
                                      <option value="12">
                                        División de Pediatía
                                      </option>
                                      <option value="13">
                                        Servicio de Traumatología
                                      </option>
                                      <option value="14">
                                        División de Cirugía
                                      </option>
                                      <option value="15">
                                        Servicio de Urgencias Adultos
                                      </option>
                                      <option value="16">
                                        Terapia Intensiva
                                      </option>
                                      <option value="17">
                                        Quirófano y Anestesiología
                                      </option>
                                      <option value="18">
                                        Terapia Intermedia
                                      </option>
                                      <option value="19">
                                        Servicio de Urgencias Pediátricas
                                      </option>
                                      <option value="20">
                                        Centro de Mezclas
                                      </option>
                                      <option value="21">
                                        Radiología e imagen
                                      </option>
                                      <option value="22">Genética</option>
                                      <option value="23">
                                        Laboratorio de Análisis Clinicos
                                      </option>
                                      <option value="24">Hemodialisis</option>
                                      <option value="25">
                                        Laboratorio de Patología
                                      </option>
                                      <option value="26">
                                        Rehabilitación Pulmonar
                                      </option>
                                      <option value="27">
                                        Medicina Genómica
                                      </option>
                                      <option value="28">
                                        Banco de Sangre
                                      </option>
                                      <option value="29">
                                        Laboratorio Histocompatibilidad
                                      </option>
                                      <option value="30">Aféresis</option>
                                      <option value="31">Tele-Robotica</option>
                                      <option value="32">
                                        Jefatura de Enseñanza Médica
                                      </option>
                                      <option value="33">
                                        Ética e Investigación
                                      </option>
                                      <option value="34">
                                        Consulta Externa
                                      </option>
                                      <option value="35">
                                        Terapia y Rehabilitacion Fisica
                                      </option>
                                      <option value="36">Medicina Legal</option>
                                      <option value="37">Trabajo Social</option>
                                      <option value="38">UVEH</option>
                                      <option value="39">CIES</option>
                                      <option value="40">
                                        Comunicacion Social
                                      </option>
                                      <option value="41">
                                        Violencia Intrafamiliar
                                      </option>
                                      <option value="42">
                                        Jefatura de Enfermeria
                                      </option>
                                      <option value="43">
                                        Sub-Jefatura de Enfermeria
                                      </option>
                                      <option value="44">
                                        Supervisoras de Turno
                                      </option>
                                      <option value="45">
                                        Coordinación Enseñanza Enfermeria
                                      </option>
                                      <option value="46">
                                        Jefas de Servicio
                                      </option>
                                      <option value="47">
                                        Clinicas y Programas
                                      </option>
                                      <option value="48">
                                        Recursos Humanos
                                      </option>
                                      <option value="49">Dietética</option>
                                      <option value="50">
                                        Farmacia Intrahospitalaria
                                      </option>
                                      <option value="51">
                                        Coordinación de Asuntos Jurídicos y
                                        Administrativos
                                      </option>
                                      <option value="52">
                                        Biomédica, Conservación y Mantenimiento
                                      </option>
                                      <option value="53">Validación</option>
                                      <option value="54">
                                        Recursos Materiales
                                      </option>
                                      <option value="55">
                                        Servicios Generales
                                      </option>
                                      <option value="56">
                                        Recursos Financieros
                                      </option>
                                      <option value="57">
                                        Departamento Adtvo. Hemodinamia
                                      </option>
                                      <option value="58">
                                        Relaciones Públicas
                                      </option>
                                      <option value="59">
                                        Farmacia HGC Seguro Popular
                                      </option>
                                      <option value="60">
                                        Enlace Administrativo
                                      </option>
                                      <option value="61">Informatica</option>
                                      <option value="62">
                                        Registros Médicos
                                      </option>
                                      <option value="63">
                                        Archivo y Correspondencia
                                      </option>
                                      <option value="64">Vigilancia</option>
                                      <option value="65">Almacen</option>
                                      <option value="66">
                                        Insumos Especializados
                                      </option>
                                      <option value="67">Intendencia</option>
                                      <option value="68">Ropería</option>
                                      <option value="69">Nivel 7</option>
                                      <option value="70">
                                        Control Gastos Catastroficos
                                      </option>
                                      <option value="71">
                                        Tecnologia en la Salud
                                      </option>
                                    </select>
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
                                      required
                                    />
                                  </div>
                                </div>
                              </div>

                              <div class="row">
                                <div class="col">
                                  <div class="form-group">
                                    <label class="form-label float-left ml-2"
                                      >Estatus</label
                                    >
                                    <select
                                      class="form-control"
                                      v-model="solicitud.estatus"
                                      required
                                    >
                                      <option value="Aprobado">Aprobado</option>
                                      <option value="En Proceso">
                                        En Proceso
                                      </option>
                                      <option value="No Aprobado">
                                        No Aprobado
                                      </option>
                                      <option value="Cancelado">
                                        Cancelado
                                      </option>
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
                                      required
                                    />
                                  </div>
                                </div>
                              </div>

                              <div class="row">
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
                      </b-row>
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
                    </div>
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

import moment from "moment";

//import CountUp from 'vue-countup-v3'
const body = document.getElementsByTagName("body");

// datos_grafuico = genera_datos_gragfica(dataset)

export default {
  name: "AprobacionServiciosHospitalarios",
  components: { IqCard, ApexChart },
  data() {
    return {
      solicitudes: [],
      currentSolicitud: {},
      api: "http://127.0.0.1:8000/hospital/api",
      solicitud: {
        id: "",
        servicio_paciente: "",
        departamento_solicitante: "",
        fecha_solicitud: "",
        estatus: "",
        comentarios: "",
        fecha_aprobacion: "",
      },
      searchInput: "",
      currentPage: 1, // Página actual
      resultsPerPage: 10, // Resultados por página

      config: {
        dateFormat: "Y-m-d",
        inline: true,
      },

      chart5: {
        series: [
          { name: "Solcitudes Aprobadas", data: [] },
          { name: "En proceso de aprobación", data: [] },
          { name: "Solicitudes Negadas", data: [] },
          { name: "Solicitudes Canceladas", data: [] },
        ],

        colors: ["#089bab", "#FC9F5B", "#FF0000", "#9b9b9b"],
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
          type: "text",
          categories: [
            "Enero",
            "Febrero",
            "Marzo",
            "Abril",
            "Mayo",
            "Junio",
            "Julio",
            "Agosto",
            "Septiembre",
            "Octubre",
            "Noviembre",
            "Diciembre",
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
    };
  },

  mounted() {
    xray.index();
    body[0].classList.add("sidebar-main-menu");
    console.log("DOM is rendered");
    console.log(Object.keys(this.currentSolicitud).length);
    this.getVista();
  },

  unmounted() {
    body[0].classList.remove("sidebar-main-menu");
  },

  created() {
    console.log("DOM is created");
    this.getSolicitudes();
    this.getVista();
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
      // Verifica si no se ha insertado ninguna fecha y hora en fecha_aprobacion
      if (!this.solicitud.fecha_aprobacion) {
        this.solicitud.fecha_aprobacion = null; // Establece fecha_aprobacion como null
      }
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
            servicio_paciente: solicitud.servicio_paciente,
            departamento_solicitante: solicitud.departamento_solicitante,
            fecha_solicitud: solicitud.fecha_solicitud,
            estatus: solicitud.estatus,
            comentarios: solicitud.comentarios,
            // Verifica si la fecha de aprobación existe, si no, establece como null
            fecha_aprobacion: solicitud.fecha_aprobacion
              ? solicitud.fecha_aprobacion
              : null,
          };
        }
      });
    },

    updateSolicitud(id) {
      // Verifica si no se ha insertado ninguna fecha y hora en fecha_aprobacion
      if (!this.currentSolicitud.fecha_aprobacion) {
        this.currentSolicitud.fecha_aprobacion = null; // Establece fecha_aprobacion como null
      }
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
      // Buscar la solicitud que se va a eliminar
      const solicitud = this.solicitudes.find(
        (solicitud) => solicitud.id === id
      );

      // Mostrar una alerta de confirmación antes de eliminar la solicitud
      if (
        confirm(`¿Deseas eliminar la solicitud? 
                  - ID: ${solicitud.id}
                  - Servicio: ${solicitud.servicio_paciente}
                  - Departamento solicitante: ${
                    solicitud.departamento_solicitante
                  }
                  - Fecha de Solicitud: ${this.formatearFecha(
                    solicitud.fecha_solicitud
                  )}
                  - Estatus: ${solicitud.estatus}
                  - Comentario: ${solicitud.comentarios}
                  - Fecha de Aprobación: ${this.formatearFecha(
                    solicitud.fecha_aprobacion
                  )}`)
      ) {
        axios
          .delete(this.api + `/v1AprobacionesServicios/${id}/`, id)
          .then((response) => {
            console.log(response.data);
            this.getSolicitudes();
          })
          .catch((error) => {
            console.log(error);
          });
      }
    },

    getVista() {
      axios
        .get("http://127.0.0.1:8000/hospital/api/v1vista_estado_solicitudes/")
        .then((response) => {
          console.log(response.data);
          console.log("envio");

          // Reiniciar datos de la gráfica
          this.chart5.series.forEach((serie) => {
            serie.data = [];
          });

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
  },

  computed: {
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
      return Math.ceil(this.solicitudes.length / this.resultsPerPage);
    },

    filteredData() {
      // Modifica la función para filtrar según el término de búsqueda
      console.log("Search input:", this.searchInput);
      return this.solicitudes.filter((solicitud) => {
        const matchSearchInput = Object.values(solicitud).some((value) => {
          return String(value)
            .toLowerCase()
            .includes(this.searchInput.toLowerCase());
        });

        // Obtener el texto correspondiente al servicio_paciente_id
        let servicioText = "";
        switch (solicitud.servicio_paciente) {
          case 1:
            servicioText = "Urgencias";
            break;
          case 2:
            servicioText = "Consulta Externa";
            break;
          case 3:
            servicioText = "Hospitalización";
            break;
          case 4:
            servicioText = "Cirugía";
            break;
          case 5:
            servicioText = "Laboratorio Clínico";
            break;
          case 6:
            servicioText = "Radiología";
            break;
          case 7:
            servicioText = "Farmacia";
            break;
          case 8:
            servicioText = "Rehabilitación";
            break;
          case 9:
            servicioText = "Cuidados Intensivos";
            break;
          case 10:
            servicioText = "Atención Pediática";
            break;
          case 11:
            servicioText = "Atención Materno-Infantil";
            break;
          case 12:
            servicioText = "Atención Geriátrica";
            break;
          case 13:
            servicioText = "Psiquiatría y Salud Mental";
            break;
          case 14:
            servicioText = "Banco de Sangre";
            break;
          case 15:
            servicioText = "Ginecología y Obstetricia";
            break;
          case 16:
            servicioText = "Quirófano";
            break;
          case 17:
            servicioText = "Tanatología";
            break;
          case 18:
            servicioText = "Infectología";
            break;
          case 19:
            servicioText = "Cardiología";
            break;
          case 20:
            servicioText = "Neurología";
            break;
          case 21:
            servicioText = "Endocrinología";
            break;
          case 22:
            servicioText = "Oftamología";
            break;
          case 23:
            servicioText = "Otorrinología";
            break;
          case 24:
            servicioText = "Gastroenterología";
            break;
          case 25:
            servicioText = "Nefrología";
            break;
          case 26:
            servicioText = "Dermatología";
            break;
          case 27:
            servicioText = "Hematología";
            break;
          case 28:
            servicioText = "Oncología";
            break;
          case 29:
            servicioText = "Alergología e Inmunología";
            break;
          case 30:
            servicioText = "Medicina Física y Rehabilitación";
            break;
          case 31:
            servicioText = "Medicina Interna";
            break;
          case 32:
            servicioText = "Medicina Preventiva y Salud Pública";
            break;

          default:
            servicioText = String(solicitud.servicio_paciente); // Si no coincide con ninguno, mantener el valor original
        }

        const matchServicioId = servicioText
          .toLowerCase()
          .includes(this.searchInput.toLowerCase());

        let departamentoText = "";
        switch (solicitud.departamento_solicitante) {
          case 1:
            departamentoText = "Dirección General";
            break;
          case 2:
            departamentoText = "Junta de Gobierno";
            break;
          case 3:
            departamentoText = "Comiés Hospitalarios";
            break;
          case 4:
            departamentoText = "Comiés de Transplantes";
            break;
          case 5:
            departamentoText = "Departamento de Calidad";
            break;
          case 6:
            departamentoText = "Autenticacion a Quejas";
            break;
          case 7:
            departamentoText = "Seguridad paciente";
            break;
          case 8:
            departamentoText = "Programacion Quirurgica";
            break;
          case 9:
            departamentoText = "Sub - Dirección Medica";
            break;
          case 10:
            departamentoText = "Sub - Administrativa";
            break;
          case 11:
            departamentoText = "División de Medicina Interna";
            break;
          case 12:
            departamentoText = "División de Pediatía";
            break;
          case 13:
            departamentoText = "Servicio de Traumatología";
            break;
          case 14:
            departamentoText = "División de Cirugía";
            break;
          case 15:
            departamentoText = "Servicio de Urgencias Adultos";
            break;
          case 16:
            departamentoText = "Terapia Intensiva";
            break;
          case 17:
            departamentoText = "Quirófano y Anestesiología";
            break;
          case 18:
            departamentoText = "Terapia Intermedia";
            break;
          case 19:
            departamentoText = "Servicio de Urgencias Pediátricas";
            break;
          case 20:
            departamentoText = "Centro de Mezclas";
            break;
          case 21:
            departamentoText = "Radiología e imagen";
            break;
          case 22:
            departamentoText = "Genética";
            break;
          case 23:
            departamentoText = "Laboratorio de Análisis Clinicos";
            break;
          case 24:
            departamentoText = "Hemodialisis";
            break;
          case 25:
            departamentoText = "Laboratorio de Patología";
            break;
          case 26:
            departamentoText = "Rehabilitación Pulmonar";
            break;
          case 27:
            departamentoText = "Medicina Genómica";
            break;
          case 28:
            departamentoText = "Banco de Sangre";
            break;
          case 29:
            departamentoText = "Laboratorio Histocompatibilidad";
            break;
          case 30:
            departamentoText = "Aféresis";
            break;
          case 31:
            departamentoText = "Tele-Robotica";
            break;
          case 32:
            departamentoText = "Jefatura de Enseñanza Médica";
            break;
          case 33:
            departamentoText = "Ética e Investigacion";
            break;
          case 34:
            departamentoText = "Consulta Externa";
            break;
          case 35:
            departamentoText = "Terapia y Rehabilitacion Fisica";
            break;
          case 36:
            departamentoText = "Medicina Legal";
            break;
          case 37:
            departamentoText = "Trabajo Social";
            break;
          case 38:
            departamentoText = "UVEH";
            break;
          case 39:
            departamentoText = "CIES";
            break;
          case 40:
            departamentoText = "Comunicacion Social";
            break;
          case 41:
            departamentoText = "Violencia Intrafamiliar";
            break;
          case 42:
            departamentoText = "Jefatura de Enfermeria";
            break;
          case 43:
            departamentoText = "Sub-jefatura de Enfermeria";
            break;
          case 44:
            departamentoText = "Supervisoras de Turno";
            break;
          case 45:
            departamentoText = "Coordinación Enseñanza Enfermeria";
            break;
          case 46:
            departamentoText = "Jefas de Servicio";
            break;
          case 47:
            departamentoText = "Clinicas y Programas";
            break;
          case 48:
            departamentoText = "Recursos Humanos";
            break;
          case 49:
            departamentoText = "Dietética";
            break;
          case 50:
            departamentoText = "Farmacia Intrahospitalaria";
            break;
          case 51:
            departamentoText =
              "Coordinación de Asuntos Jurídicos y Administrativos";
            break;
          case 52:
            departamentoText = "Biomédica, Conservación y Mantenimiento";
            break;
          case 53:
            departamentoText = "Validación";
            break;
          case 54:
            departamentoText = "Recursos Materiales";
            break;
          case 55:
            departamentoText = "Servicios Generales";
            break;
          case 56:
            departamentoText = "Recursos Financieros";
            break;
          case 57:
            departamentoText = "Departamento Adtvo. Hemodinamia";
            break;
          case 58:
            departamentoText = "Relaciones Públicas";
            break;
          case 59:
            departamentoText = "Farmacia HGC Seguro Popular";
            break;
          case 60:
            departamentoText = "Enlace Administrativo";
            break;
          case 61:
            departamentoText = "Informatica";
            break;
          case 62:
            departamentoText = "Registros Médicos";
            break;
          case 63:
            departamentoText = "Archivo y Correspondencia";
            break;
          case 64:
            departamentoText = "Vigilancia";
            break;
          case 65:
            departamentoText = "Almacen";
            break;
          case 66:
            departamentoText = "Insumos Especializados";
            break;
          case 67:
            departamentoText = "Intendencia";
            break;
          case 68:
            departamentoText = "Ropería";
            break;
          case 69:
            departamentoText = "Nivel 7";
            break;
          case 70:
            departamentoText = "Control Gastos Catastroficos";
            break;
          case 71:
            departamentoText = "Tecnologia en la Salud";
            break;

          default:
            departamentoText = String(solicitud.departamento_solicitante);
        }

        const matchDepartamentoId = departamentoText
          .toLowerCase()
          .includes(this.searchInput.toLowerCase());

        // console.log("Entrada de búsqueda de coincidencias:", matchSearchInput);
        // console.log(
        //   "Entrada de búsqueda de servicio_paciente_id:",
        //   matchServicioId
        // );
        // console.log(
        //   "Entrada de búsqueda de departamento_solicitante:",
        //   matchDepartamentoId
        // );

        return matchSearchInput || matchServicioId || matchDepartamentoId;
      });
    },
  },
};
</script>
/* eslint-disable */
