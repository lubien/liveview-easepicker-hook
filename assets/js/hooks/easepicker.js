export const hooks = {
  mounted() {
    this.picker = new easepick.create({
      element: this.el,
      setup: (picker) => {
        picker.on("select", (e) => {
          const event = new Event("input", {
            bubbles: true,
            cancelable: true,
          });

          this.el.dispatchEvent(event);
        });
      },
      css: [
        "https://cdn.jsdelivr.net/npm/@easepick/core@1.2.1/dist/index.css",
        "https://cdn.jsdelivr.net/npm/@easepick/range-plugin@1.2.1/dist/index.css",
        "https://cdn.jsdelivr.net/npm/@easepick/preset-plugin@1.2.1/dist/index.css",
      ],
      plugins: ["RangePlugin", "PresetPlugin"],
      PresetPlugin: {
        position: "left",
      },
    });
  },
};
