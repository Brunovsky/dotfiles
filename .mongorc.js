function prompt() {
    const host = db.serverStatus().host;
    const user = db.runCommand({ connectionStatus: 1 }).authInfo.authenticatedUsers[0];

    if (user) {
        return user.user + "@" + host + " (" + db + ") $ ";
    }
    return "[no-one]" + "@" + host + " (" + db + ") > ";
}
