{ firefox, ...}:

firefox.override {

  extraPolicies =
    import ./policies.nix;

  extraPrefs =
    builtins.readFile ./autoconfig.js;

}
