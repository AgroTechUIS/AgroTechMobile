Map<String, Map<String, dynamic>> mapResponses = {
  "api/actividades/usuario/1": {
    "actividades": [
      {
        "id": 23,
        "nombre": "Labranza",
        "finca": "Finca del sol",
        "zona": "Zona A",
        "fecha": "2023-08-21 22:30:00",
        "estado": "pendiente",
        "periodico": "2 dias"
      },
      {
        "id": 24,
        "nombre": "Riego",
        "finca": "El paraíso",
        "zona": "Zona B",
        "fecha": "2023-08-21 22:31:00",
        "estado": "pendiente",
        "periodico": "3 dias"
      },
      {
        "id": 25,
        "nombre": "Poda",
        "finca": "El paraíso",
        "zona": "Zona C",
        "fecha": "2023-08-21 22:32:00",
        "estado": "realizado",
        "periodico": "lunes"
      }
    ]
  },
  "api/cultivos/empresa/11": {
    "cultivos": [
      {
        "idCultivo": 1,
        "planta": "Naranja",
        "finca": "Finca el sol",
        "direccion": "Calle principal 12",
        "centroPoblado": "palmas",
        "municipio": "",
        "zona": "C",
        "fechaInicio": "12/12/2012",
        "fechaFin": "12/12/2012"
      },
      {
        "idCultivo": 2,
        "planta": "Mora",
        "finca": "Finca las palcas",
        "direccion": "Cra 22 #12-34",
        "centroPoblado": "palmas",
        "municipio": "",
        "zona": "A",
        "fechaInicio": "12/12/2012",
        "fechaFin": "12/12/2012"
      },
      {
        "idCultivo": 3,
        "planta": "Mora",
        "finca": "Finca las palcas",
        "direccion": "Cra 22 #12-34",
        "centroPoblado": "palmas",
        "municipio": "",
        "zona": "A",
        "fechaInicio": "12/12/2012",
        "fechaFin": "12/12/2012"
      }
    ]
  },
  "api/actividades/cultivo/1": {
    "actividades": [
      {
        "id": 20,
        "nombre": "Labranza",
        "finca": "Finca del sol",
        "zona": "Zona A",
        "fecha": "2023-09-08 14:27:00",
        "estado": "",
        "obrero": "Carlos Martínez Rivera"
      },
      {
        "id": 20,
        "nombre": "Riego",
        "finca": "El paraíso",
        "zona": "Zona B",
        "fecha": "2023-12-25 14:27:00",
        "estado": "",
        "obrero": "Carlos Martínez Rivera"
      },
      {
        "id": 21,
        "nombre": "Labranza",
        "finca": "El paraíso",
        "zona": "Zona B",
        "fecha": "2023-12-25 14:27:00",
        "estado": "",
        "obrero": "Carlos Martínez Rivera"
      }
    ]
  },
  "api/actividades/cultivo/2": {
    "actividades": [
      {"id": 20, "nombre": "Labranza", "finca": "Finca del", "zona": "Zona A", "estado": "", "obrero": "Ana"},
      {"id": 20, "nombre": "Riego", "finca": "Finca del", "zona": "Zona B", "estado": "", "obrero": "Ana"},
      {"id": 21, "nombre": "Riego", "finca": "Finca del", "zona": "Zona B", "estado": "", "obrero": "Ana"},
      {"id": 21, "nombre": "Riego", "finca": "Finca del", "zona": "Zona B", "estado": "", "obrero": "Ana"},
      {"id": 21, "nombre": "Riego", "finca": "Finca del", "zona": "Zona B", "estado": "", "obrero": "Ana"}
    ]
  },
  "api/actividades/cultivo/3": {
    "actividades": [
      {"id": 20, "nombre": "Labranza", "finca": "Finca del", "zona": "Zona A", "estado": "", "obrero": "Ana"},
      {"id": 20, "nombre": "Riego", "finca": "Finca del", "zona": "Zona B", "estado": "", "obrero": "Ana"},
      {"id": 21, "nombre": "Riego", "finca": "Finca del", "zona": "Zona B", "estado": "", "obrero": "Ana"},
      {"id": 21, "nombre": "Riego", "finca": "Finca del", "zona": "Zona B", "estado": "", "obrero": "Ana"},
      {"id": 21, "nombre": "Riego", "finca": "Finca del", "zona": "Zona B", "estado": "", "obrero": "Ana"}
    ]
  },
  "api/facturas/empresa/11": {
    "facturas": [
      {
        "id": 458,
        "numeroFactura": "0955455444",
        "fecha": "2023-09-08 15:27:00",
        "tipo": "compra-cliente",
        "total": 3000000.0,
        "compraCliente": [
          {"id": 12, "cliente": "Elena González", "unidades": 100, "planta": "mora", "precio": 20.0},
          {"id": 13, "cliente": "Elena González", "unidades": 100, "planta": "lechuga", "precio": 1000.0}
        ]
      },
      {
        "id": 458,
        "numeroFactura": "0955455444",
        "fecha": "2023-09-08 14:27:00",
        "tipo": "compra-cliente",
        "total": 500000.0,
        "compraCliente": [
          {"id": 12, "cliente": "Elena González", "unidades": 100, "planta": "mora", "precio": 2000.0},
          {"id": 13, "cliente": "Elena González", "unidades": 100, "planta": "lechuga", "precio": 1000.0}
        ]
      },
      {
        "id": 458,
        "numeroFactura": "0955455444",
        "fecha": "2023-09-08 13:27:00",
        "tipo": "compra-cliente",
        "total": 300000.0,
        "compraCliente": [
          {"id": 12, "cliente": "Elena González", "unidades": 100, "planta": "mora", "precio": 2000.0}
        ]
      },
      {
        "id": 452,
        "numeroFactura": "08554557777",
        "fecha": "2023-09-08 01:27:00",
        "tipo": "venta-proveedor",
        "total": 10000.0,
        "ventaProveedor": [
          {"id": 12, "proveedor": "Isabella Santos", "unidades": 100, "insumo": "semillas-mora", "costo": 2000.0},
          {"id": 13, "proveedor": "Isabella Santos", "unidades": 100, "insumo": "ambono", "costo": 1000.0}
        ]
      },
      {
        "id": 453,
        "numeroFactura": "08554557778",
        "fecha": "2023-09-08 17:27:00",
        "tipo": "venta-proveedor",
        "total": 2000000.0,
        "ventaProveedor": [
          {"id": 15, "proveedor": "Lucas Martinez", "unidades": 100, "insumo": "semillas-espinaca", "costo": 2000.0},
          {"id": 16, "proveedor": "Lucas Martinez", "unidades": 100, "insumo": "ambono", "costo": 1000.0}
        ]
      },
      {
        "id": 458,
        "numeroFactura": "0955455444",
        "fecha": "2023-09-08 15:27:00",
        "tipo": "compra-cliente",
        "total": 3000000.0,
        "compraCliente": [
          {"id": 12, "cliente": "Elena González", "unidades": 100, "planta": "mora", "precio": 20.0},
          {"id": 13, "cliente": "Elena González", "unidades": 100, "planta": "lechuga", "precio": 1000.0}
        ]
      },
      {
        "id": 458,
        "numeroFactura": "0955455444",
        "fecha": "2023-09-08 15:27:00",
        "tipo": "compra-cliente",
        "total": 3000000.0,
        "compraCliente": [
          {"id": 12, "cliente": "Elena González", "unidades": 100, "planta": "mora", "precio": 20.0},
          {"id": 13, "cliente": "Elena González", "unidades": 100, "planta": "lechuga", "precio": 1000.0}
        ]
      },
      {
        "id": 458,
        "numeroFactura": "0955455444",
        "fecha": "2023-09-08 15:27:00",
        "tipo": "compra-cliente",
        "total": 3000000.0,
        "compraCliente": [
          {"id": 12, "cliente": "Elena González", "unidades": 100, "planta": "mora", "precio": 20.0},
          {"id": 13, "cliente": "Elena González", "unidades": 100, "planta": "lechuga", "precio": 1000.0}
        ]
      },
      {
        "id": 452,
        "numeroFactura": "08554557777",
        "fecha": "2023-09-08 15:27:00",
        "tipo": "factura-obrero",
        "total": 300000.0,
        "actividadObrero": {
          "id": 23,
          "nombre": "Labranza",
          "finca": "Finca del sol",
          "zona": "Zona A",
          "fecha": "2023-09-08 15:27:00",
          "estado": "Completo",
          "obrero": "Carlos Martínez Rivera"
        }
      }
    ]
  },
  "api/facturas/cultivo/1": {
    "facturas": [
      {
        "id": 458,
        "numeroFactura": "0955455444",
        "fecha": "2023-09-08 15:27:00",
        "tipo": "compra-cliente",
        "total": 3000000.0,
        "compraCliente": [
          {"id": 12, "cliente": "Elena González", "unidades": 100, "planta": "mora", "precio": 20.0},
          {"id": 13, "cliente": "Elena González", "unidades": 100, "planta": "lechuga", "precio": 1000.0}
        ]
      },
      {
        "id": 458,
        "numeroFactura": "0955455444",
        "fecha": "2023-09-08 14:27:00",
        "tipo": "compra-cliente",
        "total": 500000.0,
        "compraCliente": [
          {"id": 12, "cliente": "Elena González", "unidades": 100, "planta": "mora", "precio": 2000.0},
          {"id": 13, "cliente": "Elena González", "unidades": 100, "planta": "lechuga", "precio": 1000.0}
        ]
      },
      {
        "id": 458,
        "numeroFactura": "0955455444",
        "fecha": "2023-09-08 13:27:00",
        "tipo": "compra-cliente",
        "total": 300000.0,
        "compraCliente": [
          {"id": 12, "cliente": "Elena González", "unidades": 100, "planta": "mora", "precio": 2000.0}
        ]
      },
      {
        "id": 452,
        "numeroFactura": "08554557777",
        "fecha": "2023-09-08 01:27:00",
        "tipo": "venta-proveedor",
        "total": 100000.0,
        "ventaProveedor": [
          {"id": 12, "proveedor": "Isabella Santos", "unidades": 100, "insumo": "semillas-mora", "costo": 2000.0},
          {"id": 13, "proveedor": "Isabella Santos", "unidades": 100, "insumo": "ambono", "costo": 1000.0}
        ]
      },
      {
        "id": 453,
        "numeroFactura": "08554557778",
        "fecha": "2023-09-08 17:27:00",
        "tipo": "venta-proveedor",
        "total": 2000000.0,
        "ventaProveedor": [
          {"id": 15, "proveedor": "Lucas Martinez", "unidades": 100, "insumo": "semillas-espinaca", "costo": 2000.0},
          {"id": 16, "proveedor": "Lucas Martinez", "unidades": 100, "insumo": "ambono", "costo": 1000.0}
        ]
      }
    ]
  },
  "api/facturas/cultivo/2": {
    "facturas": [
      {
        "id": 458,
        "numeroFactura": "0955455444",
        "fecha": "2023-09-08 15:27:00",
        "tipo": "compra-cliente",
        "total": 3000000.0,
        "compraCliente": [
          {"id": 12, "cliente": "Elena González", "unidades": 100, "planta": "mora", "precio": 20.0},
          {"id": 13, "cliente": "Elena González", "unidades": 100, "planta": "lechuga", "precio": 1000.0}
        ]
      },
      {
        "id": 458,
        "numeroFactura": "0955455444",
        "fecha": "2023-09-08 14:27:00",
        "tipo": "compra-cliente",
        "total": 500000.0,
        "compraCliente": [
          {"id": 12, "cliente": "Elena González", "unidades": 100, "planta": "mora", "precio": 2000.0},
          {"id": 13, "cliente": "Elena González", "unidades": 100, "planta": "lechuga", "precio": 1000.0}
        ]
      },
      {
        "id": 458,
        "numeroFactura": "0955455444",
        "fecha": "2023-09-08 13:27:00",
        "tipo": "compra-cliente",
        "total": 300000.0,
        "compraCliente": [
          {"id": 12, "cliente": "Elena González", "unidades": 100, "planta": "mora", "precio": 2000.0}
        ]
      },
      {
        "id": 452,
        "numeroFactura": "08554557777",
        "fecha": "2023-09-08 01:27:00",
        "tipo": "venta-proveedor",
        "total": 100000.0,
        "ventaProveedor": [
          {"id": 12, "proveedor": "Isabella Santos", "unidades": 100, "insumo": "semillas-mora", "costo": 2000.0},
          {"id": 13, "proveedor": "Isabella Santos", "unidades": 100, "insumo": "ambono", "costo": 1000.0}
        ]
      },
      {
        "id": 453,
        "numeroFactura": "08554557778",
        "fecha": "2023-09-08 17:27:00",
        "tipo": "venta-proveedor",
        "total": 2000000.0,
        "ventaProveedor": [
          {"id": 15, "proveedor": "Lucas Martinez", "unidades": 100, "insumo": "semillas-espinaca", "costo": 2000.0},
          {"id": 16, "proveedor": "Lucas Martinez", "unidades": 100, "insumo": "ambono", "costo": 1000.0}
        ]
      }
    ]
  },
  "api/facturas/cultivo/3": {
    "facturas": [
      {
        "id": 458,
        "numeroFactura": "0955455444",
        "fecha": "2023-09-08 15:27:00",
        "tipo": "compra-cliente",
        "total": 3000000.0,
        "compraCliente": [
          {"id": 12, "cliente": "Elena González", "unidades": 100, "planta": "mora", "precio": 20.0},
          {"id": 13, "cliente": "Elena González", "unidades": 100, "planta": "lechuga", "precio": 1000.0}
        ]
      },
      {
        "id": 458,
        "numeroFactura": "0955455444",
        "fecha": "2023-09-08 14:27:00",
        "tipo": "compra-cliente",
        "total": 500000.0,
        "compraCliente": [
          {"id": 12, "cliente": "Elena González", "unidades": 100, "planta": "mora", "precio": 2000.0},
          {"id": 13, "cliente": "Elena González", "unidades": 100, "planta": "lechuga", "precio": 1000.0}
        ]
      },
      {
        "id": 458,
        "numeroFactura": "0955455444",
        "fecha": "2023-09-08 13:27:00",
        "tipo": "compra-cliente",
        "total": 300000.0,
        "compraCliente": [
          {"id": 12, "cliente": "Elena González", "unidades": 100, "planta": "mora", "precio": 2000.0}
        ]
      },
      {
        "id": 452,
        "numeroFactura": "08554557777",
        "fecha": "2023-09-08 01:27:00",
        "tipo": "venta-proveedor",
        "total": 100000.0,
        "ventaProveedor": [
          {"id": 12, "proveedor": "Isabella Santos", "unidades": 100, "insumo": "semillas-mora", "costo": 2000.0},
          {"id": 13, "proveedor": "Isabella Santos", "unidades": 100, "insumo": "ambono", "costo": 1000.0}
        ]
      },
      {
        "id": 453,
        "numeroFactura": "08554557778",
        "fecha": "2023-09-08 17:27:00",
        "tipo": "venta-proveedor",
        "total": 2000000.0,
        "ventaProveedor": [
          {"id": 15, "proveedor": "Lucas Martinez", "unidades": 100, "insumo": "semillas-espinaca", "costo": 2000.0},
          {"id": 16, "proveedor": "Lucas Martinez", "unidades": 100, "insumo": "ambono", "costo": 1000.0}
        ]
      }
    ]
  },
  "api/usuarios/obrero/11": {
    "obreros": [
      {"nombre": "Andres", "apellido": "Sandoval", "cedula": "44156445", "correo": ""},
      {"nombre": "Juan", "apellido": "Pérez", "cedula": "33221100", "correo": "juanperez@example.com"},
      {"nombre": "María", "apellido": "Gómez", "cedula": "55443322", "correo": "mariagomez@example.com"}
    ]
  },
};
