const nomoCliConfig = {
    deployTargets: {
        production: {
            rawSSH: {
                sshHost: process.env.SSH_TARGET_SWAP_THEME,
                sshBaseDir: "/var/www/html",
                publicBaseUrl: "https://customtheme.nomo.zone",
                hybrid: true,
            },
        },
    },
};

module.exports = nomoCliConfig;