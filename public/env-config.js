// Valores por defecto para desarrollo local (npm run dev).
// En el contenedor de producción este archivo es reemplazado en el arranque
// por docker-entrypoint.sh usando las variables de entorno reales.
window.__ENV__ = {
  BACK_VENTAS_URL: "http://localhost:8080",
  BACK_DESPACHOS_URL: "http://localhost:8081"
};
