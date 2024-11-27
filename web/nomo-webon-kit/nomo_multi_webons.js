import { invokeNomoFunction, isFallbackModeActive, } from "./dart_interface.js";

/**
 * nomoLocalStorage provides a mechanism for sharing data between WebOns.
 * If a webon_id is passed to nomoLocalStorage.getItem, then it tries to read data from another WebOn with the given webon_id.
 * nomoLocalStorage can also be used as an alternative to the regular localStorage.
 */
export const nomoLocalStorage = {
    getItem: async function (key, options) {
        if (isFallbackModeActive()) {
            return localStorage.getItem(key);
        }
        const rawResult = await invokeNomoFunction("nomoGetItem", { key, options });
        return rawResult.value;
    },
    setItem: async function (key, value) {
        if (isFallbackModeActive()) {
            localStorage.setItem(key, value);
            return;
        }
        await invokeNomoFunction("nomoSetItem", { key, value });
    },
    removeItem: async function (key) {
        if (isFallbackModeActive()) {
            localStorage.removeItem(key);
            return;
        }
        await invokeNomoFunction("nomoRemoveItem", { key });
    },
};


const localStorageFunctions = {
    getItem: async function (key, options) {
        return localStorage.getItem(key);
    },
    setItem: async function (key, value) {
        localStorage.setItem(key, value);
        return;
    }
}

window.nomoSetLocalStorageItem = localStorageFunctions.setItem;
window.nomoGetLocalStorageItem = localStorageFunctions.getItem;
