_:{
services.greetd = {
  enable = true;
  settings = rec {
    initial_session = {
      command = "Hyprland";
      user = "Polaris";
    };
    default_session = initial_session;
  };
};
}