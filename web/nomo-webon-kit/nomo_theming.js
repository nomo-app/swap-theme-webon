import { invokeNomoFunction, isFallbackModeActive } from "./dart_interface.js";
/**
 * Switches the Nomo App to a different theme.
 * It is recommended to call "injectNomoCSSVariables" after a theme has changed.
 */
export async function switchNomoTheme(args) {
    if (isFallbackModeActive()) {
        localStorage.setItem("nomoTheme", args.theme);
    }
    else {
        return await invokeNomoFunction("nomoSwitchTheme", args);
    }
}

export async function setNomoColors(args) {
    console.log("setNomoColors in JS function", args);
    return await invokeNomoFunction("nomoSetColors", args);
}

window.setNomoColors = setNomoColors;