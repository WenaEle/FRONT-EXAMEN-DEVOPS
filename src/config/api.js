// Centraliza la resolución de las URLs de los backends.
// En producción (contenedor nginx) estos valores llegan desde env-config.js,
// generado en el arranque del contenedor a partir de las variables de entorno
// BACK_VENTAS_URL / BACK_DESPACHOS_URL (ver docker-entrypoint.sh).
// En desarrollo local (npm run dev) caen a los backends locales.
const env = typeof window !== "undefined" ? window.__ENV__ : undefined;

export const BACK_VENTAS_URL = env?.BACK_VENTAS_URL || "http://localhost:8080";
export const BACK_DESPACHOS_URL = env?.BACK_DESPACHOS_URL || "http://localhost:8081";
