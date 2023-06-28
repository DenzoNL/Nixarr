{ lib, ... }:

{
  options.nixarr = {
    domain = lib.mkOption {
      type = lib.types.str;
      default = "example.com";
      description = "The top level domain used for the services.";
    };

    email = lib.mkOption {
      type = lib.types.str;
      default = "example@example.com";
      description = "The email address used by Let's encrypt.";
    };
  };
}
