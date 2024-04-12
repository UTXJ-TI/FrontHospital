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
                                  v-for="(solicitud, id) in paginatedData"
                                  :key="id"
                                  class="text-center"
                                >
                                  <td>{{ solicitud.id }}</td>
                                  <td class="text-center">
                                    <div
                                      v-if="
                                        solicitud.servicio_paciente_id === 1
                                      "
                                    >
                                      <h5>Urgencias</h5>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 2
                                      "
                                    >
                                      <span>Consulta Externa</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 3
                                      "
                                    >
                                      <span>Hospitalización</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 4
                                      "
                                    >
                                      <span>Cirugía</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 5
                                      "
                                    >
                                      <span>Laboratorio Clínico</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 6
                                      "
                                    >
                                      <span>Radiología</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 7
                                      "
                                    >
                                      <span>Farmacia</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 8
                                      "
                                    >
                                      <span>Rehabilitación</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 9
                                      "
                                    >
                                      <span>Cuidados Intensivos</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 10
                                      "
                                    >
                                      <span>Atención Pediática</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 11
                                      "
                                    >
                                      <span>Atención Materno-Infantil</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 12
                                      "
                                    >
                                      <span>Atención Geriatríca</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 13
                                      "
                                    >
                                      <span>Psiquiatría y Salud Mental</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 14
                                      "
                                    >
                                      <span>Banco de Sangre</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 15
                                      "
                                    >
                                      <span>Ginecología y Obstétricia</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 16
                                      "
                                    >
                                      <span>Quirófano</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 17
                                      "
                                    >
                                      <span>Tanatología</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 18
                                      "
                                    >
                                      <span>Infectología</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 19
                                      "
                                    >
                                      <span>Cardiología</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 20
                                      "
                                    >
                                      <span>Neurología</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 21
                                      "
                                    >
                                      <span>Endocrinología</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 22
                                      "
                                    >
                                      <span>Oftamología</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 23
                                      "
                                    >
                                      <span>Otorrinología</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 24
                                      "
                                    >
                                      <span>Gastroenterología</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 25
                                      "
                                    >
                                      <span>Nefrología</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 26
                                      "
                                    >
                                      <span>Dermatología</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 27
                                      "
                                    >
                                      <span>Hematología</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 28
                                      "
                                    >
                                      <span>Oncología</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 29
                                      "
                                    >
                                      <span>Alergología e Inmunología</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 30
                                      "
                                    >
                                      <span
                                        >Medicina Física y Rehabilitación</span
                                      >
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 31
                                      "
                                    >
                                      <span>Medicina Interna</span>
                                    </div>
                                    <div
                                      v-else-if="
                                        solicitud.servicio_paciente_id === 32
                                      "
                                    >
                                      <span
                                        >Medicina Preventiva y Salud
                                        Pública</span
                                      >
                                    </div>
                                    <div
                                      v-else
                                      class="col-12 col-md-6 col-lg-3"
                                    >
                                      {{ solicitud.servicio_paciente_id }}
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
                                  <td>{{ solicitud.fecha_solicitud }}</td>
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
                                    <input
                                      type="text"
                                      class="form-control"
                                      v-model="solicitud.servicio_paciente_id"
                                    />
                                  </div>
                                </div>
                              </div>

                              <div class="row">
                                <div class="col">
                                  <div class="form-group">
                                    <label class="form-label float-left ml-2"
                                      >Departamento</label
                                    >
                                    <input
                                      type="text"
                                      class="form-control"
                                      v-model="
                                        solicitud.departamento_solicitante
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
                                      type="datetime-local"
                                      class="form-control"
                                      v-model="solicitud.fecha_solicitud"
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
        servicio_paciente_id: "",
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
        .get("http://127.0.0.1:8000/hospital/api/v1vista_estado_solicitudes/")
        .then((response) => {
          console.log(response.data);
          console.log("envio");

          // Actualizar series de la gráfica con los datos obtenidos
          this.chart5.series = [
            { name: "Solcitudes Aprobadas", data: [] },
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
        switch (solicitud.servicio_paciente_id) {
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
            servicioText = String(solicitud.servicio_paciente_id); // Si no coincide con ninguno, mantener el valor original
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

        console.log("Entrada de búsqueda de coincidencias:", matchSearchInput);
        console.log(
          "Entrada de búsqueda de servicio_paciente_id:",
          matchServicioId
        );
        console.log(
          "Entrada de búsqueda de departamento_solicitante:",
          matchDepartamentoId
        );

        return matchSearchInput || matchServicioId || matchDepartamentoId;
      });
    },
  },
};
</script>
/* eslint-disable */
