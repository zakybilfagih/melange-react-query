import { defineConfig } from "vite";
import { nodeResolve } from "@rollup/plugin-node-resolve";

export default defineConfig({
  plugins: [nodeResolve()],
  build: {
    outDir: "./dist",
  },
  server: {
    watch: {
      ignored: ["**/_opam"],
    },
  },
});
